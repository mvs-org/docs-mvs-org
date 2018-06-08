title: MST Secondary Issuance
---

## 前提简述
这里主要介绍资产增发命令行操作，其它的命令可以参考 [Command-line](/zh-cn/docs/command-line.html)

首先，你要有帐户和数字身份(did)，可以通过 `"mvs-cli getnewaccount 帐户名 密码"` 和 `"mvs-cli issuedid 帐户名 密码 测试地址 测试did"` 生成，**生成后切记妥善保存主私钥（mnemonic-key）**。

为了方便，下文中我统一使用帐户名为 `test1`，密码为 `passwd1`，测试did为`testdid`，地址为`测试地址`，您在参考时请修改为自己的帐户名和密码，同时注意使用正确的地址。

有了帐户，如果要发行或发送资产等，你还得确保该帐号下有 ETP 交手续费。可以通过 `"mvs-cli getbalance test1 passwd1"` 查询帐户总余额详情，也可以通过 `"mvs-cli listbalances test1 passwd1"` 查询帐户里各个地址下的余额。

所有命令都可以通过 `help` 查询帮助，例如使用 `"mvs-cli help secondaryissue"` 或者 `"mvs-cli secondaryissue -h"` 查询命令 `secondaryissue` 的帮助。

### 资产增发
持有资产增发证书的账户可以增发设置有可增发属性的资产。
```
Usage: mvs-cli secondaryissue [-h] [--fee value]
ACCOUNTNAME ACCOUNTAUTH TODID SYMBOL VOLUME

Info: secondaryissue, alias as additionalissue.

选项参数：

-h [--help]          Get a description and instructions for this command.
-f [--fee]           The fee of tx. default_value 10000 ETP bits
-m [--model]         The asset attenuation model parameter, defaults to
                     empty string.
位置参数：

ACCOUNTNAME          Account name.
ACCOUNTAUTH          Account password/authorization.
TODID                Target did to check and issue asset
SYMBOL               The symbol of issued asset
VOLUME               The volume of asset
```

**注意**  
1. 资产可能会被多次增发。
2. 关于资产增发模型详情请参考：[MST Conditional Offering](/zh-cn/developers/da-attenuation.html)
