# Solidity Examples

Learn about Smart Contracts Applications and Solidity Patterns. Written and Tested using Foundry.

## References

- [Solidity Patterns](https://github.com/KITcii/smart-contract-dev-support/tree/main)
- [Solidity by Example](https://solidity-by-example.org/)

## Contracts

### Applications

#### Gasless Transfer

Gasless ERC20 token transfer with Meta transaction. The ERC20Permit allows a User to grant permission to others to spend their tokens in a transaction. User Tokens are transfered to the receiver and the fee costs to the message sender.

#### Iterable Mapping

Library to iterate over a mapping elements.

#### Merkel Airdrop

Use a Merkle Tree to check whether a User is eligible to claim the Airdrop.

#### Merkel Tree

A Merkle Tree is a tree data structure of hashes, where each leaf node contains the hash of a block of data, and each parent node contains the hash resulting from the concatenation and hashing of its children node’s hashes. A Merkle Tree allows Contracts to cryptographically prove that an element is contained in a set without revealing the entire set. The Contract only needs log(n) number of hashes to check if a hash belongs to a certain Merkle roor.

#### Multi-Sig Wallet

The purpose of a Multi-Sig Wallet is to enhance security and reduce the risk of unauthorized access to funds. By requiring multiple parties to agree on a transaction, it becomes more challenging for a single individual to compromise the wallet and steal the funds.

#### Time Lock

TimeLock is a contract that publishes a transaction to be executed in the future. After a minimum waiting period, the transaction can be executed. This feature is crucial for various applications such as governance mechanisms in DAOs, vesting schedules in DeFi, and security measures.

### Patterns

#### Architectural Patterns

##### Proxy

The Proxy Pattern allows upgrading a Contract Implementation logic, while making it accessible via a static address. The Proxy Contract stores the Implementation address into a pseudorandom slot address to avoid accidentally overwriting the value and expose the required functions to change the address. The Proxy forwards the calls to the Implementation Contract throught the `delegatecall(...)`. The Implementation Contract code is executed using the Proxy storage.

#### Design Patterns

##### Commitment

The Commitment Pattern ensures that the values, which have been committed, are not visible to other entities and are kept secret until the individual accounts reveal their values while assuring that these values are binding for the corresponding entities. Transactions take some time before they are mined. An attacker can watch the transaction pool and send a transaction, have it included in a block before the original transaction. This mechanism can be abused to re-order transactions to the attacker's advantage. The Commitment Pattern does not allows the Attacker to take advantage of the transactions re-ordering because the Attacker does not have the values to reveal the commitment.

##### Factory

The Factory Pattern automates the creation and management of new Contracts in a reliable and transparent manner.

##### Mutex

The Mutex Pattern uses a mutex variable to protect critical parts of Contract code from repeated execution through external calls. The mutex variable is a variable used in a condition that must validate as true to execute subsequent smart contract code. Otherwise, the code protected by the mutex variable is not executed. After the execution of the protected smart contract code, the mutex is unlocked to allow for the next execution of the protected code.

##### Pull over Push

The Pull over Push Pattern shifts the risk associated with transferring ether to the User. Sending ether to another address in Ethereum involves a call to the receiving entity. There are several reasons why this external call could fail. If the receiving address is a contract, it could have a fallback function implemented that simply throws an exception, once it gets called. Another reason for failure is running out of gas. This can happen in cases where a lot of external calls have to be made within one single function call, for example when sending the profits of a bet to multiple winners.

##### Replay Protection

The Replay Protection Pattern protects Contracts from replay attacks. In replay attacks, attackers use data included in transactions (e.g., digital signatures for authentication) issued by other identities and resend the transaction, for example, to manipulate token balances kept by a Contract. The Pattern forces the User to signe the transaction including a nonce and the Contract address to prevent multiple executions of the same transaction.

##### State Machine

The State Machine Pattern enables the Contracts to act as a state machine, which means that they have certain stages in which they behave differently or in which different functions can be called. A function call often ends a stage and transitions the contract into the next stage.

#### Idioms

##### Checks-Effects-Interactions

The Checks-Effects-Interactions Pattern ensures that all code paths through a contract complete all required checks of the supplied parameters before modifying the contract’s state (Checks); only then it makes any changes to the state (Effects); it may make calls to functions in other contracts after all planned state changes have been written to storage (Interactions). This is a common foolproof way to prevent reentrancy attacks, where an externally called malicious contract can double-spend an allowance, double-withdraw a balance, among other things, by using logic that calls back into the original contract before it has finalized its transaction.

##### Error Handling

The Error Handling Pattern appropriately handles errors occurring in Contracts to prevent denial of service or the locking of balances.

##### External Call

The External-Call Pattern handles calls to external Contracts to appropriately handle failed calls and prevent unintended side effects.

##### Guarding Pattern

The Guarding Pattern ensures that a function is only executable by specific accounts.

##### Overflow

The Overflow/Underflow Pattern avoids overflow and underflow. Integer overflow and underflow can cause wrong calculations or infinite loops.


## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Help

```shell
$ forge --help
```
