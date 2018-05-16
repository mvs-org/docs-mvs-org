title: Metaverse Smart Token(MST) usage
comments: false
---


## Precondition

This is mainly about the asset - related command line operation, and other commands can be referred to [Command-line](command-line.html).

First, you need an account and a did. You can use `"mvs-cli getnewaccount accountname password"` and `"mvs-cli issuedid accountname password address did"` to generate a new account and a new did. **Please save the main private key (mnemonic-key) safely**。

**For convenience, I'll uniformly use `test1` as account name, `passwd1` as password, `testdid` as did, and use `testing addresses` in the following examples. When you refer to the following examples, please change to your account name, password and did, and pay attention to the correct addresses.**

With an account, if you want to `issue` or `send` an asset, you have to make sure that there is enough ETP in the account to pay fees. You can use `"mvs-cli getbalance test1 passwd1"` to get the total balance of the account. You can also use `"mvs-cli listbalances test1 passwd1"` to list the balance of each address in the account.

You can use `help` to get the help information of each command. For eaxmple, use `"mvs-cli help createasset"` or `"mvs-cli createasset -h"` to get the help information of `createasset` command.

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
$ mvs-cli createasset --symbol MVS.TST --volume 1000000000000 --description "testing asset of MVS" --issuer testdid --decimalnumber 8 --rate 30 test1 passwd1
```
**Notice: "-r [--rate]" parameter is newly added (in v0.8.0), used for secondaryissue command**

**Notice: decimal number is very important.**
From a developer's point of view, it's function is to remove the floating-point number in the transaction, use integers to improve the efficiency and precision.
From an ordinary user's point of view, it's function is to set the minimum trading unit. For example, when the decimal digit is 8, the smallest unit is `satoshi`. At this time, the values used in the command are with the unit of `satoshi`.
When decimal digits are other values, the situation is similar. If you don't feel well with this, you can use the default value of 0.

## List / Get Asset
There are several states of assets: `"unissued"`，`"issued"`，`"unspent"`.

`getaccountasset` --
Get assets of specified account, including unissued asset. The result contains the address of the asset.
```bash
$ mvs-cli getaccountasset test1 passwd1
```

`listassets` --
List Assets.
```bash
# List all **issued** assets.
$ mvs-cli listassets

# List assets of specified account, including unissued asset. The result does not contain the address of the asset.
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
Get **issued** assets of address
```bash
$ mvs-cli getaddressasset MKWjVNAGSDjhQmUW9VUwcBNGTscYozNopJ
```

<code>listassets</code>, <code>getasset</code>, <code>getaddressasset</code> and <code>getaccountasset</code> have a `--cert` option to get the asset cert.

## Delete Local Asset(unissued asset)
`deletelocalasset` --
Delete local asset which is unissued. **Notice: You can not delete issued asset.**
```bash
# create a local asset temporarily, and then delete it
$ mvs-cli createasset --symbol MVS.TST2 --volume 10000 --description "temp testing asset of MVS" --issuer testdid --decimalnumber 0 test1 passwd1
$ mvs-cli deletelocalasset --symbol MVS.TST2 test1 passwd1
```

## Issue Asset
**Notice: You can not issue the same asset more than once, otherwise an error "validate transaction failure" will throw.**

`issue` --
It needs the following paramenters: account_name, account_passwd, asset_symbol
```bash
$ mvs-cli issue test1 passwd1 MVS.TST
```
<code>issue</code> command can use `--fee integer_value` to specify fees. The default fee of issuing asset is 10 ETP. The more the fee is, the time for confirmation may be more shorter, as the miners are more willing to put your transaction into their blocks. Generally, the default values is suggested.

**add in nova (v0.8.0):**
1. you can use `-m [--model]` option to set attenuation model param
Ref. to [About attenuation model](#About-attenuation-model) to learn more about attenuation model.
2. you can use `secondaryissue` command to secondary issue the asset
Ref. to [secondaryissue](#secondaryissue) to learn more about secondaryissue.

## Send Asset
**Notice: Asset can only be sent after it's inssued**

`sendasset` --
It needs the following paramenters: account_name, account_passwd, to_address, asset_symbol, send_amount
```bash
$ mvs-cli sendasset test1 passwd1 MQTAjXoteFzzZoWpNEamG88gf5b82z6o9Q MVS.TST 100
```

`sendassetfrom` --
It needs the following paramenters: account_name, account_passwd, from_address, to_address, asset_symbol, send_amount
```bash
$ mvs-cli sendassetfrom test1 passwd1 MKWjVNAGSDjhQmUW9VUwcBNGTscYozNopJ MQTAjXoteFzzZoWpNEamG88gf5b82z6o9Q MVS.TST 900
```
Both of the above two commands can use `--fee integer_value` to specify fees. The default fee of sending asset is 10000 ETP **bits**, that is 0.0001 ETP. The more the fee is, the time for confirmation may be more shorter, as the miners are more willing to put your transaction into their blocks. Generally, the default values is suggested.

## transfer cert
`transfercert`
It needs the following paramenters: account_name, account_passwd, to_did, asset_symbol, cert_type_name
```bash
$ mvs-cli transfercert test1 passwd1 testdid KOK ISSUE
```
"ISSUE", "DOMAIN" and "NAMING" cert type names are supported now。

## issue cert
`issuecert`
It needs the following paramenters: account_name, account_passwd, to_did, asset_symbol, cert_type
```bash
$ mvs-cli issuecert test1 passwd1 testdid KOK.MUSIC -c NAMING
```
Only "NAMING" cert type is supported now。

***
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
Usage: mvs-cli getaccountasset [-h] [--c] ACCOUNTNAME ACCOUNTAUTH [SYMBOL]

Info: getaccountasset

Options (named):

-h [--help]          Get a description and instructions for this command.
-c [--cert]          If specified, then only get related asset cert.
                     Default is not specified.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
SYMBOL               Asset symbol.
```
**NOTICE: --cert is newly added option (in v0.8.0) which does not take any arguments.**
**NOTICE: if SYMBOL is not specified, then get all assets or certs of this account.**
**to each asset, the returned quantity is a summary value on each address.**
**the unissued asset of this account will also be showed.**

***
### getaddressasset
```
Usage: mvs-cli getaddressasset [-h] [--c] ADDRESS

Info: getaddressasset

Options (named):

-h [--help]          Get a description and instructions for this command.
-c [--cert]          If specified, then only get related asset cert.
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
Usage: mvs-cli listassets [-h] [--c] [ACCOUNTNAME] [ACCOUNTAUTH]

Info: list assets details.

Options (named):

-h [--help]          Get a description and instructions for this command.
-c [--cert]          If specified, then only get related asset cert.
                     Default is not specified.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
**NOTICE: --cert is newly added option (in v0.8.0) which does not take any arguments.**
**NOTICE: if not specify account, list all issued assets or certs.**
**if account specified, list all assets or certs of this account, includes unissued assets,**
**and summary quantity on all addresses for each asset.**

***
### getasset
```
Usage: mvs-cli getasset [-h] [--c] [SYMBOL]

Info: Show existed assets details from MVS blockchain.

Options (named):

-h [--help]          Get a description and instructions for this command.
-c [--cert]          If specified, then only get related asset cert.
                     Default is not specified.

Arguments (positional):

SYMBOL               Asset symbol. If not specified, will show whole
                     network asset symbols.
```
**NOTICE: --cert is newly added option (in v0.8.0) which does not take any arguments.**

***
### issue
```
Usage: mvs-cli issue [-h] [--fee value] ACCOUNTNAME ACCOUNTAUTH SYMBOL

Info: issue

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           The fee of tx. default_value 10 etp
-m [--model]         The asset attenuation model parameter, defaults to
                     empty string.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
SYMBOL               issued asset symbol
```
**NOTICE: the asset is issued to the address of asset issuer.**
**every asset can only be issued once, and with symbol not already exists in blockchain.**
**when issue asset, the corresponding asset ISSUE cert will be generated.**
**if the DIMAIN cert does not exist in blockchain, then DIMAIN cert will be generated too.**

Ref. to [About attenuation model](#About-attenuation-model) to learn more about attenuation model.

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
### issuecert
```
Usage: mvs-cli issuecert [-h] [--fee value] ACCOUNTNAME
ACCOUNTAUTH TODID SYMBOL CERT

Info: issuecert

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           Transaction fee. defaults to 10000 ETP bits

Arguments (positional)

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
TODID                Target did
SYMBOL               Asset cert symbol
CERT                 Asset cert type name, "NAMING" is supported now.
```

***
### transfercert
```
Usage: mvs-cli transfercert [-h] [--fee value] ACCOUNTNAME
ACCOUNTAUTH TODID SYMBOL CERT

Info: transfercert

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           Transaction fee. defaults to 10000 ETP bits

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
TODID                Target did
SYMBOL               Asset cert symbol
CERT                 Asset cert type name. eg. "ISSUE", "DOMAIN" or "NAMING"
```

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
ACCOUNTNAME ACCOUNTAUTH TODID SYMBOL VOLUME

Info: secondaryissue, alias as additionalissue.

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           The fee of tx. default_value 10000 ETP bits
-m [--model]         The asset attenuation model parameter, defaults to
                     empty string.

Arguments (positional):

ACCOUNTNAME          Account name.
ACCOUNTAUTH          Account password/authorization.
TODID                Target did
SYMBOL               issued asset symbol
VOLUME               The volume of asset
```
**NOTICE: issued asset maybe secondaryissue many times.**
Ref. to [About attenuation model](#About-attenuation-model) to learn more about attenuation model.

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
8. Usage
	* How to specify attenuation model param?
		The param is specified in `issue` and `secondaryissue` command, through `-m [--model]` option.
	* How to know the locked asset quantity?
		Through `getaccountasset` and `getaddressasset` command, is the value corresponding to key **"locked_quantity"**.
	* How to know the attenuation model param?
		Through `gettx` and `lsittxs` comand, is the string corresponding to key **"attenuation_model_param"**.
	* How is the locked asset be unlocked?
		The locked asset is unlocked according to the block height. No need to manually unlock them, and it can be spend directly if the locked time interval is passed. And the unlocked quantity is also calulated automatically.

## About asset cert

**it's composed of four parts:**
"symbol" : asset symbol/name.
"address" : asset cert address.
"owner" : owner's did.
"cert" : asset cert type name. Follow cert type names are supported:
> ISSUE: cert of issuing asset, generated by issuing asset and used in secondaryissue asset.
> DOMAIN: cert of domain, generated by issuing asset, the symbol is same as asset symbol(if it does not contain dot) or the prefix part(that before the first dot) of asset symbol.
> NAMING: cert of naming right of domain. The owner of domain cert can issue this type of cert by <code>issuecert</code> with symbol like "DOMAIN.XYZ"(DOMAIN is the symbol of domain cert).

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
    # asset cert types. certs may combine many cert types.
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
## Examples

***
### 1. create new asset
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

### 2. issue asset
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
                        "owner" : "testdid",
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
