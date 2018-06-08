title: 发行资产
---

## 前提简述
这里主要介绍资产发行相关的命令行操作，其它的命令可以参考 [Command-line](/zh-cn/docs/command-line.html)

首先，你要有帐户和数字身份(did)，可以通过 `"mvs-cli getnewaccount 帐户名 密码"` 和 `"mvs-cli issuedid 帐户名 密码 测试地址 测试did"` 生成，**生成后切记妥善保存主私钥（mnemonic-key）**。

为了方便，下文中我统一使用帐户名为 `test1`，密码为 `passwd1`，测试did为`testdid`，地址为`测试地址`，您在参考时请修改为自己的帐户名和密码，同时注意使用正确的地址。

有了帐户，如果要发行或发送资产等，你还得确保该帐号下有 ETP 交手续费。可以通过 `"mvs-cli getbalance test1 passwd1"` 查询帐户总余额详情，也可以通过 `"mvs-cli listbalances test1 passwd1"` 查询帐户里各个地址下的余额。

所有命令都可以通过 `help` 查询帮助，例如使用 `"mvs-cli help createasset"` 或者 `"mvs-cli createasset -h"` 查询命令 `createasset` 的帮助。

## 简介
资产发行包括两个步骤：创建资产，发行资产。在通过 `createasset` 命令创建资产时，可以设置资产的各种属性，如发行量，增发属性等等。

## 创建资产
通过 `createasset` 命令来创建本地资产，未被发行的本地资产可以通过 `deletelocalasset` 删除。
```bash
Usage:
mvs-cli createasset [-h] --symbol value --volume value
[--description value] [--issuer value] [--decimalnumber value]
[--rate value] ACCOUNTNAME ACCOUNTAUTH

选项:
-h [--help]          获取帮助。
-d [--description]   资产描述,默认为空。
-i [--issuer]        资产发行人的did。
-n [--decimalnumber] 小数位数，默认为0。
-r [--rate]          资产增发阈值，默认为0。合法取值范围为 -1 到 100，
                     其中 -1 表示可任意增发，0 表示永不增发，
                     1 到 100 表示需要资产持有百分比超过指定阈值才可增发。
-s [--symbol]        资产符号，全网惟一。
-v [--volume]        资产发行总量。

位置参数:
ACCOUNTNAME          帐户名，必须提供。
ACCOUNTAUTH          帐户密码，必须提供。
```

示例：
```
$ mvs-cli createasset --symbol MVS.TST --volume 1000000000000 --description "asset of MVS" --issuer testdid --decimalnumber 8 --rate 30 test1 passwd1
```

## 发行资产
通过 `issue` 命令来发行资产。该命令所需三个参数依次为：帐户名，密码，资产符号。可以通过选项 `"--fee 整数值"` 设定发布资产的手续费，默认为 10 ETPs。手续费多的话可能矿工们更愿意将此次交易打包进区块中去，交易确认的时间可能会更短一些。一般使用默认值即可。

**注：已经发布的资产不能再次发布，再次发布会报错"validate transaction failure"**

示例：
```bash
$ mvs-cli issue test1 passwd1 MVS.TST
```

**SuperNova (v0.8.0)版本**  
可以通过选项 `-m [--model]` 设置衰减模型。详情请参考：[MST Conditional Offering](/zh-cn/developers/da-attenuation.html)。
