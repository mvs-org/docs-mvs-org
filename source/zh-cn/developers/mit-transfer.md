title: MIT 转移
---

## 前提简述
这里主要介绍数字资产 MIT 的转移操作，其它的命令可以参考 [Command-line](/zh-cn/docs/command-line.html)

在下面的范例中，将统一使用帐户名为 `Alice`，密码为 `passwd1`，数字身份（DID）为 `Alice`，地址为`测试地址`，作为演示示例。您在参考时请修改为自己的帐户名、密码、数字身份以及正确的地址。账户与数字身份可以通过 `"mvs-cli getnewaccount 帐户名 密码"` 和 `"mvs-cli registerdid 帐户名 密码 测试地址 测试DID"` 生成。

有了帐户和数字身份，如果要发布或发送资产等，需要确保相关地址下有足够的 ETP 来缴纳手续费。可以通过 `"mvs-cli getbalance account_name password"` 查询帐户总余额详情，也可以通过 `"mvs-cli listbalances account_name password"` 查询帐户里各个地址下的余额。

所有命令都可以通过 `help` 查询帮助，例如使用 `"mvs-cli help transfermit"` 或者 `"mvs-cli transfermit -h"` 查询命令 `transfermit` 的帮助。

## 转移 MIT
命令：`transfermit`

```bash
Usage:
mvs-cli transfermit [-h] [--fee value] ACCOUNTNAME ACCOUNTAUTH    
TODID SYMBOL     

选项:
-h [--help]          获取帮助。
-f [--fee]           手续费，默认 0.0001 etp。

位置参数:
ACCOUNTNAME          帐户名，必须提供。
ACCOUNTAUTH          帐户密码，必须提供。
TODID                接收者的数字身份，必须提供。
SYMBOL               MIT 资产标识，必须提供。
```

示例：Alice 将名为 `Alice@MIT` 的 `MIT` 转移给数字身份 `Bob`
```bash
命令：
$ ./mvs-cli transfermit Alice passwd1 Bob Alice@MIT

输出：
{
	"transaction" : 
	{
		"hash" : "97f18446040831a1e51ac38d93064cdc1001aca16d4eb852c61c1f5ed602f78c",
		"inputs" : 
		[
			{
				"address" : "MANkcAf1RAwEMCNvD3byoh596JraAi3eZC",
				"previous_output" : 
				{
					"hash" : "c09ea5ef791534014fad5256e33681ade13df5892a8e5d3844b927bbb3c62b3f",
					"index" : 0
				},
				"script" : "[ 30450221008a9fca6fc0e7d42cd0df00ab87a1cedc19b22add25ea106698ab3d839cb31db802201892c5bf55d2cbbe663f893c92a862c5c065b3f532ea47e5380427627b3ebaf001 ] [ 03b714ee6fa096be717f68775e507fc87579aaca5eaf7e0393671563a5ff8ea0b2 ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MUipcgtbBZVCn1n45SaCfK62YBrvkjWe7J",
				"previous_output" : 
				{
					"hash" : "d48a0a03cce8b41dd9a3d38ca930cab20ce849f9c952ae996c3e82d5d8b18c8f",
					"index" : 0
				},
				"script" : "[ 30440220282bb15403338b736ff8e871528caf88528d7f9b77f72cb953489b94436e86b902204e2be80df47678187badef8577e699a615f865891ff5a00635a70141ccdb3b3701 ] [ 025ba481942947bd28613ac58a4ce7fae897e14ef113aca8b4dd76cd0fa2de0558 ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "M9cFfg7xrv1kBvxBp93QVWhNxBYxE8g7Tk",
				"attachment" : 
				{
					"address" : "M9cFfg7xrv1kBvxBp93QVWhNxBYxE8g7Tk",
					"from_did" : "Alice",
					"status" : "transfered",
					"symbol" : "Alice@MIT",
					"to_did" : "Bob",
					"type" : "mit"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 12bdb7a3ddf892797e8787e300ddf0413977726c ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MANkcAf1RAwEMCNvD3byoh596JraAi3eZC",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 1b282d5a09f00a957cdcb090491b00a4fc0ebb59 ] equalverify checksig",
				"value" : 299990000
			}
		],
		"version" : "4"
	}
}
```
