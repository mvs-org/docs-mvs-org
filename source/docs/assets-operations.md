title: Metaverse Smart Token(MST) usage
comments: false
---


## New MST Features In v0.8.0
0. [MST introduction](https://docs.mvs.org/developers/da-index.html)
1. [New digital asset(MST) features - Issuance](https://docs.mvs.org/developers/da-issue.html)
2. [New digital asset(MST) features - SecondaryIssue](https://docs.mvs.org/developers/da-secondary-issue.html)
3. [New digital asset(MST) features - Conditional Offering](https://docs.mvs.org/developers/da-attenuation.html)
4. [New digital asset(MST) features - Multi-signature](https://docs.mvs.org/developers/da-multi-sig.html)
5. [New digital asset(MST) features - Domain-name And Certification](https://docs.mvs.org/developers/da-certification.html)
6. [New digital asset(MST) features - Burn](https://docs.mvs.org/developers/da-burn.html)

***
The following is the MST features before v0.8.0 and our extensions in v0.8.0 for them.

## Precondition

This is mainly about the asset - related command line operation, and other commands can be referred to [Command-line](command-line.html).

First, you need an account and a did. You can use `"mvs-cli getnewaccount accountname password"` and `"mvs-cli issuedid accountname password address did"` to generate a new account and a new did. **Please save the main private key (mnemonic-key) safely**。

**For convenience, I'll uniformly use `test1` as account name, `passwd1` as password, `testdid` as did, and use `testing addresses` in the following examples. When you refer to the following examples, please change to your account name, password and did, and pay attention to the correct addresses.**

With an account, if you want to `issue` or `send` an asset, you have to make sure that there is enough ETP in the account to pay fees. You can use `"mvs-cli getbalance test1 passwd1"` to get the total balance of the account. You can also use `"mvs-cli listbalances test1 passwd1"` to list the balance of each address in the account.

You can use `help` to get the help information of each command. For eaxmple, use `"mvs-cli help createasset"` or `"mvs-cli createasset -h"` to get the help information of `createasset` command.

## Create Asset
### createasset

```bash
Usage:
mvs-cli createasset [-h] --symbol value --volume value
[--description value] [--issuer value] [--decimalnumber value]
[--rate value] ACCOUNTNAME ACCOUNTAUTH

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
**NOTICE: decimal number is very important.**
From a developer's point of view, it's function is to remove the floating-point number in the transaction, use integers to improve the efficiency and precision.
From an ordinary user's point of view, it's function is to set the minimum trading unit. For example, when the decimal digit is 8, the smallest unit is `satoshi`. At this time, the values used in the command are with the unit of `satoshi`.
When decimal digits are other values, the situation is similar. If you don't feel well with this, you can use the default value of 0.

### add in nova (v0.8.0)
1. `-r [--rate]` parameter is newly added and used for `secondaryissue` validation.
Ref. to [New digital asset(MST) features - SecondaryIssue](https://docs.mvs.org/developers/da-secondary-issue.html) to see more about `secondaryissue`
2. `-i [--issuer]` parameter has new restrict to Digital Identity (Avatar)
Ref. to [Digital Identity (Avatar)](https://docs.mvs.org/developers/di-index.html) to see more about Digital Identity (Avatar)

## List / Get Asset
There are several states of assets: `"unissued"`，`"issued"`，`"unspent"`.

### getaccountasset
Get assets of specified account, including unissued asset. The result contains the address of the asset.
**NOTICE: if SYMBOL is not specified, then get all assets of this account.**
**to each asset, the returned quantity is a summary value on each address.**
**the unissued asset of this account will also be showed.**
```bash
$ mvs-cli getaccountasset test1 passwd1
```

### getaddressasset
Get **issued** assets of address
**NOTICE: only issued asset has address.**
**to each asset, the returned quantity is a summary value on this address.**
```bash
$ mvs-cli getaddressasset MKWjVNAGSDjhQmUW9VUwcBNGTscYozNopJ
```

### listassets
List Assets.
**NOTICE: if not specify account, list all issued assets.**
**if account specified, list all assets of this account, includes unissued assets,**
**and summary quantity on all addresses for each asset.**
```bash
# List all **issued** assets.
$ mvs-cli listassets

# List assets of specified account, including unissued asset. The result does not contain the address of the asset.
$ mvs-cli listassets test1 passwd1
```

### getasset
Get **issued** assets.
```bash
# Get all assets' symbols
$ mvs-cli getasset

# Get asset with specified symbol
$ mvs-cli getasset MVS.TST
```

### add in nova (v0.8.0)
1. `listassets`, `getasset`, `getaddressasset` and `getaccountasset` have a `--cert` option to get the asset cert.

## Delete Local Asset
### deletelocalasset
Delete local asset which is unissued.
**NOTICE: local asset is unissued asset. when issued, it can never be deleted any more.**
```bash
# create a local asset temporarily, and then delete it
$ mvs-cli createasset --symbol MVS.TST2 --volume 10000 --description "temp testing asset of MVS" --issuer testdid --decimalnumber 0 test1 passwd1
$ mvs-cli deletelocalasset --symbol MVS.TST2 test1 passwd1
```

## Issue Asset
### issue
**NOTICE: You can not issue the same asset more than once, otherwise an error "validate transaction failure" will throw.**
**NOTICE: the asset is issued to the address of asset issuer.**
**every asset can only be issued once, and with symbol not already exists in blockchain.**

It needs the following paramenters: account_name, account_passwd, asset_symbol
```bash
$ mvs-cli issue test1 passwd1 MVS.TST
```
`issue` command can use `--fee integer_value` to specify fees. The default fee of issuing asset is 10 ETP. The more the fee is, the time for confirmation may be more shorter, as the miners are more willing to put your transaction into their blocks. Generally, the default values is suggested.

### add in nova (v0.8.0)
1. you can use `-m [--model]` option to set attenuation model param in command `issue`
Ref. to [New digital asset(MST) features - Conditional Offering](https://docs.mvs.org/developers/da-attenuation.html) to learn more about attenuation model.
2. when issue asset, the corresponding asset issue cert will be generated. If the DOMAIN cert does not exist in blockchain, then DOMAIN cert will be generated too.
Ref. to [New digital asset(MST) features - Domain-name And Certification](https://docs.mvs.org/developers/da-certification.html) to see more about cert.

## Send Asset
### sendasset
**NOTICE: Asset can only be sent after it's inssued**

It needs the following paramenters: account_name, account_passwd, to_address, asset_symbol, send_amount
**NOTICE: only receiver address needs to be specified.**
```bash
$ mvs-cli sendasset test1 passwd1 MQTAjXoteFzzZoWpNEamG88gf5b82z6o9Q MVS.TST 100
```

### sendassetfrom
It needs the following paramenters: account_name, account_passwd, from_address, to_address, asset_symbol, send_amount
**NOTICE: the transaction fee is paid from FROMADDRESS.**
```bash
$ mvs-cli sendassetfrom test1 passwd1 MKWjVNAGSDjhQmUW9VUwcBNGTscYozNopJ MQTAjXoteFzzZoWpNEamG88gf5b82z6o9Q MVS.TST 900
```
Both `sendasset` and `sendassetfrom` can use `--fee integer_value` to specify fees. The default fee of sending asset is 10000 ETP **bits**, that is 0.0001 ETP. The more the fee is, the time for confirmation may be more shorter, as the miners are more willing to put your transaction into their blocks. Generally, the default values is suggested.

### add in nova (v0.8.0)
1. you can use `-m [--model]` option to set attenuation model param in command `sendasset` and `sendassetfrom`
Ref. to [New digital asset(MST) features - Conditional Offering](https://docs.mvs.org/developers/da-attenuation.html) to learn more about attenuation model.

