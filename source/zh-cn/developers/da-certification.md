title: MST的资产证书
comments: false
---

## 什么是资产证书
资产证书是元界智能资产某种权益的凭证。资产证书具有唯一性，可以在不同数字身份之间转移。目前支持发行权凭证相关证书，如：域名权证书、增发权证书、冠名权证书。持有相应的证书才能够发行、增发相关的智能资产，或者颁发证书。

在下面的范例中，将统一使用帐户名为 `Alice`，密码为 `passwd1`，数字身份（DID）为 `Alice`，地址为`测试地址`，作为演示示例。您在参考时请修改为自己的帐户名、密码、数字身份以及正确的地址。账户与数字身份可以通过 `"mvs-cli getnewaccount 帐户名 密码"` 和 `"mvs-cli registerdid 帐户名 密码 测试地址 测试DID"` 生成。

有了帐户和数字身份，如果要发布或发送资产等，需要确保相关地址下有足够的 ETP 来缴纳手续费，每发行一笔资产需要 10 ETP 的手续费。可以通过 `"mvs-cli getbalance account_name password"` 查询帐户总余额详情，也可以通过 `"mvs-cli listbalances account_name password"` 查询帐户里各个地址下的余额。

所有命令都可以通过 `help` 查询帮助，例如使用 `"mvs-cli help createasset"` 或者 `"mvs-cli createasset -h"` 查询命令 `createasset` 的帮助。

## 资产证书的种类
目前支持域名权、增发权、冠名权三种类型的证书：
> **issue**: 增发权证书，只有拥有该证书的账户才可以二次增发与证书名字同名的资产。该证书在发行可以二次增发的资产时自动颁发给发行者。相关命令：`createasset` 和 `issue`。  
> **domain**: 域名权证书，拥有该证书的账户，可以发行资产名字以该证书名字为域名的资产。比如，拥有名为 `MVS` 的域名证书的账户可以发行名为 `MVS.XYZ` 的资产。该证书在首次发行以证书名字为域名的资产时自动颁发给发行者，遵循先发先得的公平原则。比如：全网没有以名为 `MVS` 的域名证书，账户 `Alice` 在发行名为 `MVS.ALICE` 的资产时，`Alice`就自动获得了名为 `MVS` 的域名证书，此后`Alice`可以发行名字以 `MVS.` 开头的其他资产，而账户 `Bob` 则不可以发行名字以 `MVS.` 开头的资产，除非 `Alice` 颁发名字以 `MVS.` 开头的冠名权证书给 `Bob`。相关命令：`createasset` 和 `issue`。  
> **naming**: 冠名权证书，拥有该证书的账户，可以发行资产名字与证书名字同名的资产。拥有域名权证书的账户可以颁发以域名权证书名字为域名的冠名权证书。比如：拥有名为 `MVS` 的域名证书的账户 `Alice` 可以颁发名为 `MVS.BOB` 的冠名权证书给账户 `Bob` 的某个数字身份，这样 `Bob` 就能够发行名为 `MVS.BOB` 的资产。相关命令：`issuecert`。    

**注：发行名字以句点`.`开头的资产不会获得任何域名证书，因为该资产名字不具有有效的域名。**

## 获得资产证书
域名权和增发权两种类型的证书在发行资产时自动颁发给发行者，冠名权证书通过命令 `issuecert` 颁发。关于资产发行详情请参考[MST 资产发行](/zh-cn/developers/da-issue.html)。

### 获得域名权或增发权证书

1. 通过命令 `createasset` 创建可以二次增发的资产
`createasset` 命令的 `--rate` 选项的值如果为 -1（自由增发）或在范围[1, 100]之间，则创建可以二次增发的资产
```bash
命令：
$ mvs-cli createasset Alice passwd1 --symbol MVS.ALICE --volume 1000000000000 --description "Asset of Alice." --issuer Alice --decimalnumber 8 --rate -1

输出：
{
	"asset" : 
	{
		"address" : "",
		"decimal_number" : 8,
		"description" : "Asset of Alice.",
		"is_secondaryissue" : false,
		"issuer" : "Alice",
		"maximum_supply" : 1000000000000,
		"secondaryissue_threshold" : 127,
		"status" : "unissued",
		"symbol" : "MVS.ALICE"
	}
}
```
2. 通过命令 `issue` 发行资产获得证书
在发行名为 `MVS.ALICE` 的资产前，全网还不存在名为 `MVS` 的域名权证书，因此 `Alice` 在发行该资产后，获得了名为 `MVS` 的域名权证书。该资产具有二次增发属性，所以 `Alice` 同时还获得了与资产名字同名的增发权证书。从下面示例输出的 "outputs" 中可以看到 "cert" 字段为 "issue" 和 "domain" 的两种证书。
```bash
命令：
$ ./mvs-cli issue Alice passwd1 MVS.ALICE

输出：
{
	"transaction" : 
	{
		"hash" : "c59dd8b85ccbeb3de74c2ae941e93fcb8382ab7a69232afbb9d1a75259261370",
		"inputs" : 
		[
			{
				"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
				"previous_output" : 
				{
					"hash" : "2e3289b90684af4eb52ed165add145e0f676775c043168c53818c4b17f999406",
					"index" : 0
				},
				"script" : "[ 3044022029824345c3107291a18cad415af216c036c3ec4923470c3d09ff6b252e7cf3e20220043bc708a087f3275051f36526b9a893db9be5a071c63f751e78e7a4e5c14da601 ] [ 02a029b13a09ea3ae9cec784e3997c8f7098c73333c737e27a8cd82dcaad18040b ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
				"previous_output" : 
				{
					"hash" : "6d17adee2a7aaeacf31b0e7e7da128f9c43a02ef5a375391039fc639435c0379",
					"index" : 0
				},
				"script" : "[ 304402200d352a6ed742851405ee31e59f9baded2264fa1222b6d60f4dc8e90bb95d9b0902207534a74363c88b6115f85ed4cc8e2173f47bc158617aa2ec632cd583c6223d4201 ] [ 02a029b13a09ea3ae9cec784e3997c8f7098c73333c737e27a8cd82dcaad18040b ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
				"previous_output" : 
				{
					"hash" : "12eb2520482032359a153c60950fe671b38a1af5292bc5a44b8225105207336b",
					"index" : 0
				},
				"script" : "[ 3045022100ba2ac6dbc5f7948bddb2e604e2379f44d10914ffd53a2cbfb608d8f9da3d67b602207cd390b3fcdf273c4d12223a31225f9c0d87fddc4d56de7f7f703d8899dceee201 ] [ 02a029b13a09ea3ae9cec784e3997c8f7098c73333c737e27a8cd82dcaad18040b ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
				"previous_output" : 
				{
					"hash" : "bd4034b2ccf216d1a892e20bb74bba50fd7b2e31561e5f4cb82b3cf7fe04a9e9",
					"index" : 0
				},
				"script" : "[ 3044022028a127eacd6d1675ebd046033a00c9cd0bbdce0ad7ba9536862a39c34ae0ccbd02202eff0705c5347c7aaf171211c0ef66aea294b2d8c570c466f9de643de16251f201 ] [ 02a029b13a09ea3ae9cec784e3997c8f7098c73333c737e27a8cd82dcaad18040b ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
				"attachment" : 
				{
					"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
					"decimal_number" : 8,
					"description" : "Asset of Alice.",
					"from_did" : "Alice",
					"is_secondaryissue" : false,
					"issuer" : "Alice",
					"quantity" : 1000000000000,
					"secondaryissue_threshold" : 127,
					"symbol" : "MVS.ALICE",
					"to_did" : "Alice",
					"type" : "asset-issue"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 82ecff3d87cc01a8a539dfd8d5e0cac0639c0088 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
				"attachment" : 
				{
					"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
					"cert" : "issue",
					"from_did" : "Alice",
					"owner" : "Alice",
					"symbol" : "MVS.ALICE",
					"to_did" : "Alice",
					"type" : "asset-cert"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 82ecff3d87cc01a8a539dfd8d5e0cac0639c0088 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
				"attachment" : 
				{
					"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
					"cert" : "domain",
					"from_did" : "Alice",
					"owner" : "Alice",
					"symbol" : "MVS",
					"to_did" : "Alice",
					"type" : "asset-cert"
				},
				"index" : 2,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 82ecff3d87cc01a8a539dfd8d5e0cac0639c0088 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 3,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 82ecff3d87cc01a8a539dfd8d5e0cac0639c0088 ] equalverify checksig",
				"value" : 200000000
			}
		],
		"version" : "4"
	}
}
```

### 获得域名权证书
拥有域名权证书的账户可以通过命令 `issuecert` 给指定数字身份颁发名字以域名权证书名字为域名的冠名权证书。

`issuecert` 命令所需五个参数依次为：帐户名，密码，接收数字身份，资产符号，证书类型。目前仅支持 `naming` 类型的证书。

下面的示例中，`Alice` 拥有名为 `MVS` 的域名权证书，`Alice` 向数字身份 `Bob` 颁发名为 `MVS.BOB` 的冠名权证书。

```bash
命令：
$ ./mvs-cli issuecert Alice passwd1 Bob MVS.BOB naming

输出：
{
	"transaction" : 
	{
		"hash" : "4c4e7cf3b2bfe9e144034185fb196021624c7de7f3d0543f50f40ac92898f95d",
		"inputs" : 
		[
			{
				"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
				"previous_output" : 
				{
					"hash" : "9699bde668c9ff33ede227a348ac9168349b15d94e14ef50c3bb6215b0c6e331",
					"index" : 0
				},
				"script" : "[ 304402200315e981d5795301c52e605eff7863ad89c668bed6ab381ed8519fd092b48bf6022054fca9a9de7d6b5e2ddf73c5d4491ae682ab5ba3ed1ad2c012b6bc9269f88bc101 ] [ 02a029b13a09ea3ae9cec784e3997c8f7098c73333c737e27a8cd82dcaad18040b ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
				"previous_output" : 
				{
					"hash" : "c59dd8b85ccbeb3de74c2ae941e93fcb8382ab7a69232afbb9d1a75259261370",
					"index" : 2
				},
				"script" : "[ 304402204d12ab35a9140059c4b6c813a5d44934b47d0a4dadf70aa686cb6356ceed5768022020dbfa0ca53b3f6e8f9849c34deffc89ecf4f91a2c8c2b7c3c31bd69062bdf9201 ] [ 02a029b13a09ea3ae9cec784e3997c8f7098c73333c737e27a8cd82dcaad18040b ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
				"attachment" : 
				{
					"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
					"cert" : "naming",
					"from_did" : "Alice",
					"owner" : "Bob",
					"symbol" : "MVS.BOB",
					"to_did" : "Bob",
					"type" : "asset-cert"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 39990f81b91b7a35092517dfd5c8942c9e5f48f8 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
				"attachment" : 
				{
					"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
					"cert" : "domain",
					"from_did" : "Alice",
					"owner" : "Alice",
					"symbol" : "MVS",
					"to_did" : "Alice",
					"type" : "asset-cert"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 82ecff3d87cc01a8a539dfd8d5e0cac0639c0088 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 2,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 82ecff3d87cc01a8a539dfd8d5e0cac0639c0088 ] equalverify checksig",
				"value" : 299990000
			}
		],
		"version" : "4"
	}
}
```

## 使用资产证书
证书的使用通常都是隐式的，如资产发行（`issue`）可能会使用域名权证书或冠名权证书，资产增发（`secondaryissue`）时会使用增发权证书，以及上例中的颁发（`issuecert`）冠名权证书会使用域名权证书。但转移证书命令 `transfercert` 列外，使用该命令时需要显式指定证书名字与证书类型。

### 使用冠名权证书发行资产
在前面的示例中，`Alice` 向 `Bob` 颁发了名为 `MVS.BOB` 的冠名权证书，接下来 `Bob` 就使用该冠名权证书创建并发行同名的资产。由于该资产具有增发属性，所以在该资产发行后，`Bob` 获得了名为 `MVS.BOB` 的增发权证书。

1. 创建资产
```bash
$ ./mvs-cli createasset Bob passwd1 --symbol MVS.BOB --volume 1000000000000 --description "Asset of BOB." --issuer Bob --decimalnumber 8 --rate -1
{
	"asset" : 
	{
		"address" : "",
		"decimal_number" : 8,
		"description" : "Asset of BOB.",
		"is_secondaryissue" : false,
		"issuer" : "Bob",
		"maximum_supply" : 1000000000000,
		"secondaryissue_threshold" : 127,
		"status" : "unissued",
		"symbol" : "MVS.BOB"
	}
}
```

2. 发行资产
```bash
$ ./mvs-cli issue Bob passwd1 MVS.BOB
{
	"transaction" : 
	{
		"hash" : "a0cb6febeaae13074820e213838fd11d781c037c92a54409dd9da1713d1b0310",
		"inputs" : 
		[
			{
				"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
				"previous_output" : 
				{
					"hash" : "d43765fa894578bdf439d3e003ecbcdc5ecfd27f176a01c2b2f295ae16842579",
					"index" : 0
				},
				"script" : "[ 3045022100e70d1466a1b95ab5804b2308320b3949b7a4c4d955cd2faa3a7ab48384915166022044e722ea727163fbb7252c3c03461a80c9ead7b6dcc74c1228c9a870c900ed0401 ] [ 029b5650eb1b896f76068a6867b03142f6cd25459b463d92aa4bd4b2efc10ef41d ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
				"previous_output" : 
				{
					"hash" : "cef2aacbc7d2151376b988a333d5ae975ff77ac6b4c7b1034ce952f8c0666576",
					"index" : 0
				},
				"script" : "[ 3044022009fa8559d74222ae15de78220af56d579c39297ee8897da7c365b3c672bb93c3022065ce5d50bfc6356241a3354a9edc90127aeb1abcb682e8f0a4ade6d86228121e01 ] [ 029b5650eb1b896f76068a6867b03142f6cd25459b463d92aa4bd4b2efc10ef41d ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
				"previous_output" : 
				{
					"hash" : "d1f0897657568fe6b9d796b46f7e60fb395b844c2051a4e83d7d449352c606e6",
					"index" : 0
				},
				"script" : "[ 3044022012937194a2717ec2663b57494bb5be7db02db1d19334a22ff566873f5fdd30db0220243153bbe7f067f61485f7fd49bbf49115e8cb5101997f20bc71b80cd220cb7901 ] [ 029b5650eb1b896f76068a6867b03142f6cd25459b463d92aa4bd4b2efc10ef41d ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
				"previous_output" : 
				{
					"hash" : "28dd30ea4f8f15d9bb1d3de9b3a87696e75451890dbb310ef40a155d4b0c7137",
					"index" : 0
				},
				"script" : "[ 3045022100f63c854d6d26d2425fcbe275d6c71e88d2c825b87e1bc072ae9224ecd393e59c02204a7c7cba03003e5ee2976fed853052955152e6f735f4cf8b5c3f17ddac500f1701 ] [ 029b5650eb1b896f76068a6867b03142f6cd25459b463d92aa4bd4b2efc10ef41d ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
				"previous_output" : 
				{
					"hash" : "4c4e7cf3b2bfe9e144034185fb196021624c7de7f3d0543f50f40ac92898f95d",
					"index" : 0
				},
				"script" : "[ 304402201a1c2a76ae1060be8c9c7a058170e024dec0fc7e3a0d8e9a81a3c5568e73a6a1022007398ee84cc4074a4ffa4575436ac16f399f12da845b5656105b2654da8612ca01 ] [ 029b5650eb1b896f76068a6867b03142f6cd25459b463d92aa4bd4b2efc10ef41d ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
				"attachment" : 
				{
					"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
					"decimal_number" : 8,
					"description" : "Asset of BOB.",
					"from_did" : "Bob",
					"is_secondaryissue" : false,
					"issuer" : "Bob",
					"quantity" : 1000000000000,
					"secondaryissue_threshold" : 127,
					"symbol" : "MVS.BOB",
					"to_did" : "Bob",
					"type" : "asset-issue"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 39990f81b91b7a35092517dfd5c8942c9e5f48f8 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
				"attachment" : 
				{
					"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
					"cert" : "issue",
					"from_did" : "Bob",
					"owner" : "Bob",
					"symbol" : "MVS.BOB",
					"to_did" : "Bob",
					"type" : "asset-cert"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 39990f81b91b7a35092517dfd5c8942c9e5f48f8 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
				"attachment" : 
				{
					"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
					"cert" : "naming",
					"from_did" : "Bob",
					"owner" : "Bob",
					"symbol" : "MVS.BOB",
					"to_did" : "Bob",
					"type" : "asset-cert"
				},
				"index" : 2,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 39990f81b91b7a35092517dfd5c8942c9e5f48f8 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 3,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 39990f81b91b7a35092517dfd5c8942c9e5f48f8 ] equalverify checksig",
				"value" : 200000000
			}
		],
		"version" : "4"
	}
}
```

### 转移证书
通过命令 `transfercert` 可以将证书转移给其它数字身份。

该命令所需五个参数依次为：帐户名，密码，接收数字身份，资产符号，证书类型。目前仅仅支持 `domain`、`issue`、`naming` 类型的证书。该命令支持多重签名，即支持从多重签名地址转出或转入证书。

在前面的示例中，`Bob` 获得了名为 `MVS.BOB` 的增发权证书，接下来 `Bob` 将该证书转移给数字身份 `Alice`。
```bash
命令：
$ ./mvs-cli transfercert Bob passwd1 Alice MVS.BOB issue

输出：
{
	"transaction" : 
	{
		"hash" : "3ccf7413e2670ea998ff6571589f166ec97c94669fe5d8aedcb47a6c0b2c8250",
		"inputs" : 
		[
			{
				"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
				"previous_output" : 
				{
					"hash" : "58d1a9f7610dbf3cb3a247d83f328ee98cd7cd0cccefb04e2d8ac59a16b59601",
					"index" : 0
				},
				"script" : "[ 304402206a3757e7be64817059b93f0034ef2f12749e7e3d88510233c720bf166fd8a81e022021fc73e2966ff7c49e3c8a62f35040ea62e35d1f9b9860c1a01e69b57fdf9ea501 ] [ 029b5650eb1b896f76068a6867b03142f6cd25459b463d92aa4bd4b2efc10ef41d ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
				"previous_output" : 
				{
					"hash" : "a0cb6febeaae13074820e213838fd11d781c037c92a54409dd9da1713d1b0310",
					"index" : 1
				},
				"script" : "[ 3044022058b0fd5a7a6512f224b50a1951935b801afcb2438f8e6d519ed62d328e1c1f8d022024fc62e86dc945f681eeb73963923fe6c51f4211be7350257150cb82d8299b4c01 ] [ 029b5650eb1b896f76068a6867b03142f6cd25459b463d92aa4bd4b2efc10ef41d ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
				"attachment" : 
				{
					"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
					"cert" : "issue",
					"from_did" : "Bob",
					"owner" : "Alice",
					"symbol" : "MVS.BOB",
					"to_did" : "Alice",
					"type" : "asset-cert"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 82ecff3d87cc01a8a539dfd8d5e0cac0639c0088 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 39990f81b91b7a35092517dfd5c8942c9e5f48f8 ] equalverify checksig",
				"value" : 299990000
			}
		],
		"version" : "4"
	}
}
```

## 查看证书
查看资产命令的 `listassets`, `getasset`, `getaccountasset` 以及 `getaddressasset` 有一个 `--cert` 选项用于查看资产证书信息。

资产证书信息由四个字段组成：
> address: 证书所在地址。  
> cert: 证书类型，目前支持 "domain", "issue", "naming" 类型的证书。  
> owner: 拥有证书的数字身份。  
> symbol: 资产名字。  

### `getasset`
查询全网资产证书名字或指定帐户下的资产证书信息。
```
$ ./mvs-cli getasset
{
	"assets" : 
	[
		"MVS",
		"MVS.ALICE",
		"MVS.BOB",
	]
}

$ ./mvs-cli getasset --cert MVS.BOB
{
	"assetcerts" : 
	[
		{
			"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
			"cert" : "naming",
			"owner" : "Bob",
			"symbol" : "MVS.BOB"
		}
	]
}

```

### `listassets`
查询全网资产证书信息或指定帐户下的资产证书信息。
```
$ ./mvs-cli listassets --cert
{
	"assetcerts" : 
	[
		{
			"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
			"cert" : "domain",
			"owner" : "Alice",
			"symbol" : "MVS"
		},
		{
			"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
			"cert" : "issue",
			"owner" : "Alice",
			"symbol" : "MVS.BOB"
		},
		{
			"address" : "MKqRzDAtZJqcqvEqzYq3qeZLPoj3DHJAx4",
			"cert" : "issue",
			"owner" : "Alice",
			"symbol" : "MVS.Alice"
		}
		{
			"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
			"cert" : "naming",
			"owner" : "Bob",
			"symbol" : "MVS.BOB"
		},
	]
}

./mvs-cli listassets --cert Bob passwd1
{
	"assetcerts" : 
	[
		{
			"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
			"cert" : "naming",
			"owner" : "Bob",
			"symbol" : "MVS.BOB"
		}

	]
}
```

### `getaccountasset`
查询指定账户下的资产证书信息，可以指定证书名字。
```
$ ./mvs-cli getaccountasset Bob passwd1 --cert
{
	"assetcerts" : 
	[
		{
			"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
			"cert" : "naming",
			"owner" : "Bob",
			"symbol" : "MVS.BOB"
		}
	]
}

$ ./mvs-cli getaccountasset Bob passwd1 MVS.BOB --cert
{
	"assetcerts" : 
	[
		{
			"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
			"cert" : "naming",
			"owner" : "Bob",
			"symbol" : "MVS.BOB"
		}
	]
}
```

### `getaddressasset`
查询指定地址下的资产证书信息。
```
$ ./mvs-cli getaddressasset MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f --cert
{
	"assetcerts" : 
	[
		{
			"address" : "MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f",
			"cert" : "naming",
			"owner" : "Bob",
			"symbol" : "MVS.BOB"
		}
	]
}
```
