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
> **issue**: 增发权证书，只有拥有该证书的账户才可以二次增发与证书名字同名的资产。该证书在发行可以二次增发的资产时自动颁发给发行者。相关命令：`createasset`，`secondaryissue` 和 `issue`。  
> **domain**: 域名权证书，拥有该证书的账户，可以发行资产名字以该证书名字为域名的资产。比如，拥有名为 `MVS` 的域名证书的账户可以发行名为 `MVS.XYZ` 的资产。该证书在首次发行以证书名字为域名的资产时自动颁发给发行者，遵循先发先得的公平原则。比如：全网没有以名为 `MVS` 的域名证书，账户 `Alice` 在发行名为 `MVS.ALICE` 的资产时，`Alice`就自动获得了名为 `MVS` 的域名证书，此后`Alice`可以发行名字以 `MVS.` 开头的其他资产，而账户 `Bob` 则不可以发行名字以 `MVS.` 开头的资产，除非 `Alice` 颁发名字以 `MVS.` 开头的冠名权证书给 `Bob`。相关命令：`createasset` 和 `issue`。  
> **naming**: 冠名权证书，拥有该证书的账户，可以发行资产名字与证书名字同名的资产。拥有域名权证书的账户可以颁发以域名权证书名字为域名的冠名权证书。比如：拥有名为 `MVS` 的域名证书的账户 `Alice` 可以颁发名为 `MVS.BOB` 的冠名权证书给账户 `Bob` 的某个数字身份，这样 `Bob` 就能够发行名为 `MVS.BOB` 的资产。相关命令：`issuecert` 和 `transfercert`。    

**注：发行名字以句点`.`开头的资产不会获得任何域名证书，因为该资产名字不具有有效的域名。**

## 获得资产证书
域名权和增发权两种类型的证书在发行资产时自动颁发给发行者，冠名权证书通过命令 `issuecert` 颁发。关于资产发行详情请参考[MST 资产发行](/zh-cn/developers/da-issue.html)。

### 获得域名权或增发权证书

1. 通过命令 `createasset` 创建可以二次增发的资产
`createasset` 命令的 `--rate` 选项的值如果为 -1（自由增发）或在范围[1, 100]之间，则创建可以二次增发的资产
```bash
命令：
$ ./mvs-cli createasset Alice passwd1 --symbol MVS.ALICE --volume 1000000000000 --description "Asset of Alice." --issuer Alice --decimalnumber 8 --rate -1

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
		"hash" : "c88bd3914577df14063f8df7b9365d0061ee902a9ab90bf80df541ec41536321",
		"inputs" : 
		[
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"previous_output" : 
				{
					"hash" : "6ff77f00f50b18f108e6f185c99bf226a0803a0a6e58844d4043c86003de8ef3",
					"index" : 1
				},
				"script" : "[ 3044022021d7739ba53653920b02bced24f1d9e0aed5d702188f6a28c2c7371883fc9b0b02204fe7bc03309331b0355cf79600691a63b5ee8f1c64cd8db01321db041614851b01 ] [ 038d7048a4e640a0e0a27ef85d2a7e5b339834cd565ada0d6ea042127732fa105e ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"previous_output" : 
				{
					"hash" : "19dad273d07090648279817e8dcbce8dc06c9815ee94fa798d8e779cf66a9076",
					"index" : 0
				},
				"script" : "[ 304402205e6cb2bd7e9746bc9181ec66043a3244d9f502f03174a384d53853da44f2d2eb022056e19b54d01ae8ad164ca6e856ab7ed12c8c42081c0451cc66c990c08a783be101 ] [ 038d7048a4e640a0e0a27ef85d2a7e5b339834cd565ada0d6ea042127732fa105e ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"previous_output" : 
				{
					"hash" : "c42114b2626d9a6e82888deade68c82500e1e55494318c2c3eed7f0a065895e9",
					"index" : 0
				},
				"script" : "[ 304502210091b393ed73b59d89a37a7d8c2d0145f5f010a3ca29897b9ed0283782cebba7690220489e6564f17f62a9ec5b1f642be030395318f405ffeb4023c08282360070301b01 ] [ 038d7048a4e640a0e0a27ef85d2a7e5b339834cd565ada0d6ea042127732fa105e ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"previous_output" : 
				{
					"hash" : "cb62c51992f141490ba8934e422a47f5e8d11cf92cbfedbd99bf4247865d6579",
					"index" : 0
				},
				"script" : "[ 304402200a152c449de59abbd53bd54cd8164b2b2ede152e8350358b4aa1014f733b75a902200bc64b0edfd4c5cd3667d9b416f4361ea6cf24649aebe06e6d3e93b2fa0b2ce301 ] [ 038d7048a4e640a0e0a27ef85d2a7e5b339834cd565ada0d6ea042127732fa105e ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"attachment" : 
				{
					"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
					"decimal_number" : 8,
					"description" : "Asset of Alice.",
					"from_did" : "",
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
				"script" : "dup hash160 [ 95c9a5e647870bbc535d83a3c394ef40d298aa46 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"attachment" : 
				{
					"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
					"cert" : "issue",
					"from_did" : "",
					"owner" : "Alice",
					"symbol" : "MVS.ALICE",
					"to_did" : "Alice",
					"type" : "asset-cert"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 95c9a5e647870bbc535d83a3c394ef40d298aa46 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"attachment" : 
				{
					"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
					"cert" : "domain",
					"from_did" : "",
					"owner" : "Alice",
					"symbol" : "MVS",
					"to_did" : "Alice",
					"type" : "asset-cert"
				},
				"index" : 2,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 95c9a5e647870bbc535d83a3c394ef40d298aa46 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 3,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 95c9a5e647870bbc535d83a3c394ef40d298aa46 ] equalverify checksig",
				"value" : 100000000
			}
		],
		"version" : "4"
	}
}
```

### 获得域名权证书
拥有域名权证书的账户可以通过命令 `issuecert` 给指定数字身份颁发名字以域名权证书名字为域名的冠名权证书，指定的数字身份必须为该账户所拥有。

`issuecert` 命令所需五个参数依次为：帐户名，密码，接收数字身份，资产符号，证书类型。目前仅支持 `naming` 类型的证书。

下面的示例中，`Alice` 拥有名为 `MVS` 的域名权证书，`Alice` 向数字身份 `Alice` 颁发名为 `MVS.BOB` 的冠名权证书。

```bash
命令：
$ ./mvs-cli issuecert Alice passwd1 Alice MVS.BOB naming

输出：
{
	"transaction" : 
	{
		"hash" : "578c23781ab4251c02f2987f5ad0cbeb8ed526546877364efe853e5a345549d9",
		"inputs" : 
		[
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"previous_output" : 
				{
					"hash" : "c88bd3914577df14063f8df7b9365d0061ee902a9ab90bf80df541ec41536321",
					"index" : 3
				},
				"script" : "[ 3045022100fef8cf721e972b256241aa983c5ce123be4ce0d50bfaf5c8696e5c17486e133f02203147741b4868e34e4f8a3b32e8b7ef1605582950e80c0cd04eee584989507cff01 ] [ 038d7048a4e640a0e0a27ef85d2a7e5b339834cd565ada0d6ea042127732fa105e ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"previous_output" : 
				{
					"hash" : "c88bd3914577df14063f8df7b9365d0061ee902a9ab90bf80df541ec41536321",
					"index" : 2
				},
				"script" : "[ 3045022100959f7b4e694610c1078b310dbf5ea1cf710175e1349b469239fb79e81ca974f502202bf495d589a5b9ef0341689a8c88bb739762b538cf472422216e0dfc33f51f8101 ] [ 038d7048a4e640a0e0a27ef85d2a7e5b339834cd565ada0d6ea042127732fa105e ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"attachment" : 
				{
					"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
					"cert" : "naming",
					"from_did" : "",
					"owner" : "Alice",
					"symbol" : "MVS.BOB",
					"to_did" : "Alice",
					"type" : "asset-cert"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 95c9a5e647870bbc535d83a3c394ef40d298aa46 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"attachment" : 
				{
					"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
					"cert" : "domain",
					"from_did" : "",
					"owner" : "Alice",
					"symbol" : "MVS",
					"to_did" : "Alice",
					"type" : "asset-cert"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 95c9a5e647870bbc535d83a3c394ef40d298aa46 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 2,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 95c9a5e647870bbc535d83a3c394ef40d298aa46 ] equalverify checksig",
				"value" : 99990000
			}
		],
		"version" : "4"
	}
}
```


### 转移证书
通过命令 `transfercert` 可以将证书转移给其它数字身份，该数字身份可以是其它账户所用的数字身份。

该命令所需五个参数依次为：帐户名，密码，接收数字身份，资产符号，证书类型。目前仅仅支持 `domain`、`issue`、`naming` 类型的证书。该命令支持多重签名，即支持从多重签名地址转出或转入证书。

在前面的示例中，`Alice` 发行了名为 `MVS.BOB` 的冠名权证书，接下来 `Alice` 将该证书转移给数字身份 `Bob`。
```bash
命令：
$ ./mvs-cli transfercert Alice passwd1 Bob MVS.BOB naming

输出：
{
	"transaction" : 
	{
		"hash" : "0a985f55345cd5ca81df08c263033c34b8895bf18db6435e8b2509ebbe9f4b0f",
		"inputs" : 
		[
			{
				"address" : "MNz5WH5CH1T44hTpanbG1v1NBjcZXf4je4",
				"previous_output" : 
				{
					"hash" : "98f70aba9c690700dd66ec0c8fce2c56c22043d1c20ff76f164170cc10050c70",
					"index" : 0
				},
				"script" : "[ 3045022100a0527a44333aa92ed469b34431eff09d31a7eaaf20a7b86b09cd395d69f74c0e02203b28dc32d9db29ee1d398021a0652be0a2b4486b8137471efb29b77a215aa11701 ] [ 02eee915ccdb35cc35583a3ad58be24fe914d754d00cd75641f56cc90fc305e307 ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"previous_output" : 
				{
					"hash" : "578c23781ab4251c02f2987f5ad0cbeb8ed526546877364efe853e5a345549d9",
					"index" : 0
				},
				"script" : "[ 3045022100bada970681995f64fdd8716075f3b4ee7116d63376a5811ed1d897c99283eea3022027cd6761027155b7f892ad4d4944019fdb75ee3b15761e7e9f58738ed0010c0e01 ] [ 038d7048a4e640a0e0a27ef85d2a7e5b339834cd565ada0d6ea042127732fa105e ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"attachment" : 
				{
					"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
					"cert" : "naming",
					"from_did" : "",
					"owner" : "Bob",
					"symbol" : "MVS.BOB",
					"to_did" : "Bob",
					"type" : "asset-cert"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ ee51cd6e869195dca48ede01f40a18c275322fbd ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MNz5WH5CH1T44hTpanbG1v1NBjcZXf4je4",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ a57805573daf3760779ff5dfc820ba5728e462d2 ] equalverify checksig",
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
在前面的示例中，账户 `Alice` 向数字身份 `Alice` 颁发了名为 `MVS.BOB` 的冠名权证书，然后账户 `Alice` 通过 `transfercert` 命令将该证书转移给数字身份 `Bob`。接下来 `Bob` 就可以使用该冠名权证书创建并发行同名的资产。由于该资产具有增发属性，所以在该资产发行后，`Bob` 获得了名为 `MVS.BOB` 的增发权证书。

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
		"hash" : "3e6084732f35dac309f2243ef890e9455ccf930f1f54be386666e52356961234",
		"inputs" : 
		[
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"previous_output" : 
				{
					"hash" : "0a985f55345cd5ca81df08c263033c34b8895bf18db6435e8b2509ebbe9f4b0f",
					"index" : 0
				},
				"script" : "[ 3045022100b79b10adf94b3cf7dfe33d45e6b65598c3008b348d87363cee429d24f9a0bd74022077ab16d574b0d3c118058316b950c27f1660c7ef2ece3e4bdbdd6b6bf2b7004701 ] [ 0218feb8b4eb5d83d5ca93116a09c1b16f9587db78af950a06c15c1c82e81866df ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"previous_output" : 
				{
					"hash" : "a0b321d1ce636644fa51f78f3a4a2ea66aa52b623a4759ae5b61b9f57ea4b647",
					"index" : 1
				},
				"script" : "[ 3045022100ec6ff9fb6cdd7fb11883d05c43bbbb767111b4efbad2b96b5bfb456e470df54f0220531100981698ff204b76ffc53399de1bf33fbaf4dbd0ca666f57ceaf75bcfbf001 ] [ 0218feb8b4eb5d83d5ca93116a09c1b16f9587db78af950a06c15c1c82e81866df ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"previous_output" : 
				{
					"hash" : "5be8df2c2e3d2a7ecd6f1963cba046a78a4c959b6eb4d94a8396602d23c2a44a",
					"index" : 0
				},
				"script" : "[ 3045022100e2d0c79673293c971b146fb3974ee5d36aa1c1fd8a24a785fe1577d634676df602203f048e25dd9c2920a29ecf2ea60774a8a1f6429b6c0ba1bc712d54757b9e994801 ] [ 0218feb8b4eb5d83d5ca93116a09c1b16f9587db78af950a06c15c1c82e81866df ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"previous_output" : 
				{
					"hash" : "91290adcfae5b490e0077ea6f2ba4484b4195f187a823023cc0bf829cae66147",
					"index" : 0
				},
				"script" : "[ 30440220790e9ac92450ae4bd18420d5d3bb94cdd85f50c30ec54dace549169deb500a7b0220384038a8fe308a1330af337d3f3e3404e62d147b1b00f30a4c4a304a205f2e7901 ] [ 0218feb8b4eb5d83d5ca93116a09c1b16f9587db78af950a06c15c1c82e81866df ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"previous_output" : 
				{
					"hash" : "e4df769a43a7fb28aa29c2c9809014c04335afd690ab48f5359bcf4f70f94e9a",
					"index" : 0
				},
				"script" : "[ 3045022100f1eb735631261c4e7b1e7591f09d999dbcda13efec29f8e350c5ceb3772f7769022077168d79740e4ee1f0af9b5f733855cd70091b9564562d57e571ddcace1f139101 ] [ 0218feb8b4eb5d83d5ca93116a09c1b16f9587db78af950a06c15c1c82e81866df ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"attachment" : 
				{
					"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
					"decimal_number" : 8,
					"description" : "Asset of BOB.",
					"from_did" : "",
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
				"script" : "dup hash160 [ ee51cd6e869195dca48ede01f40a18c275322fbd ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"attachment" : 
				{
					"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
					"cert" : "issue",
					"from_did" : "",
					"owner" : "Bob",
					"symbol" : "MVS.BOB",
					"to_did" : "Bob",
					"type" : "asset-cert"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ ee51cd6e869195dca48ede01f40a18c275322fbd ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"attachment" : 
				{
					"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
					"cert" : "naming",
					"from_did" : "",
					"owner" : "Bob",
					"symbol" : "MVS.BOB",
					"to_did" : "Bob",
					"type" : "asset-cert"
				},
				"index" : 2,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ ee51cd6e869195dca48ede01f40a18c275322fbd ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 3,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ ee51cd6e869195dca48ede01f40a18c275322fbd ] equalverify checksig",
				"value" : 100000000
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
			"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
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
			"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
			"cert" : "domain",
			"owner" : "Alice",
			"symbol" : "MVS"
		},
		{
			"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
			"cert" : "issue",
			"owner" : "Alice",
			"symbol" : "MVS.Alice"
		},
		{
			"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
			"cert" : "issue",
			"owner" : "Bob",
			"symbol" : "MVS.BOB"
		},
		{
			"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
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
			"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
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
			"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
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
			"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
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
			"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
			"cert" : "naming",
			"owner" : "Bob",
			"symbol" : "MVS.BOB"
		}
	]
}
```
