title: 资产相关操作
comments: false
---


## 前提简述
这里主要介绍资产相关的命令行操作，其它的命令可以参考 [Command-line](/zh-cn/docs/command-line.html)

首先，你要有帐户，可以通过 `"mvs-cli getgetnewaccount 帐户名 密码"` 生成，**生成后切记妥善保存主私钥（mnemonic-key）**。

**为了方便，下文中我统一使用帐户名为 `test1`，密码为 `passwd1`，地址为`测试地址`，您在参考时请修改为自己的帐户名和密码，同时注意使用正确的地址。**

有了帐户，如果要发布或发送资产等，你还得确保该帐号下有 ETP 交手续费。可以通过 `"mvs-cli getbalance test1 passwd1"` 查询帐户总余额详情，也可以通过 `"mvs-cli listbalances test1 passwd1"` 查询帐户里各个地址下的余额。

所有命令都可以通过 `help` 查询帮助，例如使用 `"mvs-cli help createasset"` 或者 `"mvs-cli createasset -h"` 查询命令 `createasset` 的帮助。

## 创建资产
`createasset`

```bash
Usage:
mvs-cli createasset [-h] --symbol value --volume value
[--description value] [--issuer value] [--decimalnumber value]
ACCOUNTNAME ACCOUNTAUTH

选项:
-h [--help]          获取帮助。
-d [--description]   资产描述,默认为空。
-i [--issuer]        资产发布人，默认为用户的帐户名。
-n [--decimalnumber] 小数位数，默认为0。
-s [--symbol]        资产符号，全网惟一。
-v [--volume]        资产发行总量。

位置参数:
ACCOUNTNAME          帐户名，必须提供。
ACCOUNTAUTH          帐户密码，必须提供。

示例：
$ mvs-cli createasset --symbol MVS.TST --volume 10000 --description "testing asset of MVS" --issuer test1 --decimalnumber 8 test1 passwd1
```
**注：小数位数（decimalnumber）的意义很重要，请勿必理解。从开发者角度来看，其作用是去除在交易中使用浮点数，命令中全部使用整数以提高运算效率和精度。从普通用户角度来看，其作用是设定最小交易单位，例如当小数位数为8时，最小单位为`聪`，此时在命令中使用的数值都是以`聪`为单位的。当小数位数为其它值时，情况类似。如果您觉得这样不太符合您的思维方式，您可以使用默认值0即可。**

## 查询资产
资产有几种状态：`"unissued"`，`"issued"`，`"unspent"`，分别表示 `”未发布“`，`”已成功发布“`，`”已发布还没花费“`。

`getaccountasset`
根据帐户获取资产，包含未发布资产。返回结果中含有资产的地址信息。
```bash
$ mvs-cli getaccountasset test1 passwd1
```
`listassets`
列出资产
```bash
# 列出所有**已成功发布**的资产
$ mvs-cli listassets
# 列出指定帐户的资产，包含未发布资产。返回结果中不含资产地址信息。
$ mvs-cli listassets test1 passwd1
```
`getasset`
获取**已成功发布**的资产
```bash
# 获取所有资产的资产符号列表
$ mvs-cli getasset
# 获取指定资产符号的资产
$ mvs-cli getasset MVS.TST
```
`getaddressasset`
根据地址获取**已成功发布**资产
```bash
$ mvs-cli getaddressasset MKWjVNAGSDjhQmUW9VUwcBNGTscYozNopJ
```

## 删除本地资产(未发布的资产)
`deletelocalasset`
删除本地资产，也即还没发布的资产。**注：资产一经发布，则不能删除了。**
```bash
# 临时创建一个本地资产，再将其删除。
$ mvs-cli createasset --symbol MVS.TST2 --volume 10000 --description "temp testing asset of MVS" --issuer test1 --decimalnumber 0 test1 passwd1
$ mvs-cli deletelocalasset --symbol MVS.TST2 test1 passwd1
```

## 发布资产
**注：已经发布的资产不能再次发布，再次发布会报错"validate transaction failure"**

`issue`
该命令所需三个参数依次为：帐户名，密码，资产符号
```bash
$ mvs-cli issue test1 passwd1 MVS.TST
```
`issuefrom`
该命令所需四个参数依次为：帐户名，密码，支付地址，资产符号
```bash
# 指定支付手续费的地址
$ mvs-cli issuefrom test1 passwd1 MKWjVNAGSDjhQmUW9VUwcBNGTscYozNopJ MVS.TST
```
以上两个命令均可以通过选项 `"--fee 整数值"` 设定发布资产的手续费，默认为10ETP。手续费多的话可能矿工们更愿意将此次交易打包进区块中去，交易确认的时间可能会更短一些。一般使用默认值即可。

## 发送资产
**注：资产需要发布后才能发送**

`sendasset`
该命令所需五个参数依次为：帐户名，密码，接收地址，资产符号，发送数量
```bash
$ mvs-cli sendasset test1 passwd1 MQTAjXoteFzzZoWpNEamG88gf5b82z6o9Q MVS.TST 100
```
`sendassetfrom`
该命令所需六个参数依次为：帐户名，密码，发送地址，接收地址，资产符号，发送数量
```bash
$ mvs-cli sendassetfrom test1 passwd1 MKWjVNAGSDjhQmUW9VUwcBNGTscYozNopJ MQTAjXoteFzzZoWpNEamG88gf5b82z6o9Q MVS.TST 900
```
以上两个命令均可以通过选项 `"--fee 整数值"` 设定发送资产的手续费，默认为10000ETP bits(也即0.0001ETP)。手续费多的话可能矿工们更愿意将此次交易打包进区块中去，交易确认的时间可能会更短一些。一般使用默认值即可。
