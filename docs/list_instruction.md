# List Instructions

Listing a trading pair is a rather advanced feature in DEX. To list your token, you can follow the step-by-step instruction here.

There are the steps to get your tokens listed:

![workflow](./assets/listing-workflow.jpg)

## 1. Issue Tokens on Genesys Chain
Please refer to this [token issue doc](tokens.md) to learn about how to issue your own asset on Genesys Chain.

## 2. Submit Proposal

*On-Chain Proposal Request*


Please refer to this [governance doc](governance.md) to learn about how to create a proposal about listing a new trading pair on Genesys Chain.

> Please ensure that you test EVERYTHING on our testnet (multiple times at least) before you officially execute this on the mainnet.

*Community Thread Proposal (Recommended)*

It is recommended that Token Issuers first create a thread under the “Token Issuance & Listings” category in the Genesys Chain Community Forum (https://community.genesys.network/). The whole guideline is [here](https://community.genesys.network/topic/18/guidelines-on-how-to-list-your-token-on-shree-dex)

## 3. Send List Transaction

Please refer to this [list doc](list.md) to learn about how to send a list transaction and finish listing process on Genesys Chain.

> Please ensure that  a `list` transaction must be sent before `expire-time`.


## FAQ about Listing  Tokens

###  Which trading pair can be listed?

Simply allowing trading between two assets seems easy enough, however it is expensive for not only the network  but also its users in long term (and liquidity costs can be much larger). In order to efficiently use the network, Genesys Chain only list assets against GSYS and other widely accepted market quote assets.

### How is a trading pair created on GSYS DEX?

The design philosophy of GSYS DEX adheres to the idea that the most efficient and low cost way to perform trading and price-discovery is still to use single order book. This single order book is managed and replicated across all full nodes with the same, deterministic matching logic.

