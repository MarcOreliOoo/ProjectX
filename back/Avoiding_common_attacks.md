# Avoiding Common Attacks

Explaination of how we avoid the common attacks.

---

Legend:
-   :white_square_button:: To check
-   :white_check_mark:: Validated

## List

###  Saving unencrypted confidential data on the blockchain 
We do not store any confidential information nor on chain, nor off chain.  
:white_check_mark: Done 

### Integer overflow and underflow
Solidity solveds this issue in 0.8.  
:white_check_mark: Done 

### Unchecked call return values  
In the withdraw function of CommownSW.sol
```
(bool success, ) = payable(msg.sender).call{value: _amount}("");
require(success, "transaction failed"); //Require the transactoin success or revert
```
:white_check_mark: Done

### Re-entrancy attacks
In the same function "withdraw" of CommownSW.sol, we use the "non reentrancy pattern" by updating the balance before sending ethers to the caller.
```
balancePerUser[msg.sender] -= _amount; //Update the amount before the transaction is called to avoid reentrancy attack

(bool success, ) = payable(msg.sender).call{value: _amount}("");
require(success, "transaction failed"); //Require the transactoin success or revert
```
:white_check_mark: Done

### Denial Of Service attacks
:white_square_button:: To check

### Front Running attacks
:white_square_button:: To check

### Replay signatures attacks
:white_square_button:: To check

### Function default visibility
:white_square_button:: To check

### Floating pragma
:white_square_button:: To check

### Loop through long arrays
:white_square_button:: To check

### Wrong inheritance
:white_square_button:: To check

### Unexpected ether balance
:white_square_button:: To check

### Access outside array limits
:white_square_button:: To check

### Delegate calls to untrusted sources
:white_square_button:: To check

### (Regular) calls to untrusted sources
:white_square_button:: To check

### Insecure randomness
:white_square_button:: To check

### Block Timestamp manipulation
:white_square_button:: To check

### Contracts with zero code
:white_square_button:: To check

### Uninitialized Storage Pointers
:white_square_button:: To check

### Unupgradable smart contracts
:white_square_button:: To check


---

<sup>Made with ♥ by CommOwn Teams.</sup>
