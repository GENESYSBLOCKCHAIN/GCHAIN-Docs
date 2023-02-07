# Genesis File


This document explains how the genesis file of the Genesys Chain is structured.


## What is a Genesis File

A genesis file is a JSON file which defines the initial state of your blockchain. It can be seen as height `0` of your blockchain. The first block, at height `1`, will reference the genesis file as its parent.

The state defined in the genesis file contains all the necessary information, like initial token allocation, genesis time, default parameters, and more. Let us break down these information.

Genesis Link for mainnet:  <https://github.com/githubusername/githubrepo>



## Explaination

* **chainId**

**5177** for main-net and **49120** for test-net.  To compatible with third part service that already supports Ethereum, we’d better not use network id that Ethereum ecology that already used.  The network id of test-net should be distinct from main-net.


* **period**

Minimum difference between two consecutive block’s timestamps. Suggested 3s for the testnet .

* **epoch**

Number of blocks after which to checkpoint and reset the pending votes. Suggested 100 for testnet

* **nonce**

The nonce is the cryptographically secure mining proof-of-work that proves beyond reasonable doubt that a particular amount of computation has been expended in the determination of this token value.

In Genesys Chain, this value is always set to 0x0.


* **timestamp**

Must be at least the parent timestamp + BLOCK_PERIOD.

* **extraData**

	* EXTRA_VANITY: Fixed number of extra-data prefix bytes reserved for signer vanity. Suggested 32 bytes
	* Signer Info: validator address
	* EXTRA_SEAL bytes (fixed) is the signer’s signature sealing the header.

* **gasLimit**

A scalar value equal to the current chain-wide limit of Gas expenditure per block. High in our case to avoid being limited by this threshold during tests. Note: this does not indicate that we should not pay attention to the Gas consumption of our Contracts.

GasCeil is 40000000 for testnet

* **difficulty**

A scalar value corresponding to the difficulty level applied during the nonce discovering of this block.
Suggested 0x1 for testnet

* **mixHash**

Reserved for fork protection logic, similar to the extra-data during the DAO.
Must be filled with zeroes during normal operation.

* **coinbase**

System controled address for collecting block rewards

* **number**

Block height in the chain, where the height of the genesis is block 0.

* **parentHash**

The Keccak 256-bit hash of the entire parent block’s header (including its nonce and mixhash). Pointer to the parent block, thus effectively building the chain of blocks. In the case of the Genesis block, and only in this case, it's 0.


## Account and Address

This default wallet would use a similar way to generate keys as Ethereum, i.e. use 256 bits entropy to generate a 24-word mnemonic based on BIP39, and then use the mnemonic and an empty passphrase to generate a seed; finally use the seed to generate a master key, and derive the private key using BIP32/BIP44 with HD prefix as "44'/60'/", which is the same as Ethereum's derivation path.
