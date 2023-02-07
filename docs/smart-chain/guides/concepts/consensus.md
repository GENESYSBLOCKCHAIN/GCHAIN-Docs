# Consensus Engine of Genesys Chain

## Abstract
We target to design the consensus engine of GSYS (Genesys Chain) to achieve the following goals:

1. Wait a few blocks to confirm (should be less than Ethereum 1.0), better no fork in most cases.
2. Blocking time should be shorter than Ethereum 1.0, i.e. 5 seconds or less.
3. No inflation, the block reward is transaction gas fees.
4. As much as compatible as Ethereum.
5. With staking and governance as powerful as cosmos.


[Geth](https://github.com/ethereum/go-ethereum/wiki/geth) implements two kinds of consensus engine: ethash (based on PoW) and [clique](https://ethereum-magicians.org/t/eip-225-clique-proof-of-authority-consensus-protocol/1853) (base on PoA). Ethash is not a fit option for GSYS because GSYS gives up PoW. Clique has smaller blocking time and is invulnerable to 51% attack while doing as little to the core data structure as possible to preserve existing Ethereum client compatibility. The shortcoming of PoA is centralization, and the lack of meaningful staking and governance capability on-chain.  On the other hand, the Genesys Chain is built on Cosmos which does have a deployed staking and governance mechanism. Thus here we try to propose a consensus engine that:

* Genesys Chain does the staking and governance parts for TC.
* Consensus engine of GSYS keeps as simple as clique.

We investigated some popular implementations of PoA consensus and find out that [Bor](https://blog.matic.network/heimdall-and-bor-matic-validator-and-block-production-layers/) follows a similar design as above. We will borrow a few parts from Bor and propose a new consensus engine to achieve all these goals.

## Infrastructure Components

**Genesys Chain**. It is responsible for holding the staking function to determine validators of GSYS through independent election, and the election workflow are performed via staking procedure.

## Consensus Protocol

The implement of the consensus engine is named as [clique](https://ethereum-magicians.org/t/eip-225-clique-proof-of-authority-consensus-protocol/1853). This doc will focus more on the difference and ignore the common details.

Before introducing, we would like to clarify some terms:

1. Epoch block. Consensus engine will update validatorSet from NCValidatorSet contract periodly.  For now the period is 200 blocks, a block is called epoch block if the height of it is times of 200.
2. Snapshot.  Snapshot is an assistant object that help to store the validators and recent signers of blocks.


### Key features

#### Light client security
Validators set changes take place at the (epoch+N/2) blocks. (N is the size of validatorset before epoch block). Considering the security of light client, we delay N/2 block to let validatorSet change take place.

Every epoch block, validator will query the validatorset from contract and fill it in the extra_data field of block header. Full node will verify it against the validatorset in contract. A light client will use it as the validatorSet for next epoch blocks, however, it can not verify it against contract, it has to believe the signer of the epoch block. If the signer of the epoch block write a wrong extra_data, the light client may just go to a wrong chain. If we delay N/2 block to let validatorSet change take place, the wrong
epoch block won’t get another N/2 subsequent blocks that signed by other validators, so that the light client is free of such attack.

#### System transaction
The consensus engine may invoke system contracts, such transactions are called system transactions. System transactions is signed by the validator who is producing the block. For the witness node, will generate the system transactions (without signature) according to its intrinsic logic and compare them with the system transactions in the block before applying them.

#### Enforce backoff
In Clique consensus protocol, out-of-turn validators have to wait a randomized amount of time before sealing the block. It is implemented in the client-side node software and works with the assumption that validators would run the canonical version.
However, given that validators would be economically incentivized to seal blocks as soon as possible, it would be possible that the validators would run a modified version of the node software to ignore such a delay. To prevent validator rushing to seal a block, every out-turn validator will get a specified time slot to seal the block. Any block with an earlier blocking time produced by an out-turn validator will be discarded by other witness node.

### How to Produce a new block

#### Step 1: Prepare
A validator node prepares the block header of next block.

* Load snapshot from cache or database,
*  Every epoch block, will store validators set message in `extraData` field of block header to facilitate the implement of light client.
* The coinbase is the address of the validator

#### Step2: FinalizeAndAssemble

* If the validator is not the in turn validator, will call liveness slash contract to slash the expected validator and generate a slashing transaction.
* If there is gas-fee in the block, will distribute **1/16** to system reward contract, the rest go to validator contract.

#### Step3: Seal
The final step before a validator broadcast the new block.

* Sign all things in block header and append the signature to extraData.
* If it is out of turn for validators to sign blocks, an honest validator it will wait for a random reasonable time.

### How to Validate/Replay a block

#### Step1: VerifyHeader
Verify the block header when receiving a new block.

* Verify the signature of the coinbase is in `extraData` of the `blockheader`
* Compare the block time of the `blockHeader` and the expected block time that the signer suppose to use, will deny a `blockerHeader` that is smaller than expected. It helps to prevent a selfish validator from rushing to seal a block.
* The `coinbase` should be the signer and the difficulty should be expected value.

#### Step2: Finalize

* If it is an epoch block, a validator node will fetch validatorSet from NCValidatorSet and compare it with extra_data.
* If the block is not generated by inturn validatorvalidaror, will call slash contract.
if there is gas-fee in the block, will distribute 1/16 to system reward contract, the rest go to validator contract.
* The transaction generated by the consensus engine must be the same as the tx in block.

### Signature
The signature of the coinbase is in extraData of the blockheader, the structure of extraData is:
epoch block. 32 bytes of extraVanity + N*{20 bytes of validator address} + 65 bytes of signature.
none epoch block. 32 bytes of extraVanity + 65 bytes of signature.
The signed content is the `Keccak256` of RLP encoded of the block header.


### Security and Finality
Given there are more than 1/2\*N+1 validators are honest, PoA based networks usually work securely and properly. However, there are still cases where certain amount Byzantine validators may still manage to attack the network, e.g. through the “Clone Attack”. To secure as much as BC, GSYS users are encouraged to wait until receiving blocks sealed by more than 2/3\*N+1 different validators. In that way, the GSYS can be trusted at a similar security level to BC and can tolerate less than 1/3\*N Byzantine validators.

With 21 validators, if the block time is 5 seconds, the 2/3\*N+1 different validator seals will need a time period of (2/3\*21+1)\*5 = 75 seconds. Any critical applications for GSYS may have to wait for 2/3\*N+1 to ensure a relatively secure finality. However, besides such an arrangement, GSYS does introduce Slashing logic to penalize Byzantine validators for double signing or instability. This Slashing logic will expose the malicious validators in a very short time and make the [Clone Attack](https://arxiv.org/pdf/1902.10244.pdf) very hard or extremely non-economic to execute. With this enhancement, 1/2\*N+1 or even fewer blocks are enough as confirmation for most transactions.

### Potential Issue

#### Extending the ruling of the current validator set via temporary censorship
If the transaction that updates the validator is sent to the GSYS right on the epoch period, then it is possible for the in-turn validator to censor the transaction and not change the set of validators for that epoch. While a transaction cannot be forever censored without the help of other n/2 validators, by this it can extend the time of the current validator set and gain some rewards. In general, the probability of this scheme can increase by colluding with other validators. It is relatively benign issue that a block may be approximately 5 secs and one epoch being 240 blocks, i.e. 20 mins so the validators could only be extended for another 20 mins.