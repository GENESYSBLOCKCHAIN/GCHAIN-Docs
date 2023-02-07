# How to Run A Fullnode on Genesys Chain

## Fullnodes Functions

* Stores the full blockchain history on disk and can answer the data request from the network.
* Receives and validates the new blocks and transactions.
* Verifies the states of every accounts.

## Supported Platforms

We support running a full node on `Mac OS X`and `Linux`.

## Suggested Requirements

### Fullnode
- VPS running recent versions of Mac OS X or Linux.
- 4 cores of CPU and 8 gigabytes of memory (RAM).
- A broadband Internet connection with upload/download speeds of 5 megabyte per second


## Steps to Run a Full Node

Download  gsys_mainnet.json and static-nodes.json from  https://github.com/githubusername/githubrepo

```
wget  https://raw.githubusercontent.com/githubusername/githubrepo/master/gsys_mainnet.json
wget https://raw.githubusercontent.com/githubusername/githubrepo/master/static-nodes.json
```

Make node folder

```
mkdir node
```

Initialize the Node
```
./geth --datadir ./node init gsys_mainnet.json
```

Copy the static-nodes.json to node/geth

Run the Nodes

```
./geth --datadir node --syncmode 'full' --gcmode=archive --port 40605 --http --http.port 3545 --http.api 'personal,eth,net,web3,personal,admin,miner,txpool,debug' --bootnodes enode://c8ecb64c00a1e94eb47a997d62a14f07cc0dd6dac41a1b3a062a383b978dd87ab639c64db07c00d70e9a9c8af2c204e9220b349dc684394f44044f51def904ce@103.42.59.71:0?discport=40606 --networkid 16507 --allow-insecure-unlock

```
