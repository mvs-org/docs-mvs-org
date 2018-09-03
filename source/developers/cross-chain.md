title: 元界资产跨链置换
comments: true
---

# 1 简介


元界通过中心化置换服务来实现以太坊`ERC20`资产与元界`MST`资产相互跨链置换。

#### 将以太坊`ERC20`资产置换为元界`MST`资产
> 1. 用户在元界区块链上创建数字身份；  
> 2. 用户用该数字身份的数据执行元界地址绑定合约，以便将以太坊地址与元界数字身份绑定起来；  
> 3. 用户将`ERC20`资产发送到元界资产置换的以太坊地址；  
> 4. 置换服务会自动处理交易，在元界链上往用户绑定的数字身份发送等量的`MST`资产。

#### 将元界`MST`资产置换为以太坊`ERC20`资产
> 1. 用户将可以置换的元界`MST`资产发送到元界资产置换的数字身份`droplet`；  
> 2. 置换服务会自动处理交易，在以太坊链上往用户指定的以太坊地址发送等量的`ERC20`资产。


# 2 系统架构

跨链服务由以下三个模块组成:
> 1. 地址绑定模块：将以太坊地址与元界数字身份绑定起来。  
> 2. 预处理模块：扫描不同需要进行资产置换的代币交易，扫描过程中会获取置换目标主链和地址，资产数量，同时也会过滤不符合规则的交易，如资产数量太少，目标资产类型不支持等。  
> 3. 置换模块: 根据扫描到的置换信息在目标主链上发起一笔等量资产的交易到目的主链地址

## 2.1 地址绑定

### 以太坊地址绑定元界数字身份

由于以太坊`ERC20`资产转账交易不支持附加额外的信息，所以需要先将以太坊地址与元界数字身份或地址绑定起来，推荐绑定数字身份。我们在以太坊公链上创建了名字为 ETPMap 的地址绑定智能合约，以支持将以太坊地址绑定元界数字身份或地址，该绑定操作支持将多个以太坊地址绑定到同一元界数字身份或地址。绑定关系建立以后，可以用绑定过的以太坊地址将`ERC20`资产发送到元界资产置换的以太坊地址，就可以在绑定的元界数字身份或地址上获得等量的`MST`资产。地址绑定智能合约的地址为：0xa52b0a032139e6303b86cfeb0bb9ae780a610354, 可以在[以太坊区块浏览器](https://etherscan.io/)上查看该合约源码。

### 元界地址关联以太坊地址

在元界公链上发送`MST`资产到元界资产置换的数字身份`droplet`下, 并且附加`json`格式的`message`, 该`message`包含目标公链类型以及要发送到的目标公链上的钱包地址。目前在全节点，轻钱包，移动端都支持该操作。

以下是将元界`MST`资产置换为以太坊`ERC20`资产的交易：
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

## 2.2 预处理模块
通过扫描交易的方式获取符合规则的资产跨链交易。在扫描过程中会对发送到资产置换地址的交易进行校验，包括资产类型过滤，地址校验(以太坊地址，元界地址交易)，资产数量校验，费用校验（将元界资产置换为以太坊`ERC20`资产需要支付`1 ETP`置换费用），第三方节点验证。只有符合规则的才会进行资产置换。

预处理流程如下：
![预处理流程图](https://i.imgur.com/O5RlHy0.png)

## 2.3 置换模块
经过预处理的交易会进入置换处理流程。为了预防区块链分叉造成的一系列问题，每笔兑换交易都需要经过一定的块高确认。


### 以太坊到元界:
以太坊地址需要先调用地址绑定智能合约`ETPMap`绑定到元界数字身份或地址，绑定关系建立后，发送以太坊`ERC20`资产到元界资产置换的以太坊地址：0xc1e5fd24fa2b4a3581335fc3f2850f717dd09c86，就可以在绑定的元界数字身份或地址收到一笔等量的`MST`资产。 

以太坊`ERC20`资产置换为`MST`资产:
![以太坊`ERC20`资产置换为`MST`资产](https://i.imgur.com/Mkox7Xr.jpg)

### `MST`资产置换为以太坊`ERC20`资产：
`MST`资产置换为以太坊`ERC20`资产，需要发送特定格式的交易到元界资产置换的数字身份`droplet`下，交易输出会包括目标主链类型(例如：以太坊为`ETH`)和目标链上的钱包地址，并支付`1 ETP`的置换费用。

`MST`资产置换为以太坊`ERC20`资产
![`MST`资产置换为以太坊`ERC20`资产](https://i.imgur.com/x0NbTtn.jpg)
