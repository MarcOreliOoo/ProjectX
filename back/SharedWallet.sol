// SPDX-License-Identifier: MIT
pragma solidity 0.8.11;

contract SharedWallet{

	struct Transaction {
		address to;
		uint256 value;
		//Status...
	}

	//List of owners of the contract, only those can call some of the functions
	address[] public owners; 
	mapping(address => bool) public isOwner;
	uint8 public confirmationNeeded;	

	//Amount of ethers per user
	mapping(address => uint256) public balancePerUser;

	//Todo : Emit event multiWallet built
	constructor(address[] memory _owners, uint8 _confirmationNeeded){
		require(_owners.length > 0, "owners required");
		require(_confirmationNeeded > 0 && _confirmationNeeded<= _owners.length, "confirmation number invalid");
		for(uint i;i<_owners.length; i++){
			require(_owners[i] != address(0),"owner is address(0)");
			require(!isOwner[_owners[i]],"owner is already listed");
			
			owners.push(_owners[i]);
			isOwner[_owners[i]] = true;
			
		}
		confirmationNeeded = _confirmationNeeded;
	}

	//Todo : Emit event receive Eth
	//Todo : handle receive for someone who isnt owners
	receive() external payable {
		if(isOwner[msg.sender]) {
			balancePerUser[msg.sender] += msg.value;
		}
	}

	//Todo : Emit event withdrawal
	//Todo : handle % amount of withdraw in function of starting percentage
	function withdraw(uint256 amount) public {
		require(isOwner[msg.sender],"not an owner");
		require(amount <= balancePerUser[msg.sender],"amount > user's balance");
				
		balancePerUser[msg.sender] -= amount;
		require(balancePerUser[msg.sender] >= 0,"user's balance <0");

		(bool success,) = payable(msg.sender).call{value:amount}("");
		require(success,"transaction failed");
	}

	

	/* ========== HELPERS ========== */
	function getBalance() external view returns (uint) {
		return address(this).balance;
	}


}

contract EtherWallet {
	address payable public owner;

	constructor() {
		owner = payable(msg.sender);
	}

	receive() external payable {}

	function withdraw(uint _amount) external {
		require(msg.sender == owner, "caller is not owner");
		payable(msg.sender).transfer(_amount);
	}

	function getBalance() external view returns (uint) {
		return address(this).balance;
	}
}

contract MultiSigWallet {
	event Deposit(address indexed sender, uint amount, uint balance);
	event SubmitTransaction(address indexed owner, uint indexed txIndex, address indexed to, uint value, bytes data);
	event ConfirmTransaction(address indexed owner, uint indexed txIndex);
	event RevokeConfirmation(address indexed owner, uint indexed txIndex);
	event ExecuteTransaction(address indexed owner, uint indexed txIndex);

	address[] public owners;
	mapping(address => bool) public isOwner;
	uint public numConfirmationsRequired;

	struct Transaction {
		address to;
		uint value;
		bytes data;
		bool executed;
		uint numConfirmations;
	}

	// mapping from tx index => owner => bool
	mapping(uint => mapping(address => bool)) public isConfirmed;

	Transaction[] public transactions;

	modifier onlyOwner() {
		require(isOwner[msg.sender], "not owner");
		_;
	}

	modifier txExists(uint _txIndex) {
		require(_txIndex < transactions.length, "tx does not exist");
		_;
	}

	modifier notExecuted(uint _txIndex) {
		require(!transactions[_txIndex].executed, "tx already executed");
		_;
	}

	modifier notConfirmed(uint _txIndex) {
		require(!isConfirmed[_txIndex][msg.sender], "tx already confirmed");
		_;
	}

	constructor(address[] memory _owners, uint _numConfirmationsRequired) {
		require(_owners.length > 0, "owners required");
		require(_numConfirmationsRequired > 0 && _numConfirmationsRequired <= _owners.length,"invalid number of required confirmations");

		for (uint i = 0; i < _owners.length; i++) {
			address owner = _owners[i];

			require(owner != address(0), "invalid owner");
			require(!isOwner[owner], "owner not unique");

			isOwner[owner] = true;
			owners.push(owner);
		}

		numConfirmationsRequired = _numConfirmationsRequired;
	}

	receive() external payable {
		emit Deposit(msg.sender, msg.value, address(this).balance);
	}

	function submitTransaction(address _to, uint _value, bytes memory _data) public onlyOwner {
		uint txIndex = transactions.length;

		transactions.push(Transaction({to: _to, value: _value, data: _data, executed: false, numConfirmations: 0}));

		emit SubmitTransaction(msg.sender, txIndex, _to, _value, _data);
	}

	function confirmTransaction(uint _txIndex) public onlyOwner txExists(_txIndex) notExecuted(_txIndex) notConfirmed(_txIndex){
		Transaction storage transaction = transactions[_txIndex];
		transaction.numConfirmations += 1;
		isConfirmed[_txIndex][msg.sender] = true;

		emit ConfirmTransaction(msg.sender, _txIndex);
	}

	function executeTransaction(uint _txIndex) public onlyOwner txExists(_txIndex) notExecuted(_txIndex) {
		Transaction storage transaction = transactions[_txIndex];

		require(transaction.numConfirmations >= numConfirmationsRequired, "cannot execute tx");

		transaction.executed = true;

		(bool success, ) = transaction.to.call{value: transaction.value}(transaction.data);
		require(success, "tx failed");

		emit ExecuteTransaction(msg.sender, _txIndex);
	}

	function revokeConfirmation(uint _txIndex) public onlyOwner txExists(_txIndex) notExecuted(_txIndex){
		Transaction storage transaction = transactions[_txIndex];

		require(isConfirmed[_txIndex][msg.sender], "tx not confirmed");

		transaction.numConfirmations -= 1;
		isConfirmed[_txIndex][msg.sender] = false;

		emit RevokeConfirmation(msg.sender, _txIndex);
	}

	function getOwners() public view returns (address[] memory) {
		return owners;
	}

	function getTransactionCount() public view returns (uint) {
		return transactions.length;
	}

	function getTransaction(uint _txIndex) public view returns (address to, uint value, bytes memory data, bool executed, uint numConfirmations){
		Transaction storage transaction = transactions[_txIndex];

		return (transaction.to, transaction.value, transaction.data, transaction.executed, transaction.numConfirmations);
	}
}
