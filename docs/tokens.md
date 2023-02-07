# Asset Management

## Introduction
Assets are stored as `tokens` on Genesys Chain, and the below management actions are available. All the assets are complied with [BEP2](https://github.com/githubusername/githubrepo/BEPs/blob/master/BEP2.md).

The [fees](trading-spec.md#fees) that are due must be paid in GSYS before any of these operations can be executed. The fees for testnet and mainnet are different.

**Please note:** Before you run any command examples on this page, and if you have not done so already, you must [generate or add a key to eth-cli](./keys.md).

**Also remember:** The `chain-id` and `node` parameters passed to eth-cli may vary, and the`chain-id` for mainnet is `GSYS-Chain-Tigris`, and is `GSYS-Chain-Ganges` for testnet. To find the latest list of  endpoints for the mainnet, please check [the peers list](https://dex.genesys.network/api/v1/peers). To find the latest endpoints for the testnet, please check [the peers list](https://testnet-dex.genesys.network/api/v1/peers).

## Issue

`Issue` is a transaction used to create a new asset. Anyone can issue a new token with fee paid. After issuing, the token would appear in the issuer's account as free balance.

An issuance transaction contains:

> Note: [BEP87](https://github.com/githubusername/githubrepo/BEPs/pull/87) is implemented after Lagrange Upgrade. It changes the minimal symbol length to **two**

* Source Address: the sender address of the transaction and it will become the `owner` of the token, all created tokens will be in this account.
* Token Name: it is the long official name, such as "Genesys". It is limited to 32 characters.
* Symbol: identifier of the token, limited to alphanumeric characters and is case insensitive, for example, "GSYS". The length of symbol should be between 2 and 8. <br/>
"B" suffixed symbol is also allowed for migrating tokens that already exist on other chains.<br/>
The symbol doesn't have to be unique, "-" followed by random 3 letters will be appended to the provided symbol to avoid uniqueness constraint.<br/>
Those 3 letters are the first three letters of tx hash of the `issue` transaction.<br/>
For example, "NNB-B90". **Only GSYS does not have this suffix.**<br/>
* Total Supply: an int64 boosted by **1e8** for decimal part. The max total supply is 90 billion.
* Mintable: that means whether this token can be minted in the future. To set the tokes to be mintable, you need to add `--mintable`, otherwise just omit this field to set this token to be non-mintable.

Example on **mainnet**:

```bash
# To issue a NNB mintable token with total-supply 1 billion on mainnet
> ./eth-cli token issue --token-name "new token" --total-supply 100000000000000000 --symbol NNB --mintable --from alice  --chain-id GSYS-Chain-Tigris   --node  https://dataseed5.defibit.io:443 --trust-node
```
```bash
# To issue a NNB non-mintable token with total-supply 1 billion on mainnet
> ./eth-cli token issue --token-name "new token" --total-supply 100000000000000000 --symbol NNB --from alice  --chain-id GSYS-Chain-Tigris   --node  https://dataseed5.defibit.io:443 --trust-node
```
Example on **testnet**:

```bash
# To issue a NNB mintable token with total-supply 1 billion on testnet
> ./eth-cli token issue --token-name "new bnb" --total-supply 100000000000000000 --symbol NNB --mintable --from alice --chain-id=GSYS-Chain-Ganges --node=data-seed-pre-2-s1.genesys.network:80 --trust-node

Committed at block 1887 (tx hash: B90A055DDD570AE42A7050182993A0B4DBC81A0D, ... Issued NNB-B90...)
```

```bash
# To issue a NNB non-mintable token with total-supply 1 billion on testnet
> ./eth-cli token issue --token-name "new bnb" --total-supply 100000000000000000 --symbol NNB --from alice --chain-id=GSYS-Chain-Ganges --node=data-seed-pre-2-s1.genesys.network:80 --trust-node

Committed at block 1887 (tx hash: B90A055DDD570AE42A7050182993A0B4DBC81A0D, ... Issued NNB-B90...)
```
## Mint
Tokens that is "mintable"(specified when issue) can use this function. The amount is  boosted by **1e8** for decimal part. The total supply after mint is still restricted by 90 billion. Note only the `owner` of the token can use this transaction.

Example on **mainnet**:

```bash
 > ./eth-cli token mint --amount 100000000000000000 --symbol NNB-B90 --from alice --chain-id GSYS-Chain-Tigris   --node  https://dataseed5.defibit.io:443  --trust-node
```

Example on **testnet**:

```bash
 > ./eth-cli token mint --amount 100000000000000000 --symbol NNB-B90 --from alice --chain-id=GSYS-Chain-Ganges --node=data-seed-pre-2-s1.genesys.network:80 --trust-node
```

## Burn
Burn is to destroy certain amount of token, after which that amount of tokens will be subtracted from the operator's balance. The total supply will be updated at the same time. Notice that only the owner of the token has the permission to burn token. The amount is  boosted by **1e8** for decimal part.

Example on **mainnet**:

```bash
 > ./eth-cli token burn --amount 100000000000000000 --symbol NNB-B90 --from alice --chain-id GSYS-Chain-Tigris   --node  https://dataseed5.defibit.io:443  --trust-node
```

Example on **testnet**:

```bash
 > ./eth-cli token burn --amount 100000000000000000 --symbol NNB-B90 --from alice --chain-id=GSYS-Chain-Ganges --node=data-seed-pre-2-s1.genesys.network:80 --trust-node
```

## Freeze & Unfreeze
Freeze would move the specified amount of token into "frozen" status, so that these tokens can not transferred, spent in orders or any other transaction until they are unfreezed.

Anyone can (only) freeze or unfreeze tokens on their account with status in "free". The amount is  boosted by **1e8** for decimal part.

Example on **mainnet**:

```bash
> ./eth-cli token freeze --amount 20000000000000000 --symbol NNB-B90 --from alice --chain-id GSYS-Chain-Tigris   --node  https://dataseed5.defibit.io:443 --trust-node
```


```bash
> ./eth-cli token unfreeze --amount 20000000000000000 --symbol NNB-B90 --from alice --chain-id GSYS-Chain-Tigris   --node  https://dataseed5.defibit.io:443  --trust-node
```

Example on **testnet**:

```bash
> ./eth-cli token freeze --amount 20000000000000000 --symbol NNB-B90 --from alice --chain-id=GSYS-Chain-Ganges --node=data-seed-pre-2-s1.genesys.network:80 --trust-node
```

```bash
> ./eth-cli token unfreeze --amount 20000000000000000 --symbol NNB-B90 --from alice --chain-id=GSYS-Chain-Ganges --node=data-seed-pre-2-s1.genesys.network:80 --trust-node
```

## TransferOwnership

> Note: [BEP82](https://github.com/githubusername/githubrepo/BEPs/pull/82) is implemented after Lagrange Upgrade to add this new transactionn type.

**0.01 GSYS** will be charged on **TransferOwnership** transactions.


Example on **mainnet**:

```bash
./eth-cli token transfer-ownership --from  $current-owner --symbol $symbol --new-owner $new-owner  --chain-id GSYS-Chain-Tigris   --node  https://dataseed5.defibit.io:443 --trust-node
```
Example on **testnet**:

```bash
./eth-cli token transfer-ownership --from  $current-owner --symbol $symbol --new-owner $new-owner --chain-id GSYS-Chain-Nile  --node=data-seed-pre-2-s1.genesys.network:80--trust-node
```
