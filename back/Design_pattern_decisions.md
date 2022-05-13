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
> All proxy patterns depend on an EVM primitive, the DELEGATECALL opcode.

> Include here schema of difference between "call" and "delegate call"

The main contract contains all the logic of the dapp, and proxies contain state variables of the logic contract.
So, the first step was to choose, which type of proxy we need.

### Different type of proxies <a name="different-proxy"></a>
There are several proxy models, each adapted to different use cases.

#### Clone
The "clone" one is the cheapest one, but it's not really a proxy for upgradable purpose. The only thing it does is cloning contract functionality in an immutable way and delegate all calls to the main contract. So it does not allow for upgrade the logic contract.  
It is very usefull once you know:
- your contract is safe and well designed
- your contract is mature and you pretty sure it will not need any upgrades

See [eip-1167](https://eips.ethereum.org/EIPS/eip-1167)

#### Transparent
The transparent proxy is based on the normal proxy pattern. It is called transparent by OpenZeppelin because of the "non conflit" tools it provides.
It relies on the caller before the function selector, then the transparent proxy recognizes if it has to delegate the call to the main logic contract as if a user was calling a function, and vice versa when it's the owner of the proxy. No conflict then, it's "transparent".
Downside of that proxy is each call requires an additional read from storage to load the admin address which is gas costly. Then, there is another pattern...  
See [transparent proxies](https://blog.openzeppelin.com/the-state-of-smart-contract-upgrades/#transparent-proxies)

#### Universal
Universal upgradeable proxiy standard or UUPS as it stands, comes from [eip-1822](https://eips.ethereum.org/EIPS/eip-1822). It is almost the same pattern than the transparent one, but it places upgrade logic in the implementation contract instead of the proxy itself. Then, it avoids the additionnal storage read.
Since the proxy uses delegate calls, if the inmplementation address is define in the logic contract, then, it is in the proxy storage.
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
