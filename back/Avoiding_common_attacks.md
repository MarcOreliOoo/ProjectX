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
In the withdraw function of CommownSW.sol
```
(bool success, ) = payable(msg.sender).call{value: _amount}("");
require(success, "transaction failed"); //Require the transactoin success or revert
```
-   :white_check_mark: Re-entrancy attacks  
In the same function "withdraw" of CommownSW.sol, we use the "non reentrancy pattern" by updating the balance before sending ethers to the caller.
```
balancePerUser[msg.sender] -= _amount; //Update the amount before the transaction is called to avoid reentrancy attack

(bool success, ) = payable(msg.sender).call{value: _amount}("");
require(success, "transaction failed"); //Require the transactoin success or revert
```
-   :white_square_button:Denial Of Service attacks
-   :white_square_button:Front Running attacks
-   :white_square_button:Replay signatures attacks
-   :white_square_button:Function default visibility
-   :white_square_button:Floating pragma
-   :white_square_button:Loop through long arrays
-   :white_square_button:Wrong inheritance
-   :white_square_button:Unexpected ether balance
-   :white_square_button:Access outside array limits
-   :white_square_button:Delegate calls to untrusted sources
-   :white_square_button:(Regular) calls to untrusted sources
-   :white_square_button:Insecure randomness
-   :white_square_button:Block Timestamp manipulation
-   :white_square_button:Contracts with zero code
-   :white_square_button:Uninitialized Storage Pointers
-   :white_square_button:Unupgradable smart contracts




---

<sup>Made with ♥ by CommOwn Teams.</sup>
