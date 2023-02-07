# Get Started with Genesys Chain

## Wallet

The easiest way to use Genesys Chain is through a wallet with support for Genesys Chain accounts and transfers.

For example, GSYS provides a Web Wallet at [https://www.genesys.network](https://www.genesys.network)<br/>
GSYS also provides Web Wallet for testnet at [https://testnet-explorer.genesys.network](https://testnet-explorer.genesys.network)<br/>
Both provide the functions below:

- Generating crypto keys and addresses, which serves as the base of a wallet
- Showing the balances of assets on the addresses
- Sending and receiving assets

Genesys Chain Web Wallet also presents a trading UI similar to genesys.network, where you can examine market data and manage your orders to trade among the listed assets.<br/>
Learn about the list of wallet available [here](wallets.md).

## Chain Explorer
Chain Explorer provides a portal to explore blocks and transaction details.<br/>
On Genesys Chain Explorer, you can also check different asset types, the distribution of their ownerships, and owners' transactions.

## REST API
There are [Accelerated Nodes](faq/faq.md#what-is-the-accelerated-node) which provide advanced API services for the public.<br/>

### Node RPC
There are data seed nodes in the network which allow users to perform low-level operations like executing ABCI queries, viewing network/consensus state or broadcasting a transaction.

## Advanced Ways To Use Blockchain
### Run your own full node

Please refer to this guide about [how to run your own node](fullnode.md).

### Run your own light client

Please refer to this guide about [how to run your own light client](light-client.md).

### Access via Node Command Line Interface (CLI)

A Command Line Interface is available for Linux and Mac platforms.<br/>


### Use SDKs

SDKs are also provided as a starting point for your apps.<br/>
There are two advanced SDK solutions for Genesys Chain: [Java](<https://github.com/githubusername/githubrepo/java-sdk>) and [Golang](<https://github.com/githubusername/githubrepo/go-sdk>).<br/>
Both solutions provide functions for:<br/>

* Create wallets and manage keys
* Encode/sign transactions and submit to Genesys Chain/DEX, including Transfer, New Order, Cancel Order, etc.
* Communicate with Genesys Chain/DEX Node RPC calls through public node RPC services or your own private full nodes

Please refer to specific SDK documentation for more information:

- [Go](https://github.com/githubusername/githubrepo/go-sdk)([Documentation](https://github.com/githubusername/githubrepo/go-sdk/wiki))
- [Java](https://github.com/githubusername/githubrepo/java-sdk)([Documentation](https://github.com/githubusername/githubrepo/java-sdk/wiki))
- [Javascript](https://github.com/githubusername/githubrepo/javascript-sdk) ([Documentation](https://github.com/githubusername/githubrepo/javascript-sdk/wiki))
- [C++](https://github.com/githubusername/githubrepo/cplusplus-sdk)([Documentation](https://github.com/githubusername/githubrepo/cplusplus-sdk/wiki))
- [C#](https://github.com/githubusername/githubrepo/csharp-sdk)([Documentation](https://github.com/githubusername/githubrepo/csharp-sdk))
- [Python](https://github.com/githubusername/githubrepo/python-sdk)([Documentation](https://python-shree-chain.readthedocs.io/en/latest/shree-chain.html#module-genesys_chain))
- [Swift](https://github.com/githubusername/githubrepo/swift-sdk)([Documentation](https://github.com/githubusername/githubrepo/swift-sdk/blob/master/README.md))


## Blockchain Details
Please check the [technical details](index.md#technology-details) for more technical information.
