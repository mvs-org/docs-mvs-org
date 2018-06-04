title: MIT 查询
---

## 前提简述
这里主要介绍数字资产 MIT 的查询操作，其它的命令可以参考 [Command-line](/zh-cn/docs/command-line.html)

在下面的范例中，将统一使用帐户名为 `Alice`，密码为 `passwd1`，数字身份（DID）为 `Alice`，地址为`测试地址`，作为演示示例。您在参考时请修改为自己的帐户名、密码、数字身份以及正确的地址。账户与数字身份可以通过 `"mvs-cli getnewaccount 帐户名 密码"` 和 `"mvs-cli registerdid 帐户名 密码 测试地址 测试DID"` 生成。

有了帐户和数字身份，如果要发布或发送资产等，需要确保相关地址下有足够的 ETP 来缴纳手续费。可以通过 `"mvs-cli getbalance account_name password"` 查询帐户总余额详情，也可以通过 `"mvs-cli listbalances account_name password"` 查询帐户里各个地址下的余额。

所有命令都可以通过 `help` 查询帮助，例如使用 `"mvs-cli help listmits"` 或者 `"mvs-cli listmits -h"` 查询命令 `listmits` 的帮助。

## 查询 MIT：listmits
命令：`listmits`，查询全网已注册的 `MIT` 或某个账户下未花费的 `MIT`。
```bash
Usage:
mvs-cli listmits [-h] [ACCOUNTNAME] [ACCOUNTAUTH]   

选项:
-h [--help]          获取帮助。

位置参数:
ACCOUNTNAME          帐户名
ACCOUNTAUTH          帐户密码
```
**注：若提供了账户名和密码参数，则查询该账户下未花费的 MIT。**

1. 示例：查询全网已注册的 `MIT`：
```bash
命令：
$ ./mvs-cli listmits

输出：
{
	"mits" : 
	[
		{
			"address" : "MUipcgtbBZVCn1n45SaCfK62YBrvkjWe7J",
			"content" : "Alice's MIT",
			"status" : "registered",
			"symbol" : "Alice@MIT"
		},
	}
}
```

2. 示例：查询账户 `Bob` 下未花费的 `MIT`：
```bash
命令：
$ ./mvs-cli listmits Bob passwd1

输出：
{
	"mits" : 
	[
		{
			"address" : "M9cFfg7xrv1kBvxBp93QVWhNxBYxE8g7Tk",
			"content" : "Alice's MIT",
			"status" : "transfered",
			"symbol" : "Alice@MIT"
		}
	]
}
```


## 查询 MIT：getmit
命令：`getmit`，查询全网已注册的 `MIT` 标识或特定标识 `MIT` 的注册信息或特定标识 `MIT` 的历史记录。
```bash
Usage:
mvs-cli getmit [-ht] [--index value] [--limit value] [SYMBOL]   

选项:
-h [--help]          获取帮助。
-t [--trace]         追踪 MIT 历史。
-i [--index]         分页显示 MIT 历史记录时，当前显示页的索引，从 1 开始计数。
-l [--limit]         分页显示 MIT 历史记录时，每一页显示记录的最大条数。

位置参数:
SYMBOL               MIT 资产标识。
```

1. 示例：查询全网已注册的 `MIT` 标识：
```bash
命令：
$ ./mvs-cli getmit

输出：
{
	"mits" : 
	[
		"Alice@MIT"
	]
}
```

2. 示例：查询名为 `Alice@MIT` 的 `MIT` 的注册信息：
```bash
命令：
$ ./mvs-cli getmit Alice@MIT

输出：
{
	"address" : "MUipcgtbBZVCn1n45SaCfK62YBrvkjWe7J",
	"content" : "Alice's MIT",
	"status" : "registered",
	"symbol" : "Alice@MIT"
}
```

3. 示例：查询名为 `Alice@MIT` 的 `MIT` 的历史记录：
```bash
命令：
$ ./mvs-cli getmit Alice@MIT -t

输出：
{
	"mits" : 
	[
		{
			"address" : "M9cFfg7xrv1kBvxBp93QVWhNxBYxE8g7Tk",
			"from_did" : "Alice",
			"height" : 9133,
			"status" : "transfered",
			"symbol" : "Alice@MIT",
			"time_stamp" : 1528094263,
			"to_did" : "Bob"
		},
		{
			"address" : "MUipcgtbBZVCn1n45SaCfK62YBrvkjWe7J",
			"from_did" : "Alice",
			"height" : 8514,
			"status" : "registered",
			"symbol" : "Alice@MIT",
			"time_stamp" : 1528093720,
			"to_did" : "Alice"
		}
	]
}
```
