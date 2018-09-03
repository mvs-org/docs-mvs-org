title: 元界资产跨链置换

# 1 简介


元界通过中心化代理服务实现跨链资产置换，代理服务会扫描不同主链上需要跨链置换资产的交易，就会以原子化的方式在目的主链上发送一笔等量资产的交易。用户只需按照规则发送其他链上的代币到元界中心账户，就可以自动兑换成元界的MST资产，同时也支持元界MST资产兑换到原来其他公链上。

以太坊ERC20标准是以太坊2015年推出的，是目前比较主流的协议体系。使用这种规则的代币，表现一种通用的规则，任何使用这个标准的都能都立即兼任以太坊钱包。我们的置换服务目前仅支持所有ERC20或基于ERC20标准的资产。


# 2 系统架构

跨链服务由以下两个模块组成:
* 预处理模块: 扫描不同主链上需要进行资产置换的代币交易，扫描过程中会获取兑换目的主链和地址，交易金额大小，同时也会过滤不符合规则的交易，如金额太小，目的资产类型不支持等
* 置换模块: 根据扫描到的结果在目标主链上发起一笔等量资产的交易到目的主链地址

## 2.1 不同公链地址关联

* ETH地址关联ETP数字身份

由于以太坊代币交易不支持附加额外地址信息，所以需要先绑定以太坊地址到元界的数字身份或地址上。我们在以太坊公链上创建了名字为ETPMap的智能合约，支持以太坊地址绑定元界数字身份或地址，该绑定支持多对一方式，绑定地址后，使用绑定过的以太坊地址发送代币到代理服务地址，就可以兑换资产到到元界的数字身份或地址上。合约地址为:0xa52b0a032139e6303b86cfeb0bb9ae780a610354, 可以在[以太坊区块浏览器](https://etherscan.io/)上查看合约源码。

* ETP 地址关联ETH

需要在元界公链上发送资产到tokendroplet账户下, 并且附加特殊格式的message, message包含目标公链类型和目标公链地址。目前在全节点，轻钱包，移动端都支持相关操作。以下是元界测试网络发起一笔置换的交易：
~~~
{
	"hash" : "5003d7a20ae865a4a69da284ee48cf8875ba84a109cebef6e7d3bdf4aaf619a9",
	"height" : 640679,
	"inputs" : 
	[
		{
			"address" : "t6yRKhAF5a6F29XGKUZmAfCqp69AHSPQHX",
			"previous_output" : 
			{
				"hash" : "5ad1ba953bbbef75233fd9689815cd607daccae548cabe95b1db6de2d6fae032",
				"index" : 3
			},
			"script" : "[ 304402204581a05a1787fb91bed3b967b1b55b574a5384808cd3b5850f706ad4e7c30937022030068b64deb5d904942740a18fd020ec26da8371fde0c6bd59c8396a8b3dc3ab01 ] [ 0306c687db5ffdc47024dcb8f9f75d0596954840e1dd1d2243608a0b3bad9b4d65 ]",
			"sequence" : 4294967295
		},
		{
			"address" : "t6yRKhAF5a6F29XGKUZmAfCqp69AHSPQHX",
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
			"address" : "tF9pfqY8p6cfjuhDVZu9aXBY1CBprgrpKm",
			"attachment" : 
			{
				"from_did" : "",
				"quantity" : 123400000,
				"symbol" : "ERCT2.EDU",
				"to_did" : "crosschain",
				"type" : "asset-transfer"
			},
			"index" : 0,
			"locked_height_range" : 0,
			"script" : "dup hash160 [ 5a40f31ced32e9fcad58a9b54e6f607843efac87 ] equalverify checksig",
			"value" : 0
		},
		{
			"address" : "tJNo92g6DavpaCZbYjrH45iQ8eAKnLqmms",
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
			"address" : "t6yRKhAF5a6F29XGKUZmAfCqp69AHSPQHX",
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
			"address" : "t6yRKhAF5a6F29XGKUZmAfCqp69AHSPQHX",
			"attachment" : 
			{
				"quantity" : 221600000,
				"symbol" : "ERCT2.EDU",
				"type" : "asset-transfer"
			},
			"index" : 3,
			"locked_height_range" : 0,
			"script" : "dup hash160 [ 00884b5e9e39465782228d996a8ee66be3c0f8ca ] equalverify checksig",
			"value" : 0
		},
		{
			"address" : "t6yRKhAF5a6F29XGKUZmAfCqp69AHSPQHX",
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
通过扫块方式获取符合规则的资产跨链交易。在扫描过程中会对发送到代理地址资产的交易进行校验，包括进行资产类型过滤，地址校验(以太坊地址，元界地址交易)，交易金额校验(元界最大支持8为小数位)，费用校验（元界发送会原来主链需要支付一定手续费），第三方节点验证（验证过程中会选择可靠的第三方服务器），只有符合规则的才会进行资产置换。预处理流程如下：

![预处理流程图](https://i.imgur.com/O5RlHy0.png)

## 2.3 置换模块
只有经过预处理的交易才能被用来置换。为了预防区块链分叉造成的一系列问题，每笔兑换交易都需要一定的块高确认


### 以太坊到元界:
以太坊地址需要先调用合约ETPMap绑定元界数字身份和地址，绑定地址后发送代币到代理人地址就可以在元界主网上的目的地址收到一笔等量的MST资产, 以太坊发送到ETP:

![以太坊到ETP](https://i.imgur.com/Mkox7Xr.jpg)

### 元界到以太坊：
元界置换回以太坊代币，需要发送特定格式的交易到tokendroplet账户，交易输出会包括目的主链类型(目前以太坊为'ETH')和目的地址，并支付一定的手续费
![ETP到以太坊](https://i.imgur.com/x0NbTtn.jpg)
