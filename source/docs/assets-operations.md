title: assets operations
comments: false
---


## Precondition

This is mainly about the asset - related command line operation, and other commands can be referred to [Command-line](command-line.html).

First, you need an account. You can use `"mvs-cli getgetnewaccount accountname passwd"` to generate a new account. **Please save the main private key (mnemonic-key) safely**。

**For convenience, I'll uniformly use `test1` as account name, `passwd1` as password, and use `testing addresses` in the following examples. When you refer to the following examples, please change to your account name and password, and pay attention to the correct addresses.**

With an account, if you want to `issue` or `send` an asset, you have to make sure that there is enough ETP in the account to pay fees. You can use `"mvs-cli getbalance test1 passwd1"` to get the details of total balance of the account. You can also use `"mvs-cli listbalances test1 passwd1"` to check the balance at each address in the account.

You can use `help` to get help information of each command. For eaxmple, use `"mvs-cli help createasset"` or `"mvs-cli createasset -h"` to get help information of `createasset` command.

## Create Asset
`createasset`

```bash
Usage:
mvs-cli createasset [-h] --symbol value --volume value
[--description value] [--issuer value] [--decimalnumber value]
ACCOUNTNAME ACCOUNTAUTH

Options:
-h [--help]          Get a description and instructions for this command.
-d [--description]   The asset description, defaults to empty。
-i [--issuer]        The asset issuer, defaults to account name.
-n [--decimalnumber] The asset amount decimal number, defaults to 0.
-s [--symbol]        The asset symbol/name. Global unique.
-v [--volume]        The asset maximum supply volume.

Arguments (positional):
ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.

Example：
$ mvs-cli createasset --symbol MVS.TST --volume 10000 --description "testing asset of MVS" --issuer test1 --decimalnumber 8 test1 passwd1
```
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
It need 4 parameters: account_name, account_passwd, target_address, asset_symbol
```bash
# the fee will pay from target_address
$ mvs-cli issuefrom test1 passwd1 MKWjVNAGSDjhQmUW9VUwcBNGTscYozNopJ MVS.TST
```
Both of the above two commands can use `--fee integer_value` to specify fees. The default fee of issuing asset is 10 ETP. The more the fee is, the time for confirmation may be more shorter, as the miners are more willing to put your transaction into their blocks. Generally, the default values is suggested.

## Send Asset
**Notice: Asset can only be sent after it's inssued**

`sendasset` --
It need 5 parameters: account_name, account_passwd, target_address, asset_symbol, send_amount
```bash
$ mvs-cli sendasset test1 passwd1 MQTAjXoteFzzZoWpNEamG88gf5b82z6o9Q MVS.TST 100
```
`sendassetfrom` --
It need 6 parameters: account_name, account_passwd, from_address, target_address, asset_symbol, send_amount
```bash
$ mvs-cli sendassetfrom test1 passwd1 MKWjVNAGSDjhQmUW9VUwcBNGTscYozNopJ MQTAjXoteFzzZoWpNEamG88gf5b82z6o9Q MVS.TST 900
```
Both of the above two commands can use `--fee integer_value` to specify fees. The default fee of sending asset is 10000 ETP **bits**, that is 0.0001 ETP. The more the fee is, the time for confirmation may be more shorter, as the miners are more willing to put your transaction into their blocks. Generally, the default values is suggested.
