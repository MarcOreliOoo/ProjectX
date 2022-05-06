// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

/**
* Test 1:
* Gas : 349544
* Transac cost : 303951
*/
/**
* Test 2:
* Gas : 256752
* Transac cost : 223262
*/
/**
* Test 1 sans array pour 721 et 20:
* Gas : 236127
* Transac cost : 205327
*/
/**
* Test 3 : all mapping in the struct
* Gas : 220664
* Transac cost : 191881
*/
contract Test1{
    enum PocketStatus {
		Proposed,
		Signing,
		Executed
	}

	//Is it better to have Pocket721 Pocket1155 Pocket20 or Pocket (with mapping for each) ?
	struct Pocket721 {
		address to; //To whom the pocket will be buy
		address token;
        bytes data; //Data on chain representing the transaction
		PocketStatus pStatus; //Status of the pocket
		uint256 nbSign; //nb of sign of the pocket
		uint256 currentAmount; //Current amount
		uint256 totalAmount; //Total amount to reach
		uint256 totalWithdrawed; //Total amount already withdrawed
		uint256 tokenId;
        mapping(address => uint256) amountPerUser; //Share per user
		mapping(address => uint256) withdrawPerUser; //Amount of withdrawed ethers per user
	}
	//Pocket721[] public pockets721;

    struct Pocket1155 {
		address to; //To whom the pocket will be buy
		address token;
        bytes data; //Data on chain representing the transaction
		PocketStatus pStatus; //Status of the pocket
		uint256 nbSign; //nb of sign of the pocket
		uint256 currentAmount; //Current amount
		uint256 totalAmount; //Total amount to reach
		uint256 totalWithdrawed; //Total amount already withdrawed
        uint256 tokenAmount;
        uint256 tokenId;
        mapping(address => uint256) amountPerUser; //Share per user
		mapping(address => uint256) withdrawPerUser; //Amount of withdrawed ethers per user
    }
	Pocket1155[] public pockets1155;

    struct Pocket20 {
		address to; //To whom the pocket will be buy
        address token;
 		bytes data; //Data on chain representing the transaction
		PocketStatus pStatus; //Status of the pocket
		uint256 nbSign; //nb of sign of the pocket
		uint256 currentAmount; //Current amount
		uint256 totalAmount; //Total amount to reach
		uint256 totalWithdrawed; //Total amount already withdrawed
        uint256 tokenAmount;
		mapping(address => uint256) amountPerUser; //Share per user
		mapping(address => uint256) withdrawPerUser; //Amount of withdrawed ethers per user
	}
	//Pocket20[] public pockets20;
}
