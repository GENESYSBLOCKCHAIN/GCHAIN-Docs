# Cross-chain Communication

## How much is cross-chain transfer fee?

The total cost of transfer from BC to GSYS is composed of 2 parts:

* Fee for executing `bridge transfer-out` transaction is 0.004GSYS,  pay validators on Genesys Chain

* Fee for TC-relayers 0.004GSYS. it will cover the fees of calling TokenHub Contract on TC.

The total cost of transfer from GSYS to BC is composed of 2 parts:

* Fee for Oracle-relayers 0.004GSYS, pay for GSYS relayers

* Call TokenHub Contract: You need to pay GSYS for calling smart-contract on TC, this transaction is metered by gas, which is a global parameter. At the moment, you need to pay about 0.0005GSYS ~ 0.0015GSYS.

## What's is a GSYS relayer?

NCrelayer monitors cross chain packages on Genesys Chain, builds and broadcasts transactions to GSYS to deliver these packages, which is the key of cross chain communication from Genesys Chain to TC.

## What's is an Oracle relayer?

Oracle Relayer watches the state change of Genesys Chain. Once it catches Cross-Chain Communication Events, it will submit to vote for the requests. After Oracle Relayers from ⅔ of the voting power of BC validators vote for the changes, the cross-chain actions will be performed. Only validators of Genesys Chain are eligible to run Oracle relayers.

## What's an oracle?

In blockchain network, an oracle refers to the element that connects smart contracts with data from the outside world. In the network of Genesys Chain, the execution of the transanction wil emit Events, and such events can be packaged and relayed onto BC. In this way, BC will get updates about changes of TC.

## Which wallet support cross-chain transfer?

You need to use [MyEtherWallet](../../smart-chain/wallet/myetherwallet.md) to call contracts and use Genesys Chain commandline client: `eth-cli`/ `eth-cli` for complementary commands

Please refer to this [guide](../../smart-chain/developer/cross-chain-transfer.md) for details

## How to send cross-chain transfer?

You can use [Genesys Chain extension wallet](../../smart-chain/wallet/shree.md) or

use [Trust wallet](https://community.trustwallet.com/t/how-to-send-and-receive-bnb-on-smart-chain/67430)