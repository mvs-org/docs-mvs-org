title: MST Issuance
---

## Precondition

This is mainly about asset issuance related command line operation, and other commands can be referred to [Command-line](command-line.html).

First, you need an account and a did. You can use `"mvs-cli getnewaccount accountname password"` and `"mvs-cli issuedid accountname password address did"` to generate a new account and a new did. **Please save the main private key (mnemonic-key) safely**。

For convenience, I'll uniformly use `test1` as account name, `passwd1` as password, `testdid` as did, and use `testing addresses` in the following examples. When you refer to the following examples, please change to your account name, password and did, and pay attention to the correct addresses.

With an account, if you want to `issue` or `send` an asset, you have to make sure that there is enough ETP in the account to pay fees. You can use `"mvs-cli getbalance test1 passwd1"` to get the total balance of the account. You can also use `"mvs-cli listbalances test1 passwd1"` to list the balance of each address in the account.

You can use `help` to get the help information of each command. For eaxmple, use `"mvs-cli help createasset"` or `"mvs-cli createasset -h"` to get the help information of `createasset` command.

## Introduction
Before you issue an asset, you need to create it and set its properties. If an asset is issued, it can not be delete anymore. But you can delete the asset which is created and not issued yet by command `deletelocalasset`.

## Create Asset
Create an asset by command `createasset`.  
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
```

Example：
```
$ mvs-cli createasset --symbol MVS.TST --volume 1000000000000 --description "testing asset of MVS" --issuer testdid --decimalnumber 8 --rate 30 test1 passwd1
```

## Issue Asset
`issue` --
It needs the following paramenters: account_name, account_passwd, asset_symbol. `issue` command can use `--fee integer_value` to specify fees. The default fee of issuing asset is 10 ETPs. The more the fee is, the time for confirmation may be more shorter, as the miners are more willing to put your transaction into their blocks. Generally, the default values is suggested.  

**Notice: You can not issue the same asset more than once, otherwise an error "validate transaction failure" will throw.**

Example：
```bash
$ mvs-cli issue test1 passwd1 MVS.TST
```

**Added in nova (v0.8.0):**  
You can use `-m [--model]` option to set attenuation model param
Please refer to [MST Conditional Offering](/developers/da-attenuation.html) to learn more about attenuation model.
