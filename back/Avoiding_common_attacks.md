# Avoiding Common Attacks

Explaination of how we avoid the common attacks.

---

Legend:
-   :ballot_box_with_check:: Todo
-   :white_check_mark:: Validated
-   :white_square_button:: Not Concerned

List :
-   :white_square_button: Saving unencrypted confidential data on the blockchain 
-   :white_square_button: Integer overflow and underflow (solved since solidity 0.8)
-   :white_check_mark: Unchecked call return values  
     `require(success, "transaction failed");`
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
