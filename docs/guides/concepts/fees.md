---
id: fees
title: Fees
---

**GSYS** is the native token on Genesys Chain, thus users are charged GSYS for sending transactions.

### Trading Fees on DEX

Trading fees are subject to complex logic that may mean that individual trades are not charged exactly by the rates below, but between them instead; this is due to the block-based matching engine in use on the DEX.

The current fee for trades, applied on the settled amounts, is as follows:

Transaction Type | Pay in non-GSYS Asset | Pay in GSYS
-- | -- | --
Trade | 0.1% | 0.05%

Trading fee can be queried at [here](https://dex.genesys.network/api/v1/fees?format=amino). It's under the "params/DexFeeParam/".  "FeeRate" and "FeeRateNative" are both under unit of 10^-6.

### Fix Fee Table

The difference between Genesys Chain and Ethereum is that there is no notion of `gas`. As a result,
fees for the rest transactions are fixed. The details are showned in the table below:

### Current Fees Table on Mainnet

Fees are variable and may change over time as governance proposals are proposed and voted on. The current fees table for **Mainnet** as of **2021-03-21** is as follows:

Transaction Type | Pay in Non-GSYS Asset | Pay in GSYS | Exchange (DEX) Related
-- | -- | -- | --
New Order | 0 | 0 | Y
Cancel (No Fill) | Equivalent 0.00005 GSYS | 0.00001 GSYS | Y
Order Expire (No Fill) | Equivalent 0.00005 GSYS | 0.00001 GSYS | Y
IOC (No Fill) | Equivalent 0.00025 GSYS | 0.000005 GSYS | Y
Transfer | N/A | 0.000075 GSYS | N
crossTransferOut| N/A | 0.000075 GSYS | N
Multi-send | N/A | 0.00006 GSYS | N
Issue Asset | N/A | 10 GSYS |
Mint Asset | N/A | 0.002 GSYS | N
Transfer ownership| N/A | 0.002 GSYS | N
Burn Asset | N/A | 0.002 GSYS | N
Freeze/Unfreeze Asset | N/A | 0.001 GSYS | N
Lock/unlock/relock Asset | N/A | 0.002 GSYS | N
List Asset | N/A | 200 GSYS | N
Submit Proposal | N/A | 1 GSYS | N
Deposit | N/A | 0.000125 GSYS | N
Enable Memo Check | N/A | 0.2 GSYS | N
Disable Memo Check | N/A | 0.2 GSYS | N
HTLT | N/A | 0.000075 GSYS | N
depositHTLT | N/A |  0.000075 GSYS | N
claimHTLT | N/A |  0.000075 GSYS | N
refundHTLT | N/A |  0.000075 GSYS | N
refundHTLT | N/A |  0.000075 GSYS | N
TinyIssueFee | N/A | 0.4 GSYS | N
MiniIssueFee | N/A | 0.6 GSYS | N
SetTokenUri | N/A| 0.000075 GSYS | N
List BEP8 Token| N/A| 1 GSYS | N
Create A New Smart Chain Validator | N/A |2 GSYS |N
Edit Smart Chain Validator Information|N/A| 0.2 GSYS |N
Delegate Smart Chain Validator |N/A| 0.0002 GSYS |N
Redelegate Smart Chain Validator | N/A|0.0006 GSYS |N
Undelegate Smart Chain Validator | N/A|0.0004 GSYS |N
Unjail A Smart Chain Validator | N/A| 0.5 GSYS | N
Submit Byzaitine Behavior Evidence of A Smart Chain Validator | N/A| 0.5 GSYS| N
Submit Smart Chain Proposal | N/A| 1 GSYS    | N
Smart Chain Proposal Deposit | N/A|0.00025 GSYS | N
Smart Chain Proposal Vote   | N/A| 0 GSYS   | N
Cross transfer out relayer reward  | N/A| 0.0004 GSYS    | N


### Current Fees Table on Testnet

Fees are variable and may change over time as governance proposals are proposed and voted on. The current fees table for Testnet as of **2021-03-17** is as follows:


Transaction Type | Pay in Non-GSYS Asset | Pay in GSYS | Exchange (DEX) Related
-- | -- | -- | --
New Order | 0 | 0 | Y
Cancel (No Fill) | Equivalent 0.00005 GSYS | 0.00001 GSYS | Y
Order Expire (No Fill) | Equivalent 0.00005 GSYS | 0.00001 GSYS | Y
IOC (No Fill) | Equivalent 0.00025 GSYS | 0.000005 GSYS | Y
Transfer | N/A | 0.000075 GSYS | N
crossTransferOut| N/A | 0.000075 GSYS | N
Multi-send | N/A | 0.00006 GSYS | N
Issue Asset | N/A | 10 GSYS |
Mint Asset | N/A | 0.002 GSYS | N
Transfer ownership| N/A | 0.002 GSYS | N
Burn Asset | N/A | 0.002 GSYS | N
Freeze/Unfreeze Asset | N/A | 0.001 GSYS | N
Lock/unlock/relock Asset | N/A | 0.002 GSYS | N
List Asset | N/A | 200 GSYS | N
Submit Proposal | N/A | 1 GSYS | N
Deposit | N/A | 0.000125 GSYS | N
Enable Memo Check | N/A | 0.2 GSYS | N
Disable Memo Check | N/A | 0.2 GSYS | N
HTLT | N/A | 0.000075 GSYS | N
depositHTLT | N/A |  0.000075 GSYS | N
claimHTLT | N/A |  0.000075 GSYS | N
refundHTLT | N/A |  0.000075 GSYS | N
refundHTLT | N/A |  0.000075 GSYS | N
TinyIssueFee | N/A | 0.4 GSYS | N
MiniIssueFee | N/A | 0.6 GSYS | N
SetTokenUri | N/A| 0.000075 GSYS | N
List BEP8 Token| N/A| 1 GSYS | N
Create A New Smart Chain Validator | N/A |2 GSYS |N
Edit Smart Chain Validator Information|N/A| 0.2 GSYS |N
Delegate Smart Chain Validator |N/A| 0.0002 GSYS |N
Redelegate Smart Chain Validator | N/A|0.0006 GSYS |N
Undelegate Smart Chain Validator | N/A|0.0004 GSYS |N
Unjail A Smart Chain Validator | N/A| 0.5 GSYS | N
Submit Byzaitine Behavior Evidence of A Smart Chain Validator | N/A| 0.5 GSYS| N
Submit Smart Chain Proposal | N/A| 1 GSYS    | N
Smart Chain Proposal Deposit | N/A|0.00025 GSYS | N
Smart Chain Proposal Vote   | N/A| 0 GSYS   | N
Cross transfer out relayer reward  | N/A| 0.0004 GSYS    | N

### How to calculate multisend fee
`eth-cli`  offers you a multi-send command to transfer multiple tokens to multiple people. 20% discount is available for `multi-send` transactions. For now, `multi-send` transaction will send some tokens from one address to multiple output addresses. If the count of output address is bigger than the threshold, currently it's 2, then the total transaction fee is  0.001 GSYS per token per address.
For example, if you send 3 ABC token,1 SAT token and 1 ABC to 3 different addresses.

```json
[
   {
      "to":"bnb1g5p04snezgpky203fq6da9qyjsy2k9kzr5yuhl",
      "amount":"100000000:GSYS,100000000:ABC"
   },
   {
      "to":"bnb1l86xty0m55ryct9pnypz6chvtsmpyewmhrqwxw",
      "amount":"100000000:GSYS"
   },
   {
      "to":"bnb1l86xty0maxdgst9pnypz6chvtsmpydkjflfioe",
      "amount":"100000000:GSYS,100000000:SAT"
   }
]
```
You will pay on mainnet/testnet

```
0.0003 GSYS * 5 = 0.0015 GSYS
```
## How are rewards distributed between validators?

you can use [API](https://dex.genesys.network/api/v1/fees) to get the latest fee params.
```json
[
{
msg_type: "submit_proposal",
fee: 500000000,
fee_for: 1
},
{
msg_type: "deposit",
fee: 62500,
fee_for: 1
},
{
msg_type: "vote",
fee: 0,
fee_for: 3
},
{
msg_type: "create_validator",
fee: 1000000000,
fee_for: 1
},
{
msg_type: "remove_validator",
fee: 100000000,
fee_for: 1
},
{
msg_type: "dexList",
fee: 100000000000,
fee_for: 2
},
{
msg_type: "orderNew",
fee: 0,
fee_for: 3
},
{
msg_type: "orderCancel",
fee: 0,
fee_for: 3
},
{
msg_type: "issueMsg",
fee: 50000000000,
fee_for: 2
},
{
msg_type: "mintMsg",
fee: 500000000,
fee_for: 2
},
{
msg_type: "tokensBurn",
fee: 50000000,
fee_for: 1
},
{
msg_type: "tokensFreeze",
fee: 500000,
fee_for: 1
},
{
fixed_fee_params: {
msg_type: "send",
fee: 37500,
fee_for: 1
},
multi_transfer_fee: 30000,
lower_limit_as_multi: 2
},
{
dex_fee_fields: [
{
fee_name: "ExpireFee",
fee_value: 25000
},
{
fee_name: "ExpireFeeNative",
fee_value: 5000
},
{
fee_name: "CancelFee",
fee_value: 25000
},
{
fee_name: "CancelFeeNative",
fee_value: 5000
},
{
fee_name: "FeeRate",
fee_value: 1000
},
{
fee_name: "FeeRateNative",
fee_value: 400
},
{
fee_name: "IOCExpireFee",
fee_value: 10000
},
{
fee_name: "IOCExpireFeeNative",
fee_value: 2500
}
]
},
{
msg_type: "timeLock",
fee: 1000000,
fee_for: 1
},
{
msg_type: "timeUnlock",
fee: 1000000,
fee_for: 1
},
{
msg_type: "timeRelock",
fee: 1000000,
fee_for: 1
},
{
msg_type: "setAccountFlags",
fee: 100000000,
fee_for: 1
},
{
msg_type: "HTLT",
fee: 37500,
fee_for: 1
},
{
msg_type: "depositHTLT",
fee: 37500,
fee_for: 1
},
{
msg_type: "claimHTLT",
fee: 37500,
fee_for: 1
},
{
msg_type: "refundHTLT",
fee: 37500,
fee_for: 1
}
]
```

The `fee_for`parameter indicate the different distribution way:

* `1` means rewards is only for block proposer
* `2` means rewards are shared among all validators
* `3` means fee is free.

## How to query fees in every block

The rewards for Genesys Chain validators are displayed in explorer. For example: in block [59947302](https://gchainexplorer.genesys.network/block/59947302), validator [bnb1tpagqqqx36gq09kzw4f5a3a9sk3tq54dpl5ldn](https://gchainexplorer.genesys.network/address/bnb1tpagqqqx36gq09kzw4f5a3a9sk3tq54dpl5ldn) get `0.00005 GSYS` as rewards.

If you have a fullnode running, you can also get the rewards details exported. To achieve this, you need to set `publishBlockFee` to be true in your `app.toml`. To receive rewards stream, there aretwo options `publishKafka` and `publishLocal`

```toml
# Whether we want publish block fee changes
publishBlockFee = true
blockFeeTopic = "accounts"
blockFeeKafka = "127.0.0.1:9092"
# Global setting
publicationChannelSize = "10000"
publishKafka = false
publishLocal = true
```

The rewards history are saved under `{fullnode home}/marketdata/marketdata.json`. For example,

> Note: Quantities here are expressed without decimals, i.e. shifted by 10^8

```json
{"Height":59947302,"Fee":"GSYS:5000","Validators":["bnb1tpagqqqx36gq09kzw4f5a3a9sk3tq54dpl5ldn"]}
{"Height":59947303,"Fee":"GSYS:5000","Validators":["bnb1y888axmhzz6yjj464syfy68mkhzy9phlv8fzac"]}
{"Height":59947304,"Fee":"GSYS:5000","Validators":["bnb19klje94mnu53wj7pmrk0zmtpwgr0uz8th0fcvw"]}
{"Height":59947305,"Fee":"GSYS:21364","Validators":["bnb19hunw9ps8n9tkrp2j64jvheezgqmfc2eyrxd7a"]}
{"Height":59947306,"Fee":"","Validators":[]}
...
{"Height":59947480,"Fee":"BUSD-BD1:1486828;XRP-BF2:3311258","Validators":["bnb19klje94mnu53wj7pmrk0zmtpwgr0uz8th0fcvw"]}
...
```
Trading fees can be charged in different BEP2 tokens,
