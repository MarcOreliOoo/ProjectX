# Design pattern

Explaination of the `Commown Shared Wallet`'s design pattern

-   [Main structure](#main-structure)
    -   [Why a proxy contract ?](#why-a-proxy)
    -   [Different type of proxy](#different-proxy)
    -   [OpenZeppelin plugin](#oz-plugin)
    -   [CSW - Proxy factory contract](#csw-proxy-factory)
    -   [CSW - Logic contract](#csw-logic-contract)
-   [Focus on CSW Contract](#focus-csw-logic-contract)
  -   [Features](#csw-features)
  -   [Heritance](#csw-heritance)

## Main structure <a name="main-structure"></a>
The Commown Shared Wallet contracts is base on the proxy concept and composed of two contracts.

### Why a proxy contract ? <a name="why-a-proxy"></a>
Contracts are immutable once deployed on the blockchain. That's the safety point every one wants to reach.
But, on the other hand, sometimes, it would be nice to be able to update contract for bug fixing, or patching, or product improvements ask by your community (DAO like). Moreover, as our contract will handle money, it is preferable to have that possibility.
Obviously, all the contract is not updatable and we have to follow some guide lines detailed above.
The process is always the same : 

> One main contract for n proxies.
 
The main contract contains all the logic `logic contract` and proxies contain state variable of the logic contract.
So, the first step was to choose, which type of proxy we do need.

### Different type of proxies <a name="different-proxy"></a>
There are several proxy models, each adapted to different use cases.
#### Clone
The "clone" one is the cheapest one, but it's not really a proxy for upgradable
#### Transparent
#### Universal
#### Beacon

### OpenZeppelin plugin <a name="oz-plugin"></a>
OpenZeppelin Upgrades solves this apparent contradiction by providing an easy to use, simple, robust, and opt-in upgrade mechanism for smart contracts that can be controlled by any type of governance, be it a multi-sig wallet, a simple address or a complex DAO.
#### Frontend
#### For future updates

### CSW - Proxy factory contract <a name="csw-proxy-factory"></a>
### CSW - Logic contract <a name="csw-logic-contract"></a>

## Focus on CSW logic contract <a name="focus-csw-logic-contract"></a>
### Features <a name="csw-features"></a>
#### Receive / Withdraw ETH
#### Pocket

### Heritance <a name="csw-heritance"></a>

## Usefull links <a name="usefull-links"></a>

-   [uups-proxies-tutorial-solidity-javascript](https://forum.openzeppelin.com/t/uups-proxies-tutorial-solidity-javascript/7786)
-   [Github OpenZeppelino proxy](https://github.com/OpenZeppelin/openzeppelin-contracts/tree/master/contracts/proxy)
-   [UUPS Modern walkthrough](https://r48b1t.medium.com/universal-upgrade-proxy-proxyfactory-a-modern-walkthrough-22d293e369cb)
-   [UUPS vs Transparent & Deploying more efficient proxy](https://www.youtube.com/watch?v=kWUDTZhxKZI)
-   [Old SDK Package from OZ](https://github.com/OpenZeppelin/openzeppelin-sdk/tree/master/packages/lib/contracts/upgradeability)
-   [UUPS Factory](https://forum.openzeppelin.com/t/deploying-upgradeable-proxies-and-proxy-admin-from-factory-contract/12132/12)

---

<sup>Made with ♥ by CommOwn Teams.</sup>
