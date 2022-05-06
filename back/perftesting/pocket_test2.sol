// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract Test2{
    enum PocketStatus {
		Proposed,
		Signing,
		Executed
	}

	//Is it better to have Pocket721 Pocket1155 Pocket20 or Pocket (with mapping for each) ?
	struct Pocket {
		address to; //To whom the pocket will be buy
		address token721;
        address token1155;
        address token20;
        bytes data; //Data on chain representing the transaction
		PocketStatus pStatus; //Status of the pocket
		uint256 nbSign; //nb of sign of the pocket
		uint256 currentAmount; //Current amount
		uint256 totalAmount; //Total amount to reach
		uint256 totalWithdrawed; //Total amount already withdrawed
        uint256 tokenId721;
        uint256 tokenAmount1155;
        uint256 tokenId1155;
        uint256 tokenAmount20;
        mapping(address => uint256) amountPerUser; //Share per user
		mapping(address => uint256) withdrawPerUser; //Amount of withdrawed ethers per user
	}
	Pocket[] public pockets;
}
