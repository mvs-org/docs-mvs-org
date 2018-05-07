title: Metaverse Smart Token(MST) usage
comments: false
---


## Precondition

This is mainly about the asset - related command line operation, and other commands can be referred to [Command-line](command-line.html).

First, you need an account. You can use `"mvs-cli getnewaccount accountname password"` to generate a new account. **Please save the main private key (mnemonic-key) safely**。

**For convenience, I'll uniformly use `test1` as account name, `passwd1` as password, and use `testing addresses` in the following examples. When you refer to the following examples, please change to your account name and password, and pay attention to the correct addresses.**

With an account, if you want to `issue` or `send` an asset, you have to make sure that there is enough ETP in the account to pay fees. You can use `"mvs-cli getbalance test1 passwd1"` to get the details of total balance of the account. You can also use `"mvs-cli listbalances test1 passwd1"` to check the balance at each address in the account.

You can use `help` to get help information of each command. For eaxmple, use `"mvs-cli help createasset"` or `"mvs-cli createasset -h"` to get help information of `createasset` command.

## Create Asset
`createasset` --

```bash
Usage:
mvs-cli createasset [-h] --symbol value --volume value
[--description value] [--issuer value] [--decimalnumber value]
[--rate value] ACCOUNTNAME ACCOUNTAUTH

Info: createasset

Options (named):

-h [--help]          Get a description and instructions for this command.
-d [--description]   The asset description, defaults to empty string.
-i [--issuer]        The asset issuer's did.
-n [--decimalnumber] The asset amount decimal number, defaults to 0.
-r [--rate]          The rate of secondaryissue. Default to 0, means the
                     asset is not allowed to secondary issue forever;
                     otherwise, -1 means the asset can be secondary issue
                     freely; otherwise, the valid rate is in range of 1
                     to 100, means the asset can be secondary issue when
                     own percentage greater than or equal to the rate value.
-s [--symbol]        The asset symbol/name. Global unique.
-v [--volume]        The asset maximum supply volume, with unit of integer bits.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.

Example：
$ mvs-cli createasset --symbol MVS.TST --volume 1000000000000 --description "testing asset of MVS" --issuer test1 --decimalnumber 8 --rate 30 test1 passwd1
```
**Notice: "-r [--rate]" parameter is newly added (in v0.8.0), used for secondaryissue command**

**Notice: decimal number is very important.**
From a developer's point of view, it's function is to remove the floating-point number in the transaction, use integers to improve the efficiency and precision.
From an ordinary user's point of view, it's function is to set the minimum trading unit. For example, when the decimal digit is 8, the smallest unit is `satoshi`. At this time, the values used in the command are with the unit of `satoshi`.
When decimal digits are other values, the situation is similar. If you don't feel well with this, you can use the default value of 0.

## List / Get Asset
There are several states of assets: `"unissued"`，`"issued"`，`"unspent"`.

`getaccountasset` --
Get asset by account, including unissued asset. The result contains address of the asset.
```bash
$ mvs-cli getaccountasset test1 passwd1
```
`listassets` --
List Assets.
```bash
# List all **issued** assets.
$ mvs-cli listassets

# List assets of specified account, including unissued asset. The result does not contain address of the asset.
$ mvs-cli listassets test1 passwd1
```
`getasset` --
Get **issued** assets.
```bash
# Get all assets' symbols
$ mvs-cli getasset

# Get asset with specified symbol
$ mvs-cli getasset MVS.TST
```
`getaddressasset` --
Get **issued** assets by address
```bash
$ mvs-cli getaddressasset MKWjVNAGSDjhQmUW9VUwcBNGTscYozNopJ
```

<code>listassets</code>, <code>getasset</code>, <code>getaddressasset</code> and <code>getaccountasset</code> have a `--cert` option to get asset cert.

## Delete Local Asset(unissued asset)
`deletelocalasset` --
Delete local asset which is unissued. **Notice: You can not delete issued asset.**
```bash
# create a local asset temporarily, and then delete it
$ mvs-cli createasset --symbol MVS.TST2 --volume 10000 --description "temp testing asset of MVS" --issuer test1 --decimalnumber 0 test1 passwd1
$ mvs-cli deletelocalasset --symbol MVS.TST2 test1 passwd1
```

## Issue Asset
**Notice: You can not issue the same asset twice, or else an error will report "validate transaction failure"**

`issue` --
It need 3 parameters: account_name, account_passwd, asset_symbol
```bash
$ mvs-cli issue test1 passwd1 MVS.TST
```
`issuefrom` --
It need 4 parameters: account_name, account_passwd, to_address, asset_symbol
```bash
# the fee will pay from to_address
$ mvs-cli issuefrom test1 passwd1 MKWjVNAGSDjhQmUW9VUwcBNGTscYozNopJ MVS.TST
```
Both of the above two commands can use `--fee integer_value` to specify fees. The default fee of issuing asset is 10 ETP. The more the fee is, the time for confirmation may be more shorter, as the miners are more willing to put your transaction into their blocks. Generally, the default values is suggested.

## Send Asset
**Notice: Asset can only be sent after it's inssued**

`sendasset` --
It need 5 parameters: account_name, account_passwd, to_address, asset_symbol, send_amount
```bash
$ mvs-cli sendasset test1 passwd1 MQTAjXoteFzzZoWpNEamG88gf5b82z6o9Q MVS.TST 100
```
`sendassetfrom` --
It need 6 parameters: account_name, account_passwd, from_address, to_address, asset_symbol, send_amount
```bash
$ mvs-cli sendassetfrom test1 passwd1 MKWjVNAGSDjhQmUW9VUwcBNGTscYozNopJ MQTAjXoteFzzZoWpNEamG88gf5b82z6o9Q MVS.TST 900
```
Both of the above two commands can use `--fee integer_value` to specify fees. The default fee of sending asset is 10000 ETP **bits**, that is 0.0001 ETP. The more the fee is, the time for confirmation may be more shorter, as the miners are more willing to put your transaction into their blocks. Generally, the default values is suggested.

## transfer cert
`transfercert`
It need 5 parameters: account_name, account_passwd, to_did, asset_symbol, cert_types
```bash
$ mvs-cli transfercert test1 passwd1 testdid KOK -c ISSUE
$ mvs-cli transfercert test1 passwd1 testdid KOK -c DOMAIN ISSUE
```
Multi cert types should be separeted by white-space. Only "ISSUE", "DOMAIN" and "NAMING" are supported now。

## issue cert
`issuecert`
It need 5 parameters: account_name, account_passwd, to_did, asset_symbol, cert_type
$ mvs-cli issuecert test1 passwd1 testdid KOK.MUSIC -c NAMING
```
Only "NAMING" cert type is supported now。

## Advanced API usage
***
### deletelocalasset
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
### getaccountasset
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
### getaddressasset
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
### listassets
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
### getasset
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
### issue
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
**NOTICE: the asset is issued to the address of asset issuer.**
**every asset can only be issued once, and with symbol not already exists in blockchain.**
**when issue asset, the corresponding asset ISSUE cert will be generated.**
**if the DIMAIN cert does not exist in blockchain, then DIMAIN cert will be generated too.**
***

### issuefrom
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
**when issue asset, the corresponding asset ISSUE cert will be generated.**
**if the DIMAIN cert does not exist in blockchain, then DIMAIN cert will be generated too.**
***

### sendasset
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
### sendassetfrom
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
### listtxs
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
## New APIs (in v0.8.0)
***
### transfercert
```
Usage: mvs-cli transfercert [-h] [--fee value] ACCOUNTNAME
ACCOUNTAUTH FROMADDRESS TOADDRESS SYMBOL -c CERTS

Info: transfercert

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           Transaction fee. defaults to 10000 ETP bits

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
FROMADDRESS          From address, cert and fee come from this address,
                     and mychange to this address too.
TOADDRESS            Target address
SYMBOL               asset symbol
-c [--cert]          asset cert type(s), "ISSUE" and "DOMAIN" are supported now.
```
**NOTICE: multi cert types should be separeted by white-space.**
***
### burn
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
### secondaryissue
```
Usage: mvs-cli secondaryissue [-h] [--fee value]
ACCOUNTNAME ACCOUNTAUTH ADDRESS SYMBOL VOLUME

Info: secondaryissue, alias as additionalissue.

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           The fee of tx. default_value 10000 ETP bits

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

## About asset cert

**it's composed of three parts:**
"certs" : kind of asset cert. It may contain many kinds, now only `ISSUE` and 'DOMAIN' cert are supported. We may add some other cert kinds later soon.
"owner" : asset cert address. Later it may be a DID symbol (not supported at present).
"symbol" : asset symbol/name.
```
$ ./bin/mvs-cli getaccountasset --cert test1 passwd1
{
    "assetcerts" :
    [
        {
            "address" : "M8iiHdPdTyPfyQY8464bDso7b421JqdShE",
            "certs" : 1,
            "owner" : "M8iiHdPdTyPfyQY8464bDso7b421JqdShE",
            "symbol" : "A1"
        }
    ]
}
```
***

## About blackhole address

**1111111111111111111114oLvT2** is the blackhole address,
every ETP/asset etc. sent to this address is unspentable forever.

**NOTICE: burn command can burn asset to this blackhole address.**
**If you use send/sendfrom/sendasset/sendassetfrom/transfercert etc. commands to send things to this blackhole address,**
**this things sent to blackhole address cannot be spent and cannot be get back again, just like burn.**
**So take cake of this blackhole address!!! It begins with many number ones.**
***

## asset attachment/output
_use # comment to explain each key-value pair, these lines is not content of json object._
### issued asset output
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
### asset detail attachment
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
### asset transfer attachment
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
### asset cert attachment
```
{
    # asset cert types. certs may contain many kinds, now only `ISSUE` and 'DOMAIN' cert are provided.
    "certs" : 1,

    # asset cert owner address.
    "owner" : "MH6nu3JA1sdkjWFhcYGx42X9ztvStWWG3S",

    # asset symbol, string length must be <= 64.
    "symbol" : "A1",

    # attachment type.
    "type" : "asset-cert"
}
```
***

## Examples

***
### 1. create new asset
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
### 2. issue asset
```
// Request
curl -X POST --data '{"id":125, "jsonrpc":"2.0", "method":"issuefrom", "params":["test1", "passwd1", "MHNViX5nuAdDTCXeE5Nw9h9t7ku1CWC2eb", "A1"]}' 127.0.0.1:8820/rpc/v2

// Response
{
    "id" : 125,
    "jsonrpc" : "2.0",
    "result" :
    {
        "transaction" :
        {
            "hash" : "1daabbb942c52b402851988dacaeddbc25aeaf10133b17bd62565e4334825fd8",
            "inputs" :
            [
                {
                    "address" : "MMMb1DkhSaSQkL1pvw77SVxuaBFvA8YHHh",
                    "previous_output" :
                    {
                        "hash" : "071cfd9d7d3c330b6664ef9f3d3ec3151daa057bf02f541a8ebfb0fee574985b",
                        "index" : 2
                    },
                    "script" : "[ 3044022019488c8539681c255ae43cce2f0e78370f5eb360c96a78128cb9728326e7b509022026121c23effa382c9c5d282795b28f325b514346b91b9bd8450d3af47bc8e11b01 ] [ 02a63e06ad462669c51787f847412fcb090a05ae55c1a7ef8e488ead6278505fbe ]",
                    "sequence" : 4294967295
                },
                {
                    "address" : "MHNViX5nuAdDTCXeE5Nw9h9t7ku1CWC2eb",
                    "previous_output" :
                    {
                        "hash" : "e4fe52a630b3b2e24a1642d1c7ae122bc66f9183e80f2a795969ab631b37b0cf",
                        "index" : 2
                    },
                    "script" : "[ 30450221009bada65271c4c4b25ea827a1bab9e75487a43df38bd21fb5090727fa53bd4af00220094648827bf813c3bc982746fd6ab6dc3d5ef141b43dfdeaaf8e38ddc0ed5b1201 ] [ 0293ac168be30fd2a866d16538daac435c640d8b22b6865188c463415788dac029 ]",
                    "sequence" : 4294967295
                },
                {
                    "address" : "MHNViX5nuAdDTCXeE5Nw9h9t7ku1CWC2eb",
                    "previous_output" :
                    {
                        "hash" : "01022f2ee29a9829784cac90d75d001f60487e2f83593e8c20023e580dea22ad",
                        "index" : 2
                    },
                    "script" : "[ 30450221009a16bb1538514eee24e8af5afb357aea7f31f551dc74852c42258e88752daaa90220131bf3c5b19df65aa4a4493db530b2bcb5808f395f34fd93a826a0494060fa6d01 ] [ 0293ac168be30fd2a866d16538daac435c640d8b22b6865188c463415788dac029 ]",
                    "sequence" : 4294967295
                }
            ],
            "lock_time" : "0",
            "outputs" :
            [
                {
                    "address" : "MHNViX5nuAdDTCXeE5Nw9h9t7ku1CWC2eb",
                    "attachment" :
                    {
                        "address" : "MHNViX5nuAdDTCXeE5Nw9h9t7ku1CWC2eb",
                        "decimal_number" : 8,
                        "description" : "domain cert test for cert check",
                        "issuer" : "kesalin",
                        "quantity" : 66660000000,
                        "secondaryissue_threshold" : 127,
                        "symbol" : "ZOK.DOMAIN2",
                        "type" : "asset-issue"
                    },
                    "index" : 0,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 67e4a0b0a462ac4453a85b40931f2a789584a7d2 ] equalverify checksig",
                    "value" : 0
                },
                {
                    "address" : "MHNViX5nuAdDTCXeE5Nw9h9t7ku1CWC2eb",
                    "attachment" :
                    {
                        "certs" : 1,
                        "owner" : "MHNViX5nuAdDTCXeE5Nw9h9t7ku1CWC2eb",
                        "symbol" : "ZOK.DOMAIN2",
                        "type" : "asset-cert"
                    },
                    "index" : 1,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 67e4a0b0a462ac4453a85b40931f2a789584a7d2 ] equalverify checksig",
                    "value" : 0
                },
                {
                    "address" : "MHNViX5nuAdDTCXeE5Nw9h9t7ku1CWC2eb",
                    "attachment" :
                    {
                        "type" : "etp"
                    },
                    "index" : 2,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 67e4a0b0a462ac4453a85b40931f2a789584a7d2 ] equalverify checksig",
                    "value" : 28099990000
                },
                {
                    "address" : "MMMb1DkhSaSQkL1pvw77SVxuaBFvA8YHHh",
                    "attachment" :
                    {
                        "certs" : 2,
                        "owner" : "MMMb1DkhSaSQkL1pvw77SVxuaBFvA8YHHh",
                        "symbol" : "ZOK",
                        "type" : "asset-cert"
                    },
                    "index" : 3,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 9399210807786feedf1be4e85b7f0beaea607603 ] equalverify checksig",
                    "value" : 0
                }
            ],
            "version" : "3"
        }
    }
}
```
### 3. burn some asset
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
### 4. secondaryissue asset
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
                        "certs" : "1",
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
