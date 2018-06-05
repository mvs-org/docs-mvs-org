title: MIT 登记
---

## 前提简述
这里主要介绍数字资产 MIT 的登记操作，其它的命令可以参考 [Command-line](/zh-cn/docs/command-line.html)

在下面的范例中，将统一使用帐户名为 `Alice`，密码为 `passwd1`，数字身份（DID）为 `Alice`，地址为`测试地址`，作为演示示例。您在参考时请修改为自己的帐户名、密码、数字身份以及正确的地址。账户与数字身份可以通过 `"mvs-cli getnewaccount 帐户名 密码"` 和 `"mvs-cli registerdid 帐户名 密码 测试地址 测试DID"` 生成。

有了帐户和数字身份，如果要发布或发送资产等，需要确保相关地址下有足够的 ETP 来缴纳手续费。可以通过 `"mvs-cli getbalance account_name password"` 查询帐户总余额详情，也可以通过 `"mvs-cli listbalances account_name password"` 查询帐户里各个地址下的余额。

所有命令都可以通过 `help` 查询帮助，例如使用 `"mvs-cli help registermit"` 或者 `"mvs-cli registermit -h"` 查询命令 `registermit` 的帮助。

## 登记 MIT
命令：`registermit`

```bash
Usage:
mvs-cli registermit [-h] [--content value] [--fee value]          
ACCOUNTNAME ACCOUNTAUTH TODID SYMBOL     

选项:
-h [--help]          获取帮助。
-c [--content]       MIT 资产内容，默认为空。
-f [--fee]           手续费，默认 0.0001 etp。

位置参数:
ACCOUNTNAME          帐户名，必须提供。
ACCOUNTAUTH          帐户密码，必须提供。
TODID                接收者的数字身份，必须提供。
SYMBOL               MIT 资产标识，必须提供。
```
**注：SYMBOL 的最大长度为 60，不区分大小写，且只能包含数字、字母以及字符：`.`、`-`、`_`、`@`；content 的最大长度为 256。MIT 资产标识全网唯一。**

示例：账户 `Alice` 将名为 `Alice@MIT` 的 `MIT` 登记到数字身份 `Alice` 下。
```bash
命令：
$ ./mvs-cli registermit Alice passwd1 Alice Alice@MIT -c "Alice's MIT"

输出：
{
	"transaction" : 
	{
		"hash" : "9d52158296a9e33b49dcd0f9ceee26c8f2356f1486dc0d9a56ea49a1dd0d97e3",
		"inputs" : 
		[
			{
				"address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
				"previous_output" : 
				{
					"hash" : "bce39df08273418f93d594185f23273225ae5aadfe6bd54ea4f7bbae50a61ea2",
					"index" : 1
				},
				"script" : "[ 304402201f0d5f9c5c4d3de0db3ea80f3ae356558f76dfddc124c10eceb6523d2255b075022001f788e0a008b002c6bc9a31e2c945f9bbed4e6ba7def1f5c867e29f01d362c001 ] [ 039497a1b7e0dbc762fbd389d8b1ac3215782758c753c521fc4e40914f8e14d5e8 ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
				"attachment" : 
				{
					"address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
					"content" : "Alice's MIT",
					"from_did" : "Alice",
					"status" : "registered",
					"symbol" : "Alice@MIT",
					"to_did" : "Alice",
					"type" : "mit"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 75f7e6e4b14d0aaa72a96bd5751070e7b7f813fb ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 75f7e6e4b14d0aaa72a96bd5751070e7b7f813fb ] equalverify checksig",
				"value" : 199990000
			}
		],
		"version" : "4"
	}
}
```
