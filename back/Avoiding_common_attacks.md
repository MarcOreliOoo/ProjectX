# Avoiding Common Attacks

Explaination of how we avoid the common attacks.

---

-   [Common list attacks](#common-list-attacks)
    -   [Why a proxy contract ?](#why-a-proxy)
    -   [Different type of proxy](#different-proxy)
    -   [OpenZeppelin plugin](#oz-plugin)
    -   [CSW - Proxy factory contract](#csw-proxy-factory)
    -   [CSW - Logic contract](#csw-logic-contract)
-   [Security and behavioral pattern](#security-pattern)
    -   [Guard check, behavioral check and state machine](#detailed-pattern)
    -   [Access restriction](#access-pattern)
-   [Features & heritance](#csw-features)


# Common list attacks <a name="common-list-attacks"></a>
Legend:
-   :ballot_box_with_check: Todo
-   :white_check_mark: Validated
-   :white_square_button:: Not Concern

List :
-   Saving unencrypted confidential data on the blockchain 
-   Integer overflow and underflow (solved since solidity 0.8)
-   Unchecked call return values
-   Re-entrancy attacks
-   Denial Of Service attacks
-   Front Running attacks
-   Replay signatures attacks
-   Function default visibility
-   Floating pragma
-   Loop through long arrays
-   Wrong inheritance
-   Unexpected ether balance
-   Access outside array limits
-   Delegate calls to untrusted sources
-   (Regular) calls to untrusted sources
-   Insecure randomness
-   Block Timestamp manipulation
-   Contracts with zero code
-   Uninitialized Storage Pointers
-   Unupgradable smart contracts




---

<sup>Made with ♥ by CommOwn Teams.</sup>
