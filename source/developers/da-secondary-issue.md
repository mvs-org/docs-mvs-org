title: MST Secondary Issuance
---

## Precondition
This is mainly about the secondaryissue asset command line operation, and other commands can be referred to [Command-line](command-line.html).

First, you need an account and a did. You can use `"mvs-cli getnewaccount accountname password"` and `"mvs-cli issuedid accountname password address did"` to generate a new account and a new did. **Please save the main private key (mnemonic-key) safely**。

**For convenience, I'll uniformly use `test1` as account name, `passwd1` as password, `testdid` as did, and use `testing addresses` in the following examples. When you refer to the following examples, please change to your account name, password and did, and pay attention to the correct addresses.**

With an account, if you want to `issue` or `send` an asset, you have to make sure that there is enough ETP in the account to pay fees. You can use `"mvs-cli getbalance test1 passwd1"` to get the total balance of the account. You can also use `"mvs-cli listbalances test1 passwd1"` to list the balance of each address in the account.

You can use `help` to get the help information of each command. For eaxmple, use `"mvs-cli help createasset"` or `"mvs-cli createasset -h"` to get the help information of `createasset` command.

### secondaryissue
The account owned secondary issue certificate can secondary issue asset that can be secondary issued.
```
Usage: mvs-cli secondaryissue [-h] [--fee value]
ACCOUNTNAME ACCOUNTAUTH TODID SYMBOL VOLUME

Info: secondaryissue, alias as additionalissue.

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           The fee of tx. default_value 10 etp
-m [--model]         The asset attenuation model parameter, defaults to
                     empty string.

Arguments (positional):

ACCOUNTNAME          Account name.
ACCOUNTAUTH          Account password/authorization.
TODID                Target did to check and issue asset
SYMBOL               The symbol of issued asset
VOLUME               The volume of asset
```

**Notes**
1. issued asset maybe secondaryissue many times.
2. For asset attenuation model, please refer to [MST Conditional Offering](/zh-cn/developers/da-attenuation.html).

secondaryissue must satisfy the folllowing conditions:  
1. consider the transaction fees
    the fees is paid from mychange parameter if specified, or else from searched addresses.
2. consider the threshold
    the target address must have specified name/symbol asset of quantity value greater than or equal to threshold percentage.
3. consider the asset cert
    the target address must have issue asset cert of specified name/symbol asset.

