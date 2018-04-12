title: 元界智能资产(MST)使用说明
comments: false
---


## 前提简述
这里主要介绍资产相关的命令行操作，其它的命令可以参考 [Command-line](/zh-cn/docs/command-line.html)

首先，你要有帐户，可以通过 `"mvs-cli getgetnewaccount 帐户名 密码"` 生成，**生成后切记妥善保存主私钥（mnemonic-key）**。

**为了方便，下文中我统一使用帐户名为 `test1`，密码为 `passwd1`，地址为`测试地址`，您在参考时请修改为自己的帐户名和密码，同时注意使用正确的地址。**

有了帐户，如果要发布或发送资产等，你还得确保该帐号下有 ETP 交手续费。可以通过 `"mvs-cli getbalance test1 passwd1"` 查询帐户总余额详情，也可以通过 `"mvs-cli listbalances test1 passwd1"` 查询帐户里各个地址下的余额。

所有命令都可以通过 `help` 查询帮助，例如使用 `"mvs-cli help createasset"` 或者 `"mvs-cli createasset -h"` 查询命令 `createasset` 的帮助。

## 创建资产
`createasset` --

```bash
Usage:
mvs-cli createasset [-h] --symbol value --volume value
[--description value] [--issuer value] [--decimalnumber value]
[--rate value] ACCOUNTNAME ACCOUNTAUTH

选项:
-h [--help]          获取帮助。
-d [--description]   资产描述,默认为空。
-i [--issuer]        资产发布人，默认为用户的帐户名。
-n [--decimalnumber] 小数位数，默认为0。
-r [--rate]          资产增发阈值，默认为0。合法取值范围为 -1 到 100，
                     其中 -1 表示可任意增发，0 表示永不增发，
                     1 到 100 表示需要资产持有百分比超过指定阈值才可增发。
-s [--symbol]        资产符号，全网惟一。
-v [--volume]        资产发行总量。

位置参数:
ACCOUNTNAME          帐户名，必须提供。
ACCOUNTAUTH          帐户密码，必须提供。

示例：
$ mvs-cli createasset --symbol MVS.TST --volume 1000000000000 --description "testing asset of MVS" --issuer test1 --decimalnumber 8 --rate 30 test1 passwd1
```
**注："-r [--rate]" 为新增参数(v0.8.0)，用于资产增发验证。**

**注：小数位数（decimalnumber）的意义很重要，请勿必理解。从开发者角度来看，其作用是去除在交易中使用浮点数，命令中全部使用整数以提高运算效率和精度。从普通用户角度来看，其作用是设定最小交易单位，例如当小数位数为8时，最小单位为`聪`，此时在命令中使用的数值都是以`聪`为单位的。当小数位数为其它值时，情况类似。如果您觉得这样不太符合您的思维方式，您可以使用默认值0即可。**

## 查询资产
资产有几种状态：`"unissued"`，`"issued"`，`"unspent"`，分别表示 `”未发布“`，`”已发布“`，`”未花费“`。

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

## 高级 API 使用说明
***
### 删除本地未发布资产
```
Usage: mvs-cli deletelocalasset [-h] --symbol value ACCOUNTNAME ACCOUNTAUTH

Info: deletelocalasset

Options (named):

-h [--help]          Get a description and instructions for this command.
-s [--symbol]        The asset symbol/name. Global unique.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
**NOTICE: local asset is unissued asset. when issued, it can never be deleted any more.**
***
### 获取指定账户的资产
```
Usage: mvs-cli getaccountasset [-h] ACCOUNTNAME ACCOUNTAUTH [SYMBOL]

Info: getaccountasset

Options (named):

-h [--help]          Get a description and instructions for this command.
--cert               If specified, then only get related asset cert.
                     Default is not specified.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
SYMBOL               Asset symbol.
```
**NOTICE: --cert is newly added option (in v0.8.0) which does not take any arguments.**  
**NOTICE: if SYMBOL is not specified, then get all assets of this account.**  
**to each asset, the returned quantity is a summary value on each address.**  
**the unissued asset of this account will also be showed.**
***
### 获取指定地址上的资产
```
Usage: mvs-cli getaddressasset [-h] ADDRESS

Info: getaddressasset

Options (named):

-h [--help]          Get a description and instructions for this command.
--cert               If specified, then only get related asset cert.
                     Default is not specified.

Arguments (positional):

ADDRESS              address
```
**NOTICE: --cert is newly added option (in v0.8.0) which does not take any arguments.**  
**NOTICE: only issued asset has address.**  
**to each asset, the returned quantity is a summary value on this address.**
***
### 获取全网资产或指定帐户资产总计
```
Usage: mvs-cli listassets [-h] [ACCOUNTNAME] [ACCOUNTAUTH]

Info: list assets details.

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
**NOTICE: if not specify account, list all issued asset.**  
**if account specified, list all asset of this account, includes unissued assets,**  
**and summary quantity on all addresses for each asset.**
***
### 获取全网资产符号或者指定资产发布信息
```
Usage: mvs-cli getasset [-h] [SYMBOL]

Info: Show existed assets details from MVS blockchain.

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

SYMBOL               Asset symbol. If not specified, will show whole
                     network asset symbols.
```
***
### 发布资产(随机目标地址)
```
Usage: mvs-cli issue [-h] [--fee value] ACCOUNTNAME ACCOUNTAUTH SYMBOL

Info: issue

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           The fee of tx. default_value 10 etp

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
SYMBOL               issued asset symbol
```
**NOTICE: the asset is issued to a random address of this account.**  
**every asset can only be issued once, and with symbol not already exists in blockchain.**
**when issue asset, the corresponding asset cert will be generated.**
***
### 发布资产(指定目标地址)
```
Usage: mvs-cli issuefrom [-h] [--fee value] ACCOUNTNAME ACCOUNTAUTH ADDRESS SYMBOL

Info: issuefrom

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           The fee of tx. default_value 10 etp

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
ADDRESS              target address to issue asset, also pay fees from this address.
SYMBOL               issued asset symbol
```
**NOTICE: the asset is issued to the specified target address.**  
**when issue asset, the corresponding asset cert will be generated.**
***
### 发送资产(未指定源地址)
```
Usage: mvs-cli sendasset [-h] [--fee value] ACCOUNTNAME ACCOUNTAUTH
ADDRESS SYMBOL AMOUNT

Info: sendasset

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           Transaction fee. defaults to 10000 ETP bits

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
ADDRESS              Asset receiver.
SYMBOL               Asset symbol/name.
AMOUNT               Asset integer bits. see asset <decimal_number>.
```
**NOTICE: only receiver address needs to be specified.**
***
### 发送资产(指定源地址)
```
Usage: mvs-cli sendassetfrom [-h] [--fee value] ACCOUNTNAME ACCOUNTAUTH
FROMADDRESS TOADDRESS SYMBOL AMOUNT

Info: sendassetfrom

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           Transaction fee. defaults to 10000 ETP bits

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
FROMADDRESS          From address
TOADDRESS            Target address
SYMBOL               Asset symbol
AMOUNT               Asset integer bits. see asset <decimal_number>.
```
**NOTICE: the transaction fee is paid from FROMADDRESS.**
***
### 查询交易
```
Usage: mvs-cli listtxs [-h] [--address value] [--height value] [--index
value] [--limit value] [--symbol value] ACCOUNTNAME ACCOUNTAUTH

Info: List transactions details of this account.

Options (named):

-h [--help]          Get a description and instructions for this command.
-a [--address]       Address.
-e [--height]        Get tx according height eg: -e
                     start-height:end-height will return tx between
                     [start-height, end-height)
-i [--index]         Page index.
-l [--limit]         Transaction count per page.
-s [--symbol]        Asset symbol.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
**NOTICE: -a -e -s is very useful to filter the transactions.**
***
## 新增资产 API (v0.8.0)
***
### 转移证书
```
Usage: mvs-cli transfercert [-h] [--issue] [--fee value] ACCOUNTNAME
ACCOUNTAUTH FROMADDRESS TOADDRESS SYMBOL

Info: transfercert

Options (named):

-h [--help]          Get a description and instructions for this command.
--issue              If specified, then transfer asset cert of ISSUE.
                     Default is not specified.
-f [--fee]           Transaction fee. defaults to 10000 ETP bits

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
FROMADDRESS          From address, cert and fee come from this address,
                     and mychange to this address too.
TOADDRESS            Target address
SYMBOL               asset symbol
```
**NOTICE: use options like '--issue' to specify which cert to transfer**
***
### 销毁资产
```
Usage: mvs-cli burn [-h] ACCOUNTNAME ACCOUNTAUTH SYMBOL AMOUNT

Info: Burn asset to blackhole address 1111111111111111111114oLvT2.

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
SYMBOL               The asset will be burned.
AMOUNT               Asset integer bits. see asset <decimal_number>.
```
***
### 资产增发
```
Usage: mvs-cli secondaryissue [-h] [--fee value] [--mychange value]
ACCOUNTNAME ACCOUNTAUTH ADDRESS SYMBOL VOLUME

Info: secondaryissue, alias as additionalissue.

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           The fee of tx. default_value 10000 ETP bits
-m [--mychange]      Mychange to this address

Arguments (positional):

ACCOUNTNAME          Account name.
ACCOUNTAUTH          Account password/authorization.
ADDRESS              target address to check and issue asset
SYMBOL               issued asset symbol
VOLUME               The vlolume of asset
```
**NOTICE: issued asset maybe secondaryissue many times.**

secondaryissue must satisfy the folllowing conditions

1. consider the transaction fees  
    the fees is paid from mychange parameter if specified, or else from searched addresses.
2. consider the threshold  
    the target address must have specified name/symbol asset of quantity value greater than or equal to threshold percentage.
3. consider the asset cert
    the target address must have ISSUE asset cert of specified name/symbol asset.
***

## 关于资产证书

**it's composed of three parts:**  
"certs" : kind of asset cert. It may contain many kinds, now only `ISSUE` cert is supported. We may add some other cert kinds later soon.  
"owner" : asset cert address. Later it may be a DID symbol (not supported at present).  
"symbol" : asset symbol/name.
```
$ ./bin/mvs-cli getaccountasset --cert test1 passwd1
{
	"assetcerts" :
	[
		{
			"address" : "M8iiHdPdTyPfyQY8464bDso7b421JqdShE",
			"certs" : "ISSUE",
			"owner" : "M8iiHdPdTyPfyQY8464bDso7b421JqdShE",
			"symbol" : "A1"
		}
	]
}
```
***

## 关于黑洞地址

**1111111111111111111114oLvT2** is the blackhole address,  
every ETP/asset etc. sent to this address is unspentable forever.

**NOTICE: burn command can burn asset to this blackhole address.**  
**If you use send/sendfrom/sendasset/sendassetfrom/transfercert etc. commands to send things to this blackhole address,**  
**this things sent to blackhole address cannot be spent and cannot be get back again, just like burn.**
**So take cake of this blackhole address!!! It begins with many number ones.**
***

## 资产输出信息描述
_use # comment to explain each key-value pair, these lines is not content of json object._
### 资产发布相关输出
```
{
    # target address where the asset is issued to.
    "address" : "MH6nu3JA1sdkjWFhcYGx42X9ztvStWWG3S",

    # decimal number, take 2 for example, 1 asset means 100 asset bits.
    "decimal_number" : 2,

    # description of asset information.
    "description" : "test asset",

    # a boolean value indicates whether this asset is secondary issued.
    "is_secondaryissue" : false,

    # who is the issuer.
    "issuer" : "test1",

    # maximum supply of this asset, with unit of asset bits.
    "maximum_supply" : 1000000,

    # secondary threshold value, used for secondary issue authentication.
    "secondaryissue_threshold" : 30,

    # status, there are 3 status: unissued, issued, unspent.
    "status" : "issued",

    # asset symbol, string length must be <= 64.
    "symbol" : "A1"
}
```
### 资产量查询相关输出
```
{
    # target address where the asset is issued to.
    "address" : "MH6nu3JA1sdkjWFhcYGx42X9ztvStWWG3S",

    # decimal number, take 2 for example, 1 asset means 100 asset bits.
    "decimal_number" : 2,

    # description of asset information.
    "description" : "test asset",

    # who is the issuer.
    "issuer" : "test1",

    # asset quantity, with unit of asset bits.
    "quantity" : 1000000,

    # secondary threshold value, used for secondary issue authentication.
    "secondaryissue_threshold" : 30,

    # asset symbol, string length must be <= 64.
    "symbol" : "A1",

    # attachment type.
    "type" : "asset-issue"
}
```
### 资产转移相关输出
```
{
    # asset transfer quantity, with unit of asset bits.
    "quantity" : 2699992,

    # asset symbol, string length must be <= 64.
    "symbol" : "A1",

    # attachment type.
    "type" : "asset-transfer"
}
```
### 资产证书相关输出
```
{
    # comma separated asset cert names. certs contain many kinds, now only `ISSUE` cert is provided.
    "certs" : "ISSUE",

    # asset cert owner address.
    "owner" : "MH6nu3JA1sdkjWFhcYGx42X9ztvStWWG3S",

    # asset symbol, string length must be <= 64.
    "symbol" : "A1",

    # attachment type.
    "type" : "asset-cert"
}
```
***

## 例子

***
### 1. 创建资产
```
// Request
curl -X POST --data '{"id":125, "jsonrpc":"2.0", "method":"createasset", "params":["test1", "passwd1", {"description":"test asset","issuer":"test1","decimalnumber":2,"rate":30,"symbol":"A1","volume":1000000}]}' 127.0.0.1:8820/rpc/v2

// Response
{
    "id" : 125,
    "jsonrpc" : "2.0",
    "result" :
    {
        "asset" :
        {
            "address" : "",
            "decimal_number" : 2,
            "description" : "test asset",
            "is_secondaryissue" : false,
            "issuer" : "test1",
            "maximum_supply" : 1000000,
            "secondaryissue_threshold" : 30,
            "status" : "unissued",
            "symbol" : "A1"
        }
    }
}
```
### 2. 发布资产
```
// Request
curl -X POST --data '{"id":125, "jsonrpc":"2.0", "method":"issuefrom", "params":["test1", "passwd1", "MH6nu3JA1sdkjWFhcYGx42X9ztvStWWG3S", "A1"]}' 127.0.0.1:8820/rpc/v2

// Response
{
    "id" : 125,
    "jsonrpc" : "2.0",
    "result" :
    {
        "transaction" :
        {
            "hash" : "0dd5e016f79df514bfd271d14311f1aa1bf2c0d6c20a82978855763fa3fbd9bc",
            "inputs" :
            [
                {
                    "address" : "MH6nu3JA1sdkjWFhcYGx42X9ztvStWWG3S",
                    "previous_output" :
                    {
                        "hash" : "edac455275a2ed759bca746a5a9f1d30618a505318448ba82dec7ab51dc72b16",
                        "index" : 1
                    },
                    "script" : "[ 3044022100fa705d5811cecbea9832f2fe1afb26ccb8221824da8ae0bb100f4f42305255f3021f708f07e579242c83f2e2669fadfc5142e2e57c687e6ad55b51a6ce7c175f0d01 ] [ 030c948c032467d52b577677ca561f069a7a81f04e1489edce1297088449c1607c ]",
                    "sequence" : 4294967295
                },
                {
                    "address" : "MH6nu3JA1sdkjWFhcYGx42X9ztvStWWG3S",
                    "previous_output" :
                    {
                        "hash" : "5cecac163a60ba51ef34728fe775f109027d957f7974be3814aa3b4cef6ecb28",
                        "index" : 0
                    },
                    "script" : "[ 304402204c93702ac47b7f78e1befcc4f43575c24a5e993ee8afde95b12b742b3093764f02206cf8967edae406cd93baba60dcdac10e79ad15060028726f79be93ef434365e001 ] [ 030c948c032467d52b577677ca561f069a7a81f04e1489edce1297088449c1607c ]",
                    "sequence" : 4294967295
                },
                {
                    "address" : "MH6nu3JA1sdkjWFhcYGx42X9ztvStWWG3S",
                    "previous_output" :
                    {
                        "hash" : "f4210d04f9423b5fe9b59df187b9489a0cb7c02197d6255746544f7c68b4cbb2",
                        "index" : 0
                    },
                    "script" : "[ 3045022100b1648c47c5887c4264df5861486d7dc54bc6b07524965ffe945e409e2b0e20140220269d1bc208fb7d29ed2bc38855b232021f3e97059fa5c99ca7d370401989879801 ] [ 030c948c032467d52b577677ca561f069a7a81f04e1489edce1297088449c1607c ]",
                    "sequence" : 4294967295
                },
                {
                    "address" : "MH6nu3JA1sdkjWFhcYGx42X9ztvStWWG3S",
                    "previous_output" :
                    {
                        "hash" : "0e43b28e788342a806aac17fb0fc02526abfda872d7bce15029d984c15e6057e",
                        "index" : 0
                    },
                    "script" : "[ 30440220475893fe5894bf0e72bd9e171974bf7c15f3555fec81268ebd96b30bb033be84022065f241de64ff54a05a9276b911023e15fc9c3c7ca3db3c7409237e621e455d6901 ] [ 030c948c032467d52b577677ca561f069a7a81f04e1489edce1297088449c1607c ]",
                    "sequence" : 4294967295
                }
            ],
            "lock_time" : "0",
            "outputs" :
            [
                {
                    "address" : "MH6nu3JA1sdkjWFhcYGx42X9ztvStWWG3S",
                    "attachment" :
                    {
                        "address" : "MH6nu3JA1sdkjWFhcYGx42X9ztvStWWG3S",
                        "decimal_number" : 2,
                        "description" : "test asset",
                        "issuer" : "test1",
                        "quantity" : 1000000,
                        "secondaryissue_threshold" : 30,
                        "symbol" : "A1",
                        "type" : "asset-issue"
                    },
                    "index" : 0,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 64ec508a7bb6feff0e370c521ab44d8fce3263af ] equalverify checksig",
                    "value" : 0
                },
                {
                    "address" : "MH6nu3JA1sdkjWFhcYGx42X9ztvStWWG3S",
                    "attachment" :
                    {
                        "certs" : "ISSUE",
                        "owner" : "MH6nu3JA1sdkjWFhcYGx42X9ztvStWWG3S",
                        "symbol" : "A1",
                        "type" : "asset-cert"
                    },
                    "index" : 1,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 64ec508a7bb6feff0e370c521ab44d8fce3263af ] equalverify checksig",
                    "value" : 0
                },
                {
                    "address" : "MH6nu3JA1sdkjWFhcYGx42X9ztvStWWG3S",
                    "attachment" :
                    {
                        "type" : "etp"
                    },
                    "index" : 2,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 64ec508a7bb6feff0e370c521ab44d8fce3263af ] equalverify checksig",
                    "value" : 100000000
                }
            ],
            "version" : "2"
        }
    }
}
```
### 3. 销毁一些资产
```
// Request
curl -X POST --data '{"id":125, "jsonrpc":"2.0", "method":"burn", "params":["test1", "passwd1", "A1", "100008"]}' 127.0.0.1:8820/rpc/v2

// Response
{
	"id" : 125,
	"jsonrpc" : "2.0",
	"result" :
	{
		"transaction" :
		{
			"hash" : "dc0fdae2da5f309d15bb5cb767cd6f39dbec884e1365161812797370608d157b",
			"inputs" :
			[
				{
					"address" : "M8iiHdPdTyPfyQY8464bDso7b421JqdShE",
					"previous_output" :
					{
						"hash" : "b4977b6b5d0bcb179b92ee32caa04df3e166435b5b4c8864f1112909dc4f2702",
						"index" : 2
					},
					"script" : "[ 3044022035757c89624af45a804a88368ef3c6527204676b939056a60440acaf7dccd8c702200364c0868bb77a00027c3815bfcd18fbb13fbb1f2fea1d569cd3fd0950488b2701 ] [ 02313a40c42045ae920ea91a4da0b59c8b3892291f74a79125c7f4e014992a9eb1 ]",
					"sequence" : 4294967295
				},
				{
					"address" : "M8iiHdPdTyPfyQY8464bDso7b421JqdShE",
					"previous_output" :
					{
						"hash" : "b4977b6b5d0bcb179b92ee32caa04df3e166435b5b4c8864f1112909dc4f2702",
						"index" : 1
					},
					"script" : "[ 3044022030453a9a5d318518f68d5310323ba0f75a27e65d320e1969fc7acde292c2d3a6022039b168d1704e1f07159c5eb1083dc766b5987ac9b9ef5e98e7025614ce4c567801 ] [ 02313a40c42045ae920ea91a4da0b59c8b3892291f74a79125c7f4e014992a9eb1 ]",
					"sequence" : 4294967295
				}
			],
			"lock_time" : "0",
			"outputs" :
			[
				{
					"address" : "1111111111111111111114oLvT2",
					"attachment" :
					{
						"quantity" : 100008,
						"symbol" : "A1",
						"type" : "asset-transfer"
					},
					"index" : 0,
					"locked_height_range" : 0,
					"script" : "return",
					"value" : 0
				},
				{
					"address" : "M8iiHdPdTyPfyQY8464bDso7b421JqdShE",
					"attachment" :
					{
						"type" : "etp"
					},
					"index" : 1,
					"locked_height_range" : 0,
					"script" : "dup hash160 [ 08fe4ef8f6258b0348c9ac3d1e7cba696a959d6c ] equalverify checksig",
					"value" : 199970000
				},
				{
					"address" : "M8iiHdPdTyPfyQY8464bDso7b421JqdShE",
					"attachment" :
					{
						"quantity" : 2699992,
						"symbol" : "A1",
						"type" : "asset-transfer"
					},
					"index" : 2,
					"locked_height_range" : 0,
					"script" : "dup hash160 [ 08fe4ef8f6258b0348c9ac3d1e7cba696a959d6c ] equalverify checksig",
					"value" : 0
				}
			],
			"version" : "2"
		}
	}
}
```
### 4. 增发资产
```
// Request
curl -X POST --data '{"id":125, "jsonrpc":"2.0", "method":"secondaryissue", "params":["test1", "passwd1", "M8iiHdPdTyPfyQY8464bDso7b421JqdShE", "A1", "2000012"]}' 127.0.0.1:8820/rpc/v2

// Response
{
    "id" : 125,
    "jsonrpc" : "2.0",
    "result" :
    {
        "transaction" :
        {
            "hash" : "e11590dd352086da06102a534e23311d8590231bc52f688b5515d134c05366d1",
            "inputs" :
            [
                {
                    "address" : "MQDKDSNyqg1rx3LuoNmsdkULLFYBcoZU6i",
                    "previous_output" :
                    {
                        "hash" : "625c4adad39a05315546097c9f29cb308e325bf73097fd0a2fd3e22602a55264",
                        "index" : 0
                    },
                    "script" : "[ 304402200b391aab1b589fb981e492a3bf4607bf70b60a6179283daaa9f45835b82fae9502203ce46beb5c6b3c790666aefc6db765aacb5ab0613db817b2a5e5ddabfb982a3b01 ] [ 022fadfc3f95c1b64dad41db3a11a7efcefafd57debe7a4f1ebff19f11ed383e08 ]",
                    "sequence" : 4294967295
                },
                {
                    "address" : "M8iiHdPdTyPfyQY8464bDso7b421JqdShE",
                    "previous_output" :
                    {
                        "hash" : "3190483acf063217e679fdffdac73076e2d3de5f0b059c449ef926edd19fc246",
                        "index" : 2
                    },
                    "script" : "[ 30450221008ecb5e23d90e3bbffbfe8fcf3acb9173ccf5ccefd821803e2ca8cd44b986481802203099a8a3baab3fe250ddbbaf3f32898aabd42e94f28d8408a0d1161ff724380c01 ] [ 02313a40c42045ae920ea91a4da0b59c8b3892291f74a79125c7f4e014992a9eb1 ]",
                    "sequence" : 4294967295
                },
                {
                    "address" : "M8iiHdPdTyPfyQY8464bDso7b421JqdShE",
                    "previous_output" :
                    {
                        "hash" : "972763cd64bdb20ffae99e34a499c2adb7e14714f4278b66da948ca84083c713",
                        "index" : 1
                    },
                    "script" : "[ 304402202eca989e1e5d0a4756d96dd0f06078da7109d32c3a52710e9530c5b57b21022c02202510fdd6150e642f887b4f423e3c409ade7f610dfb4cf8b5fcc9490c6a2d4f7001 ] [ 02313a40c42045ae920ea91a4da0b59c8b3892291f74a79125c7f4e014992a9eb1 ]",
                    "sequence" : 4294967295
                }
            ],
            "lock_time" : "0",
            "outputs" :
            [
                {
                    "address" : "M8iiHdPdTyPfyQY8464bDso7b421JqdShE",
                    "attachment" :
                    {
                        "address" : "M8iiHdPdTyPfyQY8464bDso7b421JqdShE",
                        "decimal_number" : 2,
                        "description" : "test asset",
                        "issuer" : "test1",
                        "quantity" : 2000012,
                        "secondaryissue_threshold" : 30,
                        "symbol" : "A1",
                        "type" : "asset-issue"
                    },
                    "index" : 0,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 08fe4ef8f6258b0348c9ac3d1e7cba696a959d6c ] equalverify checksig",
                    "value" : 0
                },
                {
                    "address" : "M8iiHdPdTyPfyQY8464bDso7b421JqdShE",
                    "attachment" :
                    {
                        "certs" : "ISSUE",
                        "owner" : "M8iiHdPdTyPfyQY8464bDso7b421JqdShE",
                        "symbol" : "A1",
                        "type" : "asset-cert"
                    },
                    "index" : 1,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 08fe4ef8f6258b0348c9ac3d1e7cba696a959d6c ] equalverify checksig",
                    "value" : 0
                },
                {
                    "address" : "MQDKDSNyqg1rx3LuoNmsdkULLFYBcoZU6i",
                    "attachment" :
                    {
                        "type" : "etp"
                    },
                    "index" : 2,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ b2f0ff9722ce9670bb0f4aaf9fb2b6c67bb5cedc ] equalverify checksig",
                    "value" : 299990000
                },
                {
                    "address" : "M8iiHdPdTyPfyQY8464bDso7b421JqdShE",
                    "attachment" :
                    {
                        "quantity" : 900000,
                        "symbol" : "A1",
                        "type" : "asset-transfer"
                    },
                    "index" : 3,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 08fe4ef8f6258b0348c9ac3d1e7cba696a959d6c ] equalverify checksig",
                    "value" : 0
                }
            ],
            "version" : "3"
        }
    }
}
```
