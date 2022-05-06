// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;
/**
* Test 3 : all mapping in the struct
* Gas : 220664
* Transac cost : 191881
*/
contract Test3{
    enum PocketStatus {
		Proposed,
		Signing,
		Executed
	}

	//Is it better to have Pocket721 Pocket1155 Pocket20 or Pocket (with mapping for each) ?
	struct Pocket {
		address to; //To whom the pocket will be buy
		bytes data; //Data on chain representing the transaction
		PocketStatus pStatus; //Status of the pocket
		uint256 nbSign; //nb of sign of the pocket
		uint256 currentAmount; //Current amount
		uint256 totalAmount; //Total amount to reach
		uint256 totalWithdrawed; //Total amount already withdrawed
        mapping(address => uint256) amountPerUser; //Share per user
		mapping(address => uint256) withdrawPerUser; //Amount of withdrawed ethers per user
        mapping(address => uint256) items20; //ERC20 => amount
        mapping(address => mapping(uint256 => uint256)) items721; //ERC721 => ID => quantity
        mapping(address => mapping(uint256 => uint256)) items1155; //ERC1155 => ID => amount   
	}
	Pocket[] public pockets;
}

/**
* Test 4 : all mapping in the struct + mapping of struct + id
* Gas : 221726
* Transac cost : 192805
*/
contract Test4{
    enum PocketStatus {
		Proposed,
		Signing,
		Executed
	}

	//Is it better to have Pocket721 Pocket1155 Pocket20 or Pocket (with mapping for each) ?
	struct Pocket {
		address to; //To whom the pocket will be buy
		bytes data; //Data on chain representing the transaction
		PocketStatus pStatus; //Status of the pocket
        uint256 pocketID;
		uint256 nbSign; //nb of sign of the pocket
		uint256 currentAmount; //Current amount
		uint256 totalAmount; //Total amount to reach
		uint256 totalWithdrawed; //Total amount already withdrawed
        mapping(address => uint256) amountPerUser; //Share per user
		mapping(address => uint256) withdrawPerUser; //Amount of withdrawed ethers per user
        mapping(address => uint256) items20; //ERC20 => amount
        mapping(address => mapping(uint256 => uint256)) items721; //ERC721 => ID => quantity
        mapping(address => mapping(uint256 => uint256)) items1155; //ERC1155 => ID => amount   
	}
	mapping(uint256=>Pocket) public pockets;
    uint256 pocketsLength;
}
