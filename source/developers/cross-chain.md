title: Cross-chain swap of Metaverse MST
comments: true
---

# 1 Introduction


Metaverse adopts a swap service to implement the cross-chain swap between Ethereum `ERC20` tokens and Metaverse `MST`.

#### Swap the Ethereum `ERC20` tokens for Metaverse `MST`
> 1. User create Avatars on Metaverse blockchain.
> 2. With the data of user’ Avatars, the contract linked with Metaverse address is executed to link Ethereum with their Avatars on Metaverse.
> 3. User send the `ERC20` tokens to the Ethereum address swapped by the Metaverse MST.
> 4. The swap service will automatically process the transactions, sending equivalent `MST` to Metaverse Avatars.

#### Swap the Metaverse `MST` for Ethereum`ERC20` tokens
> 1. User can send the Metaverse `MST` that can be swapped to the Avatars `droplets` swapped by Metaverse MST.
> 2. The swap service will automatically process the transactions, sending equivalent `ERC20` tokens to the Ethereum address specified by the user on the Ethereum blockchain.

# 2 System architecture

The cross-chain service consists of the following three modules:
> 1. Address Linking Module: to link the Ethereum address to the Avatar of Metaverse.
> 2. Preprocessing module: to scan different token transactions that need to be swapped. During the scanning process, the main chain, the address and the number of assets of the target transactions will be obtained, while those that do not meet the rules will be filtered. For example, the number of assets is too small, or the type of the target assets doesn’t yet support.
> 3. Swap module: to initiate a transaction of the same assets to the purposed main-chain address on the target main chain based on the scanned swap information.

## 2.1 Address Linking

### Linking Metaverse Avatar with Ethereum address

Since the transactions of Ethereum `ERC20` tokens doesn’t support additional information, it is necessary to link the Ethereum address with the Avatar or address of Metaverse at first, and the Avatar is mostly recommended. We created an address-linked smart contract called ETPMap on the Ethereum public blockchain to support the linking of the Ethereum address and the Metaverse Avatar or address, which also supports to link multiple Ethereum addresses to the same Metaverse Avatar or address. After the linking, the `ERC20` tokens can be sent to the Ethereum address swapped by Metaverse MST through the Ethereum address that have been linked. Thus, equivalent `MST` assets will be obtained from the linked Metaverse Avatar or address. The address of the address-linked smart contract is:
 0xa52b0a032139e6303b86cfeb0bb9ae780a610354, which can be viewed on the [Ethereum Block Browser](https://etherscan.io/).

### Associate Metaverse address with Ethereum address

The `MST` asset is sent to the Avatar `droplet` swapped by the Metaverse MST on the Metaverse public blockchain, and the `message` in the `json` format that is appended contains the target public blockchain type and the wallet address of the target main chain that will be sent to. Currently, this operation is supported on all nodes, light wallets, and mobile terminals.

The following is a transaction to swap Metaverse `MST` with the Ethereum `ERC20` tokens:
~~~
{
		"hash" : "5003d7a20ae865a4a69da284ee48cf8875ba84a109cebef6e7d3bdf4aaf619a9",
		"height" : 640679,
		"inputs" : 
		[
			{
				"address" : "M6yRKhAF5a6F29XGKUZmAfCqp69AHSPQHX",
				"previous_output" : 
				{
					"hash" : "5ad1ba953bbbef75233fd9689815cd607daccae548cabe95b1db6de2d6fae032",
					"index" : 3
				},
				"script" : "[ 304402204581a05a1787fb91bed3b967b1b55b574a5384808cd3b5850f706ad4e7c30937022030068b64deb5d904942740a18fd020ec26da8371fde0c6bd59c8396a8b3dc3ab01 ] [ 0306c687db5ffdc47024dcb8f9f75d0596954840e1dd1d2243608a0b3bad9b4d65 ]",
				"sequence" : 4294967295
			},
			{
				"address" : "M6yRKhAF5a6F29XGKUZmAfCqp69AHSPQHX",
				"previous_output" : 
				{
					"hash" : "5ad1ba953bbbef75233fd9689815cd607daccae548cabe95b1db6de2d6fae032",
					"index" : 2
				},
				"script" : "[ 304402201614b245b26c462d7611d766d1e1507394d30f9e45810ebe6621a9233824d78902201a45e9aba26c27c85ccf03852fcc3d3e525edb4850869f84a473e87773c9599201 ] [ 0306c687db5ffdc47024dcb8f9f75d0596954840e1dd1d2243608a0b3bad9b4d65 ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "MF9pfqY8p6cfjuhDVZu9aXBY1CBprgrpKm",
				"attachment" : 
				{
					"from_did" : "",
					"quantity" : 123400000,
					"symbol" : "ERC20.EDU",
					"to_did" : "droplet",
					"type" : "asset-transfer"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 5a40f31ced32e9fcad58a9b54e6f607843efac87 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MJNo92g6DavpaCZbYjrH45iQ8eAKnLqmms",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 7d9d74d3ca1f594f3e45416ca9509f77cd550f39 ] equalverify checksig",
				"value" : 100000000
			},
			{
				"address" : "M6yRKhAF5a6F29XGKUZmAfCqp69AHSPQHX",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 2,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 00884b5e9e39465782228d996a8ee66be3c0f8ca ] equalverify checksig",
				"value" : 16312295678
			},
			{
				"address" : "M6yRKhAF5a6F29XGKUZmAfCqp69AHSPQHX",
				"attachment" : 
				{
					"quantity" : 221600000,
					"symbol" : "ERC20.EDU",
					"type" : "asset-transfer"
				},
				"index" : 3,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 00884b5e9e39465782228d996a8ee66be3c0f8ca ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "M6yRKhAF5a6F29XGKUZmAfCqp69AHSPQHX",
				"attachment" : 
				{
					"content" : "{\"type\":\"ETH\",\"address\":\"0x8bB10939a8a36765a082905d4BfE8680F86eBF95\"}",
					"type" : "message"
				},
				"index" : 4,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 00884b5e9e39465782228d996a8ee66be3c0f8ca ] equalverify checksig",
				"value" : 0
			}
		],
		"version" : "4"
	}
~~~

## 2.2 Preprocessing module
The cross-chain transactions of assets that match the rules can be obtained by scanning the transactions. During the scanning process, the transactions that be sent to the address for swap will be verified, including asset type filtering, address verification (Ethereum address, Metaverse address transaction), asset quantity verification, cost verification (‘1 ETP’ to swap Metaverse MST for Ethereum ‘ERC20’ tokens) , and third-party node verification. Only the transactions that meet the rules can be swapped.

The preprocessing process is as follows:
![Preprocessing Flowchart][image-1]

## 2.3 Swap module
The pre-processed transactions will enter the swap process. In order to prevent a series of problems caused by blockchain forks, each exchange transaction needs to be confirmed by a certain block height.


### Swap Ethereum `ERC20` tokens for Metaverse `MST` 
The Ethereum address needs to first call the address-linked smart contract `ETPMap` to link to the Metaverse Avatar or address. After the linking, the Ethereum `ERC20` tokens can be sent to the Ethereum address swapped by Metaverse MST: 
`0xc1e5fd24fa2b4a3581335fc3f2850f717dd09c86`, then equivalent `MST` can be received on the Metaverse Avatar or address.
 

Swap Ethereum `ERC20` tokens for `MST` :
![Swap Ethereum `ERC20` tokens for `MST`][image-2]

### Swap Metaverse `MST` for Ethereum`ERC20` tokens:
To swap `MST` for Ethereum `ERC20` tokens needs to send the transactions of specific format to Avatars swapped by the Metaverse MST. The transaction output will include the type of the target main chain (eg: Ethereum belongs to `ETH`) and the wallet address on the target chain, which costs `1 ETP` as swap fee.

Swap `MST`  for Ethereum`ERC20` tokens
![Swap `MST`  for Ethereum`ERC20` tokens][image-3]


[image-1]:	https://i.imgur.com/O5RlHy0.png
[image-2]:	https://i.imgur.com/H08LV6X.png
[image-3]:	https://i.imgur.com/E2bWRKI.png