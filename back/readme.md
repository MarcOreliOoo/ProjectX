To Explore :
* multi simple sig to test (OK)
* call with bytes for abi.encodeWithSignature (OK)
* selector (à tester)
* Proxy openzeppelin (à tester)
* API Opensea (à request)
* Others APIs: Rarible / X2Y2 / looksrare... 
* Buy ERC20 from Uniswap ?


Functionning :
* Buy possibility : 
  * Direct buy from ERC721/ERC1155 contract
  * Buy from a platfom (OpenSea) -> direct or bid ?
  * Buy from other platform cf PartyBid IMarketWrapper.sol


Do not forget :
* IERC721Receiver to be sure our contract can handle 721 and the safeTransferFrom works + IERC721.onERC721Received.selector if we want to sale that NFT to another contract ?
* ERC20 Receiver


Next steps :
* Organisation GIT
* Buy ERC20 en direct
* GITHooks, prettier, CZ features...


Todo AAL :
* mkdir HardhatProjects\00_Commown
* git clone -o seed -b main --single-branch https://github.com/YM-Voting-System/react-interface.git
* npm install --global yarn
* cd react-interface
* yarn install
* https://forum.openzeppelin.com/t/uups-proxies-tutorial-solidity-javascript/7786
* https://r48b1t.medium.com/universal-upgrade-proxy-proxyfactory-a-modern-walkthrough-22d293e369cb


Ressources :
* OZ Deploying more efficient proxy https://www.youtube.com/watch?v=kWUDTZhxKZI
* https://r48b1t.medium.com/universal-upgrade-proxy-proxyfactory-a-modern-walkthrough-22d293e369cb****
