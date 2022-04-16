To Explore :
* multi simple sig to test (OK)
* call with bytes for abi.encodeWithSignature (OK)
* or selector ?
* Proxy openzeppelin
* Explore DAO
* Test 721 multi sig
* Parcours utilisateurs
* API Opensea
* Others APIs: Rarible / X2Y2 / looksrare...
* GITHooks, prettier, CZ features... 

Functionning :
* Buy possibility : 
  * Direct buy from ERC721/ERC1155 contract
  * Buy from a platfom (OpenSea) -> direct or bid ?
  * Buy from other platform cf PartyBid IMarketWrapper.sol
* Who is the NFT keeper, the SharedWallet contract ?

Do not forget :
* IERC721Receiver to bne sure our contract can handle 721 and the safeTransferFrom works + IERC721.onERC721Received.selector if we want to sale that NFT to another contract ?

To check :
* partybid.app

Next steps :
* 15/04 : parcours utilisateurs
* NFT multi sig
* API OpenSea
* Organisation GIT
