# Genesys Chain Validator

## How does a validator node work?

It powers the blockchain network by processing transactions and signing blocks.

## What are the incentives to run a validator node?

Validators and delegators will earn rewards from transaction fees: dApp usages

## What's on-chain governance proposal?

The proposal will decide: slash amount, cross-chain transfer fees

## How to join testnet as a validator?

1. Choose your own server/PC
2. Install software:
3. Create a wallet and get some GSYS
4. Run your fullnode and keep it synced
5. Stake your GSYS on TC

## How to join mainnet as a validator?

1. Choose your own server/PC
2. Install software:
3. Create a wallet and get some GSYS
4. Run your fullnode and keep it synced
5. Stake your GSYS on TC

## What are hardware requirements of running a validator node?

Processing transactions is mostly CPU bound. Therefore we recommend running CPU optimized servers.
Directly facing internet (public IP, no NAT)
8 cores CPU
16GB of RAM
500 SSD storage"

## How many GSYS are required to create a validator?

Validators can self-bond, meaning they can delegate GSYS to themselves, and they can also receive delegations from any other GSYS holders. These bonded GSYS acts as collateral and cause each delegate, including validators, to have “skin in the game” so to speak. If any equivocation or byzantine behavior by a validator were to be committed, the validator and its delegates would be slashed a predefined amount of bonded stake.

## What's the potential loss for validators?

Validators can suffer from “Slashing”, a punishment for their bad behaviors, such as double sign and/or instability. Such loss will not be shared by their delegators.

Slashing is a punitive function that is triggered by a validator ’s bad actions. Getting slashed is losing self delegation of a validator. Validators will be slashed for the actions below:

* Going offline or unable to communicate with the network.
* Double signing. If a validator node tries to split the network by signing two different blocks and broadcasting them, it will be removed from validator set definitely.

## Does an inactive validator receive any rewards?

No, they will not.

## Can I receive my staking rewards if my chosen validator is inactive?

No, you cannot.

## When can I receive my unstaked GSYS?

After you sent `undelegate` transaction, you have to wait 7 days. This period starts at UTC 00:00 next day

## What is 'self-delegation'? How can I increase my 'self-delegation'?

Self-delegation is delegation from a validator to themselves. This amount can be increases by sending a delegate transaction from your validator's operator address.

