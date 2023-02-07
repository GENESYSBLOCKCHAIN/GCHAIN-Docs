# Introduction


## Intro

[Genesys Chain](https://www.genesys.network) is a blockchain developed by [GSYS](https://www.genesys.network) and its community that implements a vision of a decentralized exchange (DEX) for digital assets.

At the heart of Genesys Chain is a highly performant [matching engine](./concepts/matching-engine.md) built on [distributed consensus](./concepts/architecture.md) that aims to replicate the <1 second trading efficiency of current centralized exchanges.

Genesys Chain transactions burns GSYS (the native token of the GSYS ecosystem), according to a fee schedule.

Genesys Chain also includes efforts to implement [listing assets from other chains](../atomic-swap.md), and cryptographic primitives such as [threshold signatures](./concepts/threshold-signature-scheme.md).

## Functionality

Genesys Chain has the basic features of most blockchains:

- Sending and receiving GSYS and digital assets
- Issuing new digital assets (we have a standard called BEP-2)
- Mint/burn, freeze/unfreeze, lock/unlock of digital assets

It has DEX and trading-specific functionality:

- Propose exchange listing for trading pairs
- Creating maker/taker orders for traders
- Listing assets from other chains using atomic swaps (BEP-3)

Genesys Chain also implements new features, such as

- Threshold Signatures (an alternative to multisig)
- Smart Contracts sidechain (in-progress)

## Participate

There are different ways to participate in the network, from light nodes to full validators.

Genesys Chain follows a philosophy of progressive decentralization. We envision a future where organizations and individuals can run validator nodes, and GSYS can be staked to join governance.
