title: 元界智能资产(MST)使用说明
comments: false
---


## 前提简述
这里主要介绍资产相关的命令行操作，其它的命令可以参考 [Command-line](/zh-cn/docs/command-line.html)

首先，你要有帐户和数字身份(did)，可以通过 `"mvs-cli getnewaccount 帐户名 密码"` 和 `"mvs-cli issuedid 帐户名 密码 测试地址 测试did"` 生成，**生成后切记妥善保存主私钥（mnemonic-key）**。

**为了方便，下文中我统一使用帐户名为 `test1`，密码为 `passwd1`，测试did为`testdid`，地址为`测试地址`，您在参考时请修改为自己的帐户名和密码，同时注意使用正确的地址。**

有了帐户，如果要发布或发送资产等，你还得确保该帐号下有 ETP 交手续费。可以通过 `"mvs-cli getbalance test1 passwd1"` 查询帐户总余额详情，也可以通过 `"mvs-cli listbalances test1 passwd1"` 查询帐户里各个地址下的余额。

所有命令都可以通过 `help` 查询帮助，例如使用 `"mvs-cli help createasset"` 或者 `"mvs-cli createasset -h"` 查询命令 `createasset` 的帮助。

## 创建资产
`createasset`

```bash
Usage:
mvs-cli createasset [-h] --symbol value --volume value
[--description value] [--issuer value] [--decimalnumber value]
[--rate value] ACCOUNTNAME ACCOUNTAUTH

选项:
-h [--help]          获取帮助。
-d [--description]   资产描述,默认为空。
-i [--issuer]        资产发布人的did。
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
$ mvs-cli createasset --symbol MVS.TST --volume 1000000000000 --description "testing asset of MVS" --issuer testdid --decimalnumber 8 --rate 30 test1 passwd1
```
**注："-r [--rate]" 为新增参数(v0.8.0)，用于资产增发验证。**

**注：小数位数（decimalnumber）的意义很重要，请勿必理解。从开发者角度来看，其作用是去除在交易中使用浮点数，命令中全部使用整数以提高运算效率和精度。从普通用户角度来看，其作用是设定最小交易单位，例如当小数位数为8时，最小单位为`聪`，此时在命令中使用的数值都是以`聪`为单位的。当小数位数为其它值时，情况类似。如果您觉得这样不太符合您的思维方式，您可以使用默认值0即可。**

## 查询资产
资产有几种状态：`"unissued"`，`"issued"`，`"unspent"`，分别表示 `“未发布”`，`“已发布”`，`“未花费”`。

`getaccountasset`
根据帐户获取资产，包含未发布资产。返回结果中含有资产的地址信息。
```bash
$ mvs-cli getaccountasset test1 passwd1
```

`listassets`
列出资产
```bash
# 列出所有已成功发布的资产
$ mvs-cli listassets
# 列出指定帐户的资产，包含未发布资产。返回结果中不含资产地址信息。
$ mvs-cli listassets test1 passwd1
```

`getasset`
获取**已成功发布**的资产
```bash
# 获取所有已成功发布的资产符号列表
$ mvs-cli getasset
# 获取已成功发布的指定资产符号的资产
$ mvs-cli getasset MVS.TST
```

`getaddressasset`
根据地址获取**已成功发布**资产
```bash
$ mvs-cli getaddressasset MKWjVNAGSDjhQmUW9VUwcBNGTscYozNopJ
```

<code>listassets</code>, <code>getasset</code>, <code>getaddressasset</code> and <code>getaccountasset</code> 有一个 `--cert` 选项用于获取资产证书。

## 删除本地资产(未发布的资产)
`deletelocalasset`
删除本地资产，也即还没发布的资产。**注：资产一经发布，则不能删除了。**
```bash
# 临时创建一个本地资产，再将其删除。
$ mvs-cli createasset --symbol MVS.TST2 --volume 10000 --description "temp testing asset of MVS" --issuer testdid --decimalnumber 0 test1 passwd1
$ mvs-cli deletelocalasset --symbol MVS.TST2 test1 passwd1
```

## 发布资产
**注：已经发布的资产不能再次发布，再次发布会报错"validate transaction failure"**

`issue`
该命令所需三个参数依次为：帐户名，密码，资产符号
```bash
$ mvs-cli issue test1 passwd1 MVS.TST
```

可以通过选项 `"--fee 整数值"` 设定发布资产的手续费，默认为10ETP。手续费多的话可能矿工们更愿意将此次交易打包进区块中去，交易确认的时间可能会更短一些。一般使用默认值即可。

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

## 转移证书
`transfercert`
该命令所需五个参数依次为：帐户名，密码，接收did，资产符号，证书类型
```bash
$ mvs-cli transfercert test1 passwd1 testdid KOK ISSUE
```
目前仅仅支持“DOMAIN”、“ISSUE”、“NAMING”类型的证书。

## 颁发证书
`issuecert`
该命令所需五个参数依次为：帐户名，密码，接收did，资产符号，证书类型
```bash
$ mvs-cli issuecert test1 passwd1 testdid KOK.MUSIC -c NAMING
```
目前仅仅支持“NAMING”类型的证书。

##
## 高级 API 使用说明
***
### 删除本地未发布资产
```
Usage: mvs-cli deletelocalasset [-h] --symbol value ACCOUNTNAME ACCOUNTAUTH

Info: deletelocalasset

选项参数：

-h [--help]          Get a description and instructions for this command.
-s [--symbol]        The asset symbol/name. Global unique.

位置参数：

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
**注：本地资产是指未发布的资产。一旦资产被发布，就不能被删除了。**

***
### 获取指定账户的资产
```
Usage: mvs-cli getaccountasset [-h] [--c] ACCOUNTNAME ACCOUNTAUTH [SYMBOL]

Info: getaccountasset

选项参数：

-h [--help]          Get a description and instructions for this command.
--c [--cert]         If specified, then only get related asset cert.
                     Default is not specified.

位置参数：

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
SYMBOL               Asset symbol.
```
**注： --cert 是版本 v0.8.0 中新增的选项，无需参数，指示该命令用于获取证书。**
**注： 如果指定了 SYMBOL 参数，则返回指定 SYMBOL 的资产或证书；否则返回该账户下所有的资产或证书。**
**输出资产的数量是同一地址下所有资产数量的总和。**
**本命令不输出未发布的资产。**

***
### 获取指定地址上的资产
```
Usage: mvs-cli getaddressasset [-h] [--c] ADDRESS

Info: getaddressasset

选项参数：

-h [--help]          Get a description and instructions for this command.
--c [--cert]         If specified, then only get related asset cert.
                     Default is not specified.

位置参数：

ADDRESS              address
```
**注： --cert 是版本 v0.8.0 中新增的选项，无需参数，指示该命令用于获取证书。**
**输出资产的数量是该地址下所有资产数量的总和。**
**本命令不输出未发布的资产。**

***
### 获取全网资产或指定帐户资产总计
```
Usage: mvs-cli listassets [-h] [--c] [ACCOUNTNAME] [ACCOUNTAUTH]

Info: list assets details.

选项参数：

-h [--help]          Get a description and instructions for this command.
--c [--cert]         If specified, then only get related asset cert.
                     Default is not specified.
位置参数：

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
**注： --cert 是版本 v0.8.0 中新增的选项，无需参数，指示该命令用于获取证书。**
**注： 如果没有指定账户，则列出所有全网已发布的资产或证书。否则列出指定账户下的所有资产（包括未发布的本地资产）或证书。**
**输出资产的数量是所有资产数量的总和。**

***
### 获取全网资产符号或者指定资产发布信息
```
Usage: mvs-cli getasset [-h] [--c] [SYMBOL]

Info: Show existed assets details from MVS blockchain.

选项参数：

-h [--help]          Get a description and instructions for this command.
--c [--cert]         If specified, then only get related asset cert.
                     Default is not specified.
位置参数：

SYMBOL               Asset symbol. If not specified, will show whole
                     network asset symbols.
```
**注： --cert 是版本 v0.8.0 中新增的选项，无需参数，指示该命令用于获取证书。**

***
### 发布资产(随机目标地址)
```
Usage: mvs-cli issue [-h] [--fee value] ACCOUNTNAME ACCOUNTAUTH SYMBOL

Info: issue

选项参数：

-h [--help]          Get a description and instructions for this command.
-f [--fee]           The fee of tx. default_value 10 etp

位置参数：

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
SYMBOL               issued asset symbol
```
**注： the asset is issued to the address of asset issuer.**
**every asset can only be issued once, and with symbol not already exists in blockchain.**
**when issue asset, the corresponding asset ISSUE cert will be generated.**
**if the DIMAIN cert does not exist in blockchain, then DIMAIN cert will be generated too.**

***
### 发送资产(未指定源地址)
```
Usage: mvs-cli sendasset [-h] [--fee value] ACCOUNTNAME ACCOUNTAUTH
ADDRESS SYMBOL AMOUNT

Info: sendasset

选项参数：

-h [--help]          Get a description and instructions for this command.
-f [--fee]           Transaction fee. defaults to 10000 ETP bits

位置参数：

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
ADDRESS              Asset receiver.
SYMBOL               Asset symbol/name.
AMOUNT               Asset integer bits. see asset <decimal_number>.
```
**注： only receiver address needs to be specified.**

***
### 发送资产(指定源地址)
```
Usage: mvs-cli sendassetfrom [-h] [--fee value] ACCOUNTNAME ACCOUNTAUTH
FROMADDRESS TOADDRESS SYMBOL AMOUNT

Info: sendassetfrom

选项参数：

-h [--help]          Get a description and instructions for this command.
-f [--fee]           Transaction fee. defaults to 10000 ETP bits

位置参数：

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
FROMADDRESS          From address
TOADDRESS            Target address
SYMBOL               Asset symbol
AMOUNT               Asset integer bits. see asset <decimal_number>.
```
**注： the transaction fee is paid from FROMADDRESS.**
***
### 查询交易
```
Usage: mvs-cli listtxs [-h] [--address value] [--height value] [--index
value] [--limit value] [--symbol value] ACCOUNTNAME ACCOUNTAUTH

Info: List transactions details of this account.

选项参数：

-h [--help]          Get a description and instructions for this command.
-a [--address]       Address.
-e [--height]        Get tx according height eg: -e
                     start-height:end-height will return tx between
                     [start-height, end-height)
-i [--index]         Page index.
-l [--limit]         Transaction count per page.
-s [--symbol]        Asset symbol.

位置参数：

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
**注： -a -e -s is very useful to filter the transactions.**
***

## 新增资产 API (v0.8.0)

***
### 颁发证书
```
Usage: mvs-cli issuecert [-h] [--fee value] ACCOUNTNAME
ACCOUNTAUTH TODID SYMBOL CERT

Info: issuecert

选项参数：

-h [--help]          Get a description and instructions for this command.
-f [--fee]           Transaction fee. defaults to 10000 ETP bits

位置参数：

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
TODID                Target did
SYMBOL               Asset cert symbol
CERT                 Asset cert type, "NAMING" is supported now.
```

***
### 转移证书
```
Usage: mvs-cli transfercert [-h] [--fee value] ACCOUNTNAME
ACCOUNTAUTH TODID SYMBOL CERT

Info: transfercert

选项参数：

-h [--help]          Get a description and instructions for this command.
-f [--fee]           Transaction fee. defaults to 10000 ETP bits

位置参数：

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
TODID                From did
SYMBOL               Asset cert symbol
CERT                 Asset cert type name. eg. "ISSUE", "DOMAIN" or "NAMING"
```

***
### 销毁资产
```
Usage: mvs-cli burn [-h] ACCOUNTNAME ACCOUNTAUTH SYMBOL AMOUNT

Info: Burn asset to blackhole address 1111111111111111111114oLvT2.

选项参数：

-h [--help]          Get a description and instructions for this command.

位置参数：

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
SYMBOL               The asset will be burned.
AMOUNT               Asset integer bits. see asset <decimal_number>.
```
***

### 资产增发
```
Usage: mvs-cli secondaryissue [-h] [--fee value]
ACCOUNTNAME ACCOUNTAUTH TODID SYMBOL VOLUME

Info: secondaryissue, alias as additionalissue.

选项参数：

-h [--help]          Get a description and instructions for this command.
-f [--fee]           The fee of tx. default_value 10000 ETP bits

位置参数：

ACCOUNTNAME          Account name.
ACCOUNTAUTH          Account password/authorization.
TODID                Target did to check and issue asset
SYMBOL               The symbol of issued asset
VOLUME               The volume of asset
```
**注： issued asset maybe secondaryissue many times.**

secondaryissue must satisfy the folllowing conditions

1. consider the transaction fees
    the fees is paid from mychange parameter if specified, or else from searched addresses.
2. consider the threshold
    the target address must have specified name/symbol asset of quantity value greater than or equal to threshold percentage.
3. consider the asset cert
    the target address must have ISSUE asset cert of specified name/symbol asset.

***

## About attenuation model

Attenuation model is an advanced lock mechanism. This model will lock some specified quantity of assets, and unlock them gradually in a specified way(specified time interval and quantity).

**The supported model type is**
1. fixed quantity ( TYPE = 1 )
> This model will unlock the assets with equal quantity and with equal time interval.
> The last cycle may have some difference as remainder of division.
2. custom ( TYPE = 2 )
> This model will unlock the assets with quantity and time interval customized by user.


**The model param's format is**
1. = (equal sign) separates key and value of key-value entry.
2. ; (semicolon) separates key-value entries.
3. , (comma) separates items of value in key-value entry.
4. The keys of each model are restricted to given ones, no more and no less.
    For `fixed quantity model`, the keys are `PN, LH, TYPE, LQ, LP, UN`
    For `custom model`, the keys are `PN, LH, TYPE, LQ, LP, UN, UC, UQ`
    Among these keys, `PN, LH` are mutable and generated by program.
    The others are immutable, after inited (in `issue / secondaryissue`), they will never change any more.
5. The keys' meaning
    ```
    PN current period number
    LH latest lock height
    TYPE attenuation model type
    LQ total locked quantity
    LP total locked period
    UN total unlock numbers
    UC unlock time interval arrays
    UQ unlock quantity arrays
    ```
6. Constraints the values must satisfy
    * for fixed quantity model
    ```
        TYPE=1,
        UN>0,
        LQ<=(utxo asset value)
        LQ>=UN
        LP>=UN
    ```
    * for custom model
    ```
        TYPE=2,
        UN>0, UN<=100
        LQ<=(utxo asset value)
        both UC and UQ array size are equal to UN, and with positive item.
        LQ = sum of UQ array items
        LP = sum of UC array items
    ```
7. Examples
    * example of fixed quantity model param
        **PN=0;LH=20000;TYPE=1;LQ=9001;LP=60001;UN=3**
    ```
        This model means 9001 (LQ) assets will be locked in 60001 (LP) block heights.
        These assets will be unlocked in 3 (UN) periods with fixed quantity and interval.
        We can infer that **UC=LP/UN** and **UQ=LQ/UN** (the last unlock all left)
        That is  UC=60001/3=20000 and UQ=9001/3=3000, so,
        * after 20000 block height, 3000 will be unlocked,
        * after another 20000 block height, another 3000 will be unlocked,
        * after the left 20001 block height, the all lefted 3001 will be unlocked.
    ```
    * example of custom model param
        **PN=0;LH=20000;TYPE=2;LQ=90001;LP=600001;UN=3;UC=20000,20000,20001;UQ=3000,3000,3001**
    ```
        This custom model has the same effect with the above example.
        It's unlock quantity and time interval is specified by arrays.
    ```

## 关于资产证书

**证书由四部分构成**
"symbol" : 证书名字。
"address"： 证书所在地址
"owner"：证书拥有者的did
"cert" : 证书类型。目前仅支持如下类型：
> ISSUE：发行证书，发布资产时自动获得该资产的发行证书，拥有发行证书才能增发相应的资产
> DOMAIN：域名证书，发布资产时获得，其名字为资产名字（若资产名字中不包含"."）或第一个"."号之前的部分
> NAMING：冠名权证书，域名证书的所有者可以通过 <code>issuecert</code> 颁发二级域名的冠名权证书

**注： 并非所有的资产名字都含有有效的域名。示例：资产名字".MVS.TST"就没有有效域名，因此发行该名字的资产时不会产生域名证书。**

```
$ ./bin/mvs-cli getaccountasset --cert test1 passwd1
{
    "assetcerts" :
    [
        {
            "address" : "M8iiHdPdTyPfyQY8464bDso7b421JqdShE",
            "cert" : "ISSUE",
            "owner" : "testdid",
            "symbol" : "A1"
        }
    ]
}
```
***

## 关于黑洞地址

**1111111111111111111114oLvT2** is the blackhole address,
every ETP/asset etc. sent to this address is unspentable forever.

**注： burn command can burn asset to this blackhole address.**
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
    "issuer" : "testdid",

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
    "issuer" : "testdid",

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
    # asset cert types. certs may combines many cert types.
    "cert" : "ISSUE",

    # asset cert address.
    "address" : "MH6nu3JA1sdkjWFhcYGx42X9ztvStWWG3S",

    # asset cert owner did.
    "owner" : "testdid",

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
curl -X POST --data '{"id":125, "jsonrpc":"2.0", "method":"createasset", "params":["test1", "passwd1", {"description":"test asset","issuer":"testdid","decimalnumber":2,"rate":30,"symbol":"A1","volume":1000000}]}' 127.0.0.1:8820/rpc/v2

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
            "issuer" : "testdid",
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
curl -X POST --data '{"id":125, "jsonrpc":"2.0", "method":"issue", "params":["test1", "passwd1", "A1"]}' 127.0.0.1:8820/rpc/v2

// Response
{
    "id" : 125,
    "jsonrpc" : "2.0",
    "result" :
    {
        "transaction" :
        {
            "hash" : "ea7194311309261ede097b3f8413feb676c100aa6e87e34875804927c992f250",
            "inputs" :
            [
                {
                    "address" : "MJEadcaE7LjEJcBSyjLecbst7snx7T94DH",
                    "previous_output" :
                    {
                        "hash" : "4a0d0066e6ed8a3865625857793fd279fa09f552cf7674a256603bd5d89f9fa6",
                        "index" : 0
                    },
                    "script" : "[ 30440220218973f91fda66322bb04a8ccc62aced6fd0dbe6f0a3daa33e316c0ba35dd24002202d2a5c6c377c445ba1697b41a0f16cde7bad5484574750f89d2fc524a660073601 ] [ 03d54a5f927e54692db8189e9d5cc097161ca0797a2c6de02a586bc242245595c6 ]",
                    "sequence" : 4294967295
                },
                {
                    "address" : "MJEadcaE7LjEJcBSyjLecbst7snx7T94DH",
                    "previous_output" :
                    {
                        "hash" : "72ed14a9f63963e73a6fbbf4e3ebf006e7236712aa5bc56f25b3bdd9b49d31c4",
                        "index" : 0
                    },
                    "script" : "[ 3045022100e1b632b84edf93fe6138f667b3909490072d33c67c32bb768fef7bc4768a652d02206b83cb837f36ac16ec66a149286e886f2668437f5e5675ae673c6f252311191601 ] [ 03d54a5f927e54692db8189e9d5cc097161ca0797a2c6de02a586bc242245595c6 ]",
                    "sequence" : 4294967295
                },
                {
                    "address" : "MJEadcaE7LjEJcBSyjLecbst7snx7T94DH",
                    "previous_output" :
                    {
                        "hash" : "4eb8be3db1c96b1e84bbd4f20806aed92187faee7d08e8f88600367220890900",
                        "index" : 0
                    },
                    "script" : "[ 304402203dfe359d8d99c182681b816a952dae3b046824462cca35b5ebc9bd1744fe81750220319f02866bfde25be47f7fac1ed6e9b5a7fb86d0cc94c26e5ae96e9dd820bb5f01 ] [ 03d54a5f927e54692db8189e9d5cc097161ca0797a2c6de02a586bc242245595c6 ]",
                    "sequence" : 4294967295
                },
                {
                    "address" : "MJEadcaE7LjEJcBSyjLecbst7snx7T94DH",
                    "previous_output" :
                    {
                        "hash" : "2d3235d7cc6f90bbe4d18ceb4ba21ad703c6010fdc608b51a56f04f910e5100a",
                        "index" : 0
                    },
                    "script" : "[ 304402204d6ecfcd89e11d2365d847ac86eef9e06396fb4318f302d2a28918ab141c72c502206100915397b84dc4825619861e2af0e883185b18d5901dda0afeb1648207d31901 ] [ 03d54a5f927e54692db8189e9d5cc097161ca0797a2c6de02a586bc242245595c6 ]",
                    "sequence" : 4294967295
                }
            ],
            "lock_time" : "0",
            "outputs" :
            [
                {
                    "address" : "MCy2N6BSrBZ9f2X1GS5KYrvvKLTVzvZCDg",
                    "attachment" :
                    {
                        "address" : "MCy2N6BSrBZ9f2X1GS5KYrvvKLTVzvZCDg",
                        "decimal_number" : 2,
                        "description" : "test asset",
                        "issuer" : "testdid",
                        "quantity" : 1000000,
                        "secondaryissue_threshold" : 30,
                        "symbol" : "A1",
                        "type" : "asset-issue"
                    },
                    "index" : 0,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 3793b996225ea166d25fe2cd684c08f9433e03db ] equalverify checksig",
                    "value" : 0
                },
                {
                    "address" : "MCy2N6BSrBZ9f2X1GS5KYrvvKLTVzvZCDg",
                    "attachment" :
                    {
                        "address" : "MCy2N6BSrBZ9f2X1GS5KYrvvKLTVzvZCDg",
                        "cert" : "ISSUE",
                        "owner" : "testdid",
                        "symbol" : "A1",
                        "type" : "asset-cert"
                    },
                    "index" : 1,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 3793b996225ea166d25fe2cd684c08f9433e03db ] equalverify checksig",
                    "value" : 0
                },
                {
                    "address" : "MCy2N6BSrBZ9f2X1GS5KYrvvKLTVzvZCDg",
                    "attachment" :
                    {
                        "address" : "MCy2N6BSrBZ9f2X1GS5KYrvvKLTVzvZCDg",
                        "cert" : "DOMAIN",
                        "owner" : "testdid",
                        "symbol" : "A1",
                        "type" : "asset-cert"
                    },
                    "index" : 2,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 3793b996225ea166d25fe2cd684c08f9433e03db ] equalverify checksig",
                    "value" : 0
                },
                {
                    "address" : "MJEadcaE7LjEJcBSyjLecbst7snx7T94DH",
                    "attachment" :
                    {
                        "type" : "etp"
                    },
                    "index" : 3,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 715d876ae984a3127fe5f9d80f481eb77513f9b6 ] equalverify checksig",
                    "value" : 200000000
                }
            ],
            "version" : "3"
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
curl -X POST --data '{"id":125, "jsonrpc":"2.0", "method":"secondaryissue", "params":["test1", "passwd1", "testdid", "A1", "2000012"]}' 127.0.0.1:8820/rpc/v2

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
                        "issuer" : "testdid",
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
                        "cert" : "ISSUE",
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
