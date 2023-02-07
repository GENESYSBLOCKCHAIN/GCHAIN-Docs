# Genesys Chain Documentation

Welcome to the Genesys Chain documentation site!

Please note that both the Genesys Chain software and this documentation site will improve over time and is still a work-in-progress.<br/>
Be sure to engage with our community channels to stay updated.

Have fun trading and see you on chain!

## What is Genesys Chain?

Genesys Chain is an innovative solution to bring programmability and interoperability to Genesys Chain. Genesys Chain relies on a system of PoA consensus that can support short block time and lower fees. The most bonded validator candidates of staking will become validators and produce blocks. The double-sign detection and other slashing logic guarantee security, stability, and chain finality.

Please read the [FAQ](./faq/nc/general.md) to get started.


## What can I do with Genesys Chain?

The purpose of the new blockchain and DEX is to create an alternative marketplace for issuing and exchanging digital assets in a decentralized manner.

You can:

- Send and receive GSYS
- Issue new tokens to digitalize assets, and use Genesys Chain as underlying exchange/transfer
network for the assets



**For developers**, you can also:

Genesys Chain, GSYS boasts smart contract functionality and compatibility with the Ethereum Virtual Machine (EVM). The design goal here was to leave the high throughput of Genesys Chain intact while introducing smart contracts into its ecosystem.

Because GSYS is EVM-compatible, it launched with support for the rich universe of [Ethereum](https://academy.genesys.network/en/articles/what-is-ethereum) tools and DApps. In theory, this makes it easy for developers to port their projects over from Ethereum. For users, it means that applications like [MetaMask](smart-chain/wallet/metamask.md) can be easily configured to work with TC. Seriously – it’s just a matter of tweaking a couple of settings. Check out Use MetaMask for Genesys Chain to get started.

You can:

- Send and receive GSYS
- Explore the transaction history and blocks on the chain, via [GSYS SCAN](https://genesys.network), API
and node RPC interfaces.

**Developers** can also:

- [Issue](./smart-chain/developer/issue-BLUE20.md) new tokens to digitalize assets
- Run a [full node](./smart-chain/developer/fullnode.md) to listen to and broadcast live updates on transactions, blocks, and consensus activities
- [Develop wallets](./smart-chain/wallet/wallet_api.md) and tools to help users use Dapps

## Get Started

Want to try it **Genesys Chain**? Just give a peek at the first few of pages of the [getting started guide](get-started.md).<br/>
You could also have a read through the [FAQ](faq/faq.md).

Want to develop on **Genesys Chain**? First, read through the [FAQ](faq/nc/general.md) and learn about tokens [here](smart-chain/developer/BLUE20.md).

## Asset Management

### BLUE20 Asset

A token protocol on GSYS which is compatible with [ERC20](https://eips.ethereum.org/EIPS/eip-20). It extends ERC20 and contains more interfaces, such as `getOwner` and `decimals`. Read the full proposal here: <https://github.com/githubusername/githubrepo>

- [Issue BLUE20](smart-chain/developer/issue-BLUE20.md)
- [Wallet](smart-chain/wallet.md)

## GSYS (and Other Coins) MainNet Switch

Genesys (GSYS) was an ERC20 token on the Ethereum network.<br/>
After the launch of Genesys Chain, Genesys (GSYS) is being converted into native GSYS tokens on the main network via the exchange platform at [genesys.network](https://www.genesys.network), a pragmatic and efficient way to perform the initial token swap.

Genesys Chain is ready for other projects to migrate their tokens to take advantage of performant transactions with more liquidity options and native marketplace features.<br/>
More information about how projects can set themselves up for this (via [genesys.network](https://www.genesys.network) or partners) will come soon.


## Technology Details
Continue reading below if you are interested in what is happening under the hood!

- [Genesys Chain as a Block Chain](blockchain.md): about consensus, software stack, network layout and roles.
- [Run a Genesys Chain full node](smart-chain/developer/fullnode.md): how to run a full node and become part of the p2p network of Genesys Chain.


## Acknowledgement
Thanks to the [community, our partners and supporters](acknowledgement.md).
