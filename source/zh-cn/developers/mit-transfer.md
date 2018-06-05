title: MIT 转移
comments: false
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
TODID                接收者的数字身份，必须提供，支持多重签名的数字身份。
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
		"hash" : "4fe272acccf0dae96ca71fc34350bbc425588725ef9224b23447cca57b86be60",
		"inputs" : 
		[
			{
				"address" : "MH257NnjBJZNAy258c4bjVVkFB8phMFqtY",
				"previous_output" : 
				{
					"hash" : "6e34003a72537c7f0f8802c962ecb6c6660a581bfd34ba9e4e1132492b5cdd80",
					"index" : 0
				},
				"script" : "[ 304402203b281aed68b352d07fec303ac8baef47c4020edbeaa5a35ba146ba33d2e9c54c02202fb08aa2c1f3c0dda914a3c4f1630bbd795686690bec955475fef39283c78d2f01 ] [ 030848a4429c900e09159b39993e3edf6df1a4302d28d3a2af78a343042d7a8b5e ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
				"previous_output" : 
				{
					"hash" : "9d52158296a9e33b49dcd0f9ceee26c8f2356f1486dc0d9a56ea49a1dd0d97e3",
					"index" : 0
				},
				"script" : "[ 304402200b8c33403b6cd72e086ebea2335812351fcb268421dffb9322f6e133518c393602202376aa29f4803150ed60a86984a0956e299f15a53f698bfcedd484ba2f722c1a01 ] [ 039497a1b7e0dbc762fbd389d8b1ac3215782758c753c521fc4e40914f8e14d5e8 ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "MFj3WGtCxWT2BJZSJUJ9N9A3hKqCoaehaX",
				"attachment" : 
				{
					"address" : "MFj3WGtCxWT2BJZSJUJ9N9A3hKqCoaehaX",
					"from_did" : "",
					"status" : "transfered",
					"symbol" : "Alice@MIT",
					"to_did" : "Bob",
					"type" : "mit"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 55d73b3c20a6dd7391426624d4a7a697ed5c27cc ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MH257NnjBJZNAy258c4bjVVkFB8phMFqtY",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 6407c4bae99d9784c60ab5c991fb3e7fe20ad647 ] equalverify checksig",
				"value" : 299990000
			}
		],
		"version" : "4"
	}
}
```
