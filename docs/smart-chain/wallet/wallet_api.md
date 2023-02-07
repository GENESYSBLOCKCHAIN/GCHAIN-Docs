Genesys Chain Wallet injects a global API into websites visited by its users at `window.Genesys Chain`.

This API specification borrows heavily from API MetaMask provided, considering the massive adoption. So Web3 site developers can easily connect their dApps with the Genesys Chain Wallet. The APIs allow websites to request users' Genesys Chain addresses, read data from the blockchain the user is connected to, and prompt the users to sign messages and transactions.

The presence of the provider object `window.Genesys Chain` indicates a Genesys Chain/Genesys Chain user.

The API this extension wallet provides includes API specified by [EIP-1193](https://eips.ethereum.org/EIPS/eip-1193) and API defined by [MetaMask](https://docs.metamask.io/guide/ethereum-provider.html) (including some massively relied legacy ones).

## Development Progress
Currently (version 1.112.8) as Genesys Chain Wallet natively supports Genesys Chain, we are planning to open a series of APIs for dApp developers to interact with Genesys Chain. At the end of the day, most [APIs available in Genesys Chain javascript sdk](https://github.com/githubusername/githubrepo/javascript-sdk/tree/master/docs) would be available.

Currently, only the following is supported:
* [`transfer`](https://github.com/githubusername/githubrepo/javascript-sdk/tree/master/docs#transfer-tokens) 

## Difference with MetaMask

!!! warning

    Please read through this section if you are a web3 developer who has integrated with MetaMask and interested in integrating with Genesys Chain Wallet.

### Inpage injected object

The biggest difference between Genesys Chain Wallet and MetaMask is we inject `Genesys Chain` rather than `ethereum` (or `web3`) to the web page. So user could keep two extensions at the same time.

### Genesys Chain.request({method: "eth_sign", params: ["address", "message"])

We haven't supported the full complex [signing data](https://docs.metamask.io/guide/signing-data.html#signing-data-with-metamask) APIs MetaMask provided, while we only provide standard [`eth_sign`](https://eth.wiki/json-rpc/API#eth_sign) JSON-RPC call. 

The `message` item in params for this request on MetaMask has to be hex-encoded keccak256 hash (otherwise the API would silent failure for dapp https://www.reddit.com/r/Metamask/comments/9wp7kj/eth_sign_not_working/). In contrast, web3 developers could pass any message in plaintext to this method, and our UI would render it as it is to the wallet users.

### Genesys Chain.request({method: "eth_accounts"})

When this API is invoked without the user's approval, MetaMask would return an empty array.

In contrast, we would ask the user to unlock his wallet and return the address user connected to.

## Upcoming Breaking Changes

!!! warning

    Important Information

    On **November 16, 2020**, MetaMask is making changes to their provider API that will be breaking for some web3 sites.
    These changes are _upcoming_, but you can prepare for them today.
    Follow [this GitHub issue](https://github.com/MetaMask/metamask-extension/issues/8077) for updates.

    In this implementation, some APIs will be supported as [Legacy API](#legacy-api) (For example we will still implement the `chainIdChanged` on Genesys Chain object until MetaMask formally deprecates it).

## Basic Usage

For any non-trivial Genesys Chain web application — a.k.a. web3 site — to work, you will have to:

1. Detect the Genesys Chain provider (`window.Genesys Chain`)
2. Detect which Genesys Chain network the user is connected to
3. Get the user's Genesys Chain account(s)

You can learn how to accomplish the `2` and `3` from above list by reviewing the snippet in the [Using the Provider section](#using-the-provider).

The provider API is all you need to create a full-featured web3 application.

That said, many developers use a convenience library, such as ethers and web3.js, instead of using the provider directly. If you need higher-level abstractions than those provided by this API, we recommend that you use a convenience library.

Today, many dApps are built on top of the higher-level API provided by [web3-react](https://github.com/NoahZinsmeister/web3-react) or [use-wallet](https://github.com/aragon/use-wallet) (which builds on top of web3-react). 

 * web3-react

We made a tiny lib [nc-connector](https://www.npmjs.com/package/@shree-chain/nc-connector) that implements the [AbstractConnector](https://github.com/NoahZinsmeister/web3-react/blob/v6/packages/abstract-connector/src/index.ts#L4) interface of [web3-react](https://github.com/NoahZinsmeister/web3-react) library. You can add this to your project in parallel with [injected-connector](https://github.com/NoahZinsmeister/web3-react/tree/v6/packages/injected-connector) by: `yarn add @shree-chain/nc-connector` or `npm i @shree-chain/nc-connector`.

```
import { BscConnector } from '@shree-chain/nc-connector'

export const bsc = new BscConnector({
  supportedChainIds: [56, 97] // later on 1 ethereum mainnet and 3 ethereum ropsten will be supported
})

// invoke method on bsc e.g.
await bsc.activate();
await bsc.getAccount();
await bsc.getChainId();
```

* use-wallet

There is an [example](https://github.com/aragon/use-wallet/tree/master/examples/shree-chain) in use-wallet origin repo shows how to 'inject' a customized web3-react connector to `UseWalletProvider`:

```
function App() {
  const { account, connect, reset, status } = useWallet()
  return (
    <div>
      <h1>Genesys Chain Connector</h1>
      {status === 'disconnected' ? (
        <button onClick={() => connect('bsc')}>Connect</button>
      ) : (
        <button onClick={() => reset()}>Disconnect</button>
      )}
      {account && <p>Connected as {account}</p>}
    </div>
  )
}

render(
  <UseWalletProvider
    connectors={{
      bsc: {
        web3ReactConnector() {
          return new BscConnector({ supportedChainIds: [56, 97] })
        },
        handleActivationError(err) {
          if (err instanceof UserRejectedRequestError) {
            return new ConnectionRejectedError()
          }
        },
      },
    }}
  >
  <App />
  </UseWalletProvider>,
  document.getElementById('root')
)
```

## Chain IDs

!!! warning

    At the moment, the [`Genesys Chain.chainId`](#ethereum-chainid) property and the [`chainChanged`](#chainchanged) event should be preferred over the `eth_chainId` RPC method.

    Their chain ID values are correctly formatted, per the table below.

    `eth_chainId` returns an incorrectly formatted (0-padded) chain ID for the chains in the table below, e.g. `0x01` instead of `0x1`. See the [Upcoming Breaking Changes section](#upcoming-breaking-changes) for details on when the `eth_chainId` RPC method will be fixed.

    Custom RPC endpoints are not affected; they always return the chain ID specified by the user.

These are the IDs of the GSYS Chains that Genesys Chain Wallet supports by default.

| Hex  | Decimal | Network                                        |
| ---- | ------- | ---------------------------------------------- |
| 0x38 | 56      | Genesys Chain Main Network (nc-mainnet) |
| 0x61 | 97      | Genesys Chain Test Network (nc-testnet) |

This API can also return chain ids of GSYS Chains if users switch to them. The possible return value would be:
| Chain Id             | Network                                  |
| -------------------- | ---------------------------------------- |
| GSYS-Chain-Tigris | Genesys Chain Main Network (bbc-mainnet) |
| GSYS-Chain-Ganges | Genesys Chain Test Network (bbc-testnet) |

## Properties

### Genesys Chain.chainId

!!! warning

    The value of this property can change at any time, and should not be exclusively relied upon. See the [`chainChanged`](#chainchanged) event for details.

**NOTE:** See the [Chain IDs section](#chain-ids) for important information about the Genesys Chain Wallet provider's chain IDs.


A hexadecimal string representing the current chain ID.

### Genesys Chain.autoRefreshOnNetworkChange

As the consumer of this API, it is your responsibility to handle chain changes using the [`chainChanged` event](#chainChanged).
We recommend reloading the page on `chainChange` unless you have a good reason not to.

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#ethereum-autorefreshonnetworkchange), the only difference is we injected a different object.

To disable this behavior, set this property to `false` immediately after detecting the provider:

```javascript
Genesys Chain.autoRefreshOnNetworkChange = false;
```

## Methods

### Genesys Chain.isConnected()

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#ethereum-isconnected), the only difference is we injected a different object.

```typescript
Genesys Chain.isConnected(): boolean;
```

### Genesys Chain.request(args)

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#ethereum-request-args), the only difference is we injected a different object.

We use this method to wrap an RPC API, Please see [the Ethereum wiki](https://eth.wiki/json-rpc/API#json-rpc-methods).

Important methods from this API include:

- [`eth_accounts`](https://eth.wiki/json-rpc/API#eth_accounts)
- [`eth_call`](https://eth.wiki/json-rpc/API#eth_call)
- [`eth_getBalance`](https://eth.wiki/json-rpc/API#eth_getBalance)
- [`eth_sendTransaction`](https://eth.wiki/json-rpc/API#eth_sendTransaction)
- [`eth_sign`](https://eth.wiki/json-rpc/API#eth_sign)

```typescript
interface RequestArguments {
  method: string;
  params?: unknown[] | object;
}

Genesys Chain.request(args: RequestArguments): Promise<unknown>;
```

#### Example

The code snippet below is as same as [MetaMask's example](https://docs.metamask.io/guide/ethereum-provider.html#example), the only difference is we injected a different object.

```javascript
params: [
  {
    from: '0xb60e8dd61c5d32be8058bb8eb970870f07233155',
    to: '0xd46e8dd67c5d32be8058bb8eb970870f07244567',
    gas: '0x76c0', // 30400
    gasPrice: '0x9184e72a000', // 10000000000000
    value: '0x9184e72a', // 2441406250
    data:
      '0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675',
  },
];

Genesys Chain
  .request({
    method: 'eth_sendTransaction',
    params,
  })
  .then((result) => {
    // The result varies by by RPC method.
    // For example, this method will return a transaction hash hexadecimal string on success.
  })
  .catch((error) => {
    // If the request fails, the Promise will reject with an error.
  });
```

### Genesys Chain.bnbSign(address: string, message: string): Promise<{publicKey: string, signature: string}>

*We prepared an example for this API, please check out:https://github.com/githubusername/githubrepo/js-eth-personal-sign-examples for more detail*

Like `eth_sign` enable dapp to verify a user has control over an ethereum address by signing an arbitrary message. We provide this method for dapp developers to request the signature of arbitrary messages for Genesys Chain (BC) and Genesys Chain (TC).

If `address` parameter is a shree chain address (start with `bnb` or `tbnb`), we will simply **calculate sha256 hash of the message** and let user sign the hash with his shree chain address' private key. Note: Genesys Chain uses the same elliptic curve (`secp256k1`) as Ethereum.

If `address` parameter is a Genesys Chain address (start with `0x`), the message would be hashed in the same way with [`eth_sign`](https://eth.wiki/json-rpc/API#eth_sign).

The returned `publicKey` would be a compressed encoded format (a hex string encoded 33 bytes starting with "0x02", "0x03") for Genesys Chain. And uncompressed encoded format (a hex string encoded 65 bytes starting with "0x04").

The returned `signature` would be bytes encoded in hex string starting with `0x`. For Genesys Chain, its r,s catenated 64 bytes in total. For Genesys Chain, like `eth_sign`, its r, s catenated 64 bytes and a recover byte in the end.

!!! warning

    DApp developers should verify whether the returned public key can be converted into the address user claimed in addition to an ECDSA signature verification. Because any plugin can inject the same object `Genesys Chain` as Genesys Chain Wallet.

### Genesys Chain.switchNetwork(networkId: string): Promise<{networkId: string}>

As Genesys Chain Wallet natively supports Genesys Chain and Genesys Chain which are heterogeneous blockchains run in parallel. APIs would be different in any situation. (We would open APIs for Genesys Chain very soon).

Developers could judge which network is selected by user currently via `Genesys Chain.chainId` or listening to the `chainChanged` event via `Genesys Chain.on('chainChanged', callback)`.

To request for network switching, developers could invoke this API with `bbc-mainnet` (Genesys Chain Main Network), `nc-mainnet` (Genesys Chain Main Network), `bbc-testnet` (Genesys Chain Test Network), `nc-testnet` (Genesys Chain Test Network) to prompt user to agree on network switching.

### Genesys Chain.requestAccounts()

Request all accounts maintained by this extension.

The `id` in response would be used as `accountId` for the APIs for Genesys Chain. 

This method would return an array of Account:
```
{
  addresses: [{address: string, type: string}],
  icon: string,
  id: string,
  name: string
}
```

For example:
```
[
    {
        "id":"fba0b0ce46c7f79cd7cd91cdd732b6c699440acf8c539d7e7d753d38c9deea544230e51899d5d9841b8698b74a3c77b79e70d686c76cb35dca9cac0e615628ed",
        "name":"Account 1",
        "icon":"data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIGZpbGw9Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9InNjLXBraElSIGhnRUNmUyI+PHJlY3Qgd2lkdGg9IjI0IiBoZWlnaHQ9IjI0IiByeD0iOCIgZmlsbD0iI2ZjNmU3NSI+PC9yZWN0Pjx0ZXh0IHg9IjUwJSIgeT0iNTAlIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0iIzFlMjAyNiIgc3R5bGU9ImZvbnQtc3R5bGU6bm9ybWFsO2ZvbnQtc2l6ZToxNHB4O2ZvbnQtZmFtaWx5OkJpbmFuY2VQbGV4LCAtYXBwbGUtc3lzdGVgsysAmI3gyNzsuU0ZOU1RleHQtUmVndWxhciYjeDI3OywgJiN4Mjc7U2FuIEZyYW5jaXNjbyYjeDI3OywKQmxpbmtNYWNTeXN0ZW1Gb250LCAmI3gyNzsuUGluZ0ZhbmctU0MtUmVndWxhciYjeDI3OywgJiN4Mjc7TWljcm9zb2Z0IFlhSGVpJiN4Mjc7LCAmI3gyNztTZWdvZSBVSSYjeDI3OywgJiN4Mjc7SGVsdmV0aWNhIE5ldWUmI3gyNzssCkhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYiPkE8L3RleHQ+PC9zdmc+",
        "addresses":[
            {
                "type":"bbc-testnet",
                "address":"tbnb1akt8vgstdaz8pax5zgykzee5u9kamjdkkcf2dw"
            },
            {
                "type":"bbc-mainnet",
                "address":"bnb1akt8vgstdaz8pax5zgykzee5u9kamjdkcdqwdl"
            },
            {
                "type":"eth",
                "address":"0x43364696e478E344E95831CE8427623202e5CBFb"
            }
        ]
    }
]
```

### Genesys Chain.transfer({fromAddress:string, toAddress:string, asset:string, amount:number, memo?: string, sequence?: number, accountId:string, networkId:string})>

Transfer certain `amount` of `asset` (GSYS or BEP2) on Genesys Chain.

`accountId` could be retrieved from the `Genesys Chain.requestAccounts` API (`id` field of each account)

`networkId` could be `bbc-mainnet` or `bbc-testnet`

For example:

1. This will ask the user's approval for transferring 1 GSYS to himself.
`Genesys Chain.transfer({fromAddress:"tbnb1sndxdzsg42jg8lc0hehx8dzzpyfxrvq937mt0w", toAddress:"tbnb1sndxdzsg42jg8lc0hehx8dzzpyfxrvq937mt0w", asset:"GSYS", amount:1, accountId:"fba0b0ce46c7f79cd7cd91cdd732b6c699440acf8c539d7e7d753d38c9deea544230e51899d5d9841b8698b74a3c77b79e70d686c76cb35dca9cac0e615628ed", networkId:"bbc-testnet"})`

2. This will ask the user's approval for transferring 1 BUSD to himself.
`Genesys Chain.transfer({fromAddress:"tbnb1sndxdzsg42jg8lc0hehx8dzzpyfxrvq937mt0w", toAddress:"tbnb1sndxdzsg42jg8lc0hehx8dzzpyfxrvq937mt0w", asset:"BUSD-BAF", amount:1, accountId:"fba0b0ce46c7f79cd7cd91cdd732b6c699440acf8c539d7e7d753d38c9deea544230e51899d5d9841b8698b74a3c77b79e70d686c76cb35dca9cac0e615628ed", networkId:"bbc-testnet"})`

## Events

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#events), the only difference is we injected a different object.


```javascript
Genesys Chain.on('accountsChanged', (accounts) => {
  // Handle the new accounts, or lack thereof.
  // "accounts" will always be an array, but it can be empty.
});

Genesys Chain.on('chainChanged', (chainId) => {
  // Handle the new chain.
  // Correctly handling chain changes can be complicated.
  // We recommend reloading the page unless you have a very good reason not to.
  window.location.reload();
});
```

### connect

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#connect), the only difference is we injected a different object.

```typescript
interface ConnectInfo {
  chainId: string;
}

Genesys Chain.on('connect', handler: (connectInfo: ConnectInfo) => void);
```

### disconnect

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#disconnect), the only difference is we injected a different object.

```typescript
Genesys Chain.on('disconnect', handler: (error: ProviderRpcError) => void);
```

### accountsChanged

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#accountschanged), the only difference is we injected a different object.

```typescript
Genesys Chain.on('accountsChanged', handler: (accounts: Array<string>) => void);
```

### chainChanged

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#chainchanged), the only difference is we injected a different object.

```typescript
Genesys Chain.on('chainChanged', handler: (chainId: string) => void);
```

```javascript
Genesys Chain.on('chainChanged', (_chainId) => window.location.reload());
```

### message

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#message), the only difference is we injected a different object.


```typescript
interface ProviderMessage {
  type: string;
  data: unknown;
}

Genesys Chain.on('message', handler: (message: ProviderMessage) => void);
```

## Errors

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#errors), the only difference is we injected a different object.

## Using the Provider

This snippet explains how to accomplish the three most common requirements for web3 sites:

- Detect which Genesys Chain network the user is connected to
- Get the user's Genesys Chain account(s)

```
/**********************************************************/
/* Handle chain (network) and chainChanged (per EIP-1193) */
/**********************************************************/

// Normally, we would recommend the 'eth_chainId' RPC method, but it currently
// returns incorrectly formatted chain ID values.
let currentChainId = Genesys Chain.chainId;

Genesys Chain.on('chainChanged', handleChainChanged);

function handleChainChanged(_chainId) {
  // We recommend reloading the page, unless you must do otherwise
  window.location.reload();
}

/***********************************************************/
/* Handle user accounts and accountsChanged (per EIP-1193) */
/***********************************************************/

let currentAccount = null;
Genesys Chain
  .request({ method: 'eth_accounts' })
  .then(handleAccountsChanged)
  .catch((err) => {
    // Some unexpected error.
    // For backwards compatibility reasons, if no accounts are available,
    // eth_accounts will return an empty array.
    console.error(err);
  });

// Note that this event is emitted on page load.
// If the array of accounts is non-empty, you're already
// connected.
Genesys Chain.on('accountsChanged', handleAccountsChanged);

// For now, 'eth_accounts' will continue to always return an array
function handleAccountsChanged(accounts) {
  if (accounts.length === 0) {
    // Genesys Chain Wallet is locked or the user has not connected any accounts
    console.log('Please connect to Genesys Chain Wallet.');
  } else if (accounts[0] !== currentAccount) {
    currentAccount = accounts[0];
    // Do any other work!
  }
}

/*********************************************/
/* Access the user's accounts (per EIP-1102) */
/*********************************************/

// You should only attempt to request the user's accounts in response to user
// interaction, such as a button click.
// Otherwise, you popup-spam the user like it's 1999.
// If you fail to retrieve the user's account(s), you should encourage the user
// to initiate the attempt.
document.getElementById('connectButton', connect);

function connect() {
  Genesys Chain
    .request({ method: 'eth_requestAccounts' })
    .then(handleAccountsChanged)
    .catch((err) => {
      if (err.code === 4001) {
        // EIP-1193 userRejectedRequest error
        // If this happens, the user rejected the connection request.
        console.log('Please connect to MetaMask.');
      } else {
        console.error(err);
      }
    });
}
```

## Legacy API

!!! warning
    You should **never** rely on any of these methods, properties, or events in practice.

This section documents MetaMask's legacy provider API.

To be compatible with existing dApps that support MetaMask, Genesys Chain Wallet implements them as well, but please don't rely on them. We may deprecate them soon in the future.

## Legacy Properties

### Genesys Chain.networkVersion (DEPRECATED)

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#legacy-properties), the only difference is we injected a different object.

### Genesys Chain.selectedAddress (DEPRECATED)

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#ethereum-selectedaddress-deprecated), the only difference is we injected a different object.

## Legacy Methods

### Genesys Chain.enable() (DEPRECATED)

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#ethereum-enable-deprecated), the only difference is we injected a different object.

### Genesys Chain.sendAsync() (DEPRECATED)

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#ethereum-sendasync-deprecated), the only difference is we injected a different object.

```typescript
interface JsonRpcRequest {
  id: string | undefined;
  jsonrpc: '2.0';
  method: string;
  params?: Array<any>;
}

interface JsonRpcResponse {
  id: string | undefined;
  jsonrpc: '2.0';
  method: string;
  result?: unknown;
  error?: Error;
}

type JsonRpcCallback = (error: Error, response: JsonRpcResponse) => unknown;

Genesys Chain.sendAsync(payload: JsonRpcRequest, callback: JsonRpcCallback): void;
```

### Genesys Chain.send() (DEPRECATED)

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#ethereum-send-deprecated), the only difference is we injected a different object.

```typescript
Genesys Chain.send(
  methodOrPayload: string | JsonRpcRequest,
  paramsOrCallback: Array<unknown> | JsonRpcCallback,
): Promise<JsonRpcResponse> | void;
```

This method behaves unpredictably and should be avoided at all costs.
It is essentially an overloaded version of [`Genesys Chain.sendAsync()`](#Genesys Chain-sendasync-deprecated).

`Genesys Chain.send()` can be called in three different ways:

```typescript
// 1.
Genesys Chain.send(payload: JsonRpcRequest, callback: JsonRpcCallback): void;

// 2.
Genesys Chain.send(method: string, params?: Array<unknown>): Promise<JsonRpcResponse>;

// 3.
Genesys Chain.send(payload: JsonRpcRequest): unknown;
```

You can think of these signatures as follows:

1. This signature is exactly like `Genesys Chain.sendAsync()`

2. This signature is like an async `Genesys Chain.sendAsync()` with `method` and `params` as arguments, instead of a JSON-RPC payload and callback

3. This signature enables you to call the following RPC methods synchronously:

   - `eth_accounts`
   - `eth_coinbase`
   - `eth_uninstallFilter`
   - `net_version`

## Legacy Events

### close (DEPRECATED)

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#close-deprecated), the only difference is we injected a different object.

```typescript
Genesys Chain.on('close', handler: (error: Error) => void);
```

### chainIdChanged (DEPRECATED)

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#chainidchanged-deprecated), the only difference is we injected a different object.

```typescript
Genesys Chain.on('chainChanged', handler: (chainId: string) => void);
```

### networkChanged (DEPRECATED)

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#networkchanged-deprecated), the only difference is we injected a different object.

```typescript
Genesys Chain.on('networkChanged', handler: (networkId: string) => void);
```

### notification (DEPRECATED)

Please refer to [MetaMask Doc](https://docs.metamask.io/guide/ethereum-provider.html#notification-deprecated), the only difference is we injected a different object.

```typescript
Genesys Chain.on('notification', handler: (payload: any) => void);
```
