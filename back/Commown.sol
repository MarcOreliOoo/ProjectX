// SPDX-License-Identifier: MIT
pragma solidity 0.8.12;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract Commown is Initializable, UUPSUpgradeable, OwnableUpgradeable  {

    //Constant can be inizialized even with Proxies
    string public constant VERSION = "0.0.1";

	//List of owners of the contract, only those can call some of the functions
	address[] public owners; 
	mapping(address => bool) public isOwner;
	uint8 public confirmationNeeded;
	uint256 public totalShares; //Total of shares 
	uint256 public totalAlreadyWithdrawed; //Total of ethers already withdrawed
	
	mapping(address => uint256) public sharePerUser; //Share per user
	mapping(address => uint256) public withdrawPerUser; //Amount of withdrawed ethers per user

	//Todo : Emit event multiWallet built
    //Todo : Delete the _shares thing
    /// @dev : function initialize
    function initialize(address[] memory _owners, uint256[] memory _shares, uint8 _confirmationNeeded) initializer public {
		require(_owners.length == _shares.length, "owners and shares length mismatch");
		require(_owners.length > 0, "owners required");
		require(_confirmationNeeded > 0 && _confirmationNeeded<= _owners.length, "confirmation number invalid");
		
        __Ownable_init();
        __UUPSUpgradeable_init();

		for(uint i;i<_owners.length; i++){
			require(_owners[i] != address(0),"owner is address(0)");
			require(!isOwner[_owners[i]],"owner is already listed");
			require(_shares[i] > 0,"share is <= 0");
			
			owners.push(_owners[i]);
			isOwner[_owners[i]] = true;
			sharePerUser[_owners[i]] = _shares[i];
			totalShares += _shares[i];			
		}
		confirmationNeeded = _confirmationNeeded;
	}

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() initializer {}

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {
        
    }

	//Todo : Emit event receive Eth
	//Owners can send ethers, a contract, a sell can send ethers...
	receive() external payable {}

	//Todo : Emit event withdrawal
	//Todo : To Test 
	function withdraw() public {
		require(isOwner[msg.sender],"not an owner");
	
		uint256 toPay = ((address(this).balance + totalAlreadyWithdrawed) * sharePerUser[msg.sender]) / totalShares - withdrawPerUser[msg.sender];
		require(toPay>0,"Nothing to pay");

		totalAlreadyWithdrawed += toPay;
		withdrawPerUser[msg.sender] += toPay;

		(bool success,) = payable(msg.sender).call{value:toPay}("");
		require(success,"transaction failed");
	}


	/* ========== HELPERS ========== */
	function getBalance() external view returns (uint) {
		return address(this).balance;
	}


}
