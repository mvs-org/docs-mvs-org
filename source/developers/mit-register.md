title: Register MIT
---

## Precondition
This is mainly about register MIT command line operation, and other commands can be referred to [Command-line](command-line.html).

First, you need an account and a did. You can use `"mvs-cli getnewaccount accountname password"` and `"mvs-cli issuedid accountname password address did"` to generate a new account and a new did.

**For convenience, I'll uniformly use `Alice` as account name, `passwd1` as password, `Alice` as did, and use `testing addresses` in the following examples. When you refer to the following examples, please change to your account name, password and did, and pay attention to the correct addresses.**

With an account, if you want to `issue` or `send` an asset, you have to make sure that there is enough ETP in the account to pay fees. You can use `"mvs-cli getbalance account_name password"` to get the total balance of the account. You can also use `"mvs-cli listbalances account_name password"` to list the balance of each address in the account.

You can use `help` to get the help information of each command. For eaxmple, use `"mvs-cli help registermit"` or `"mvs-cli registermit -h"` to get the help information of `registermit` command.

## Register MIT
Command: `registermit`

```bash
Usage:
mvs-cli registermit [-h] [--content value] [--fee value]          
ACCOUNTNAME ACCOUNTAUTH TODID SYMBOL     

Options (named):
-h [--help]          Get a description and instructions for this command.
-c [--content]       The content of MIT, default is empty.
-f [--fee]           The fee of tx. default_value 0.0001 etp.

Arguments (positional):
ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
TODID                To DID required.
SYMBOL               MIT identifier required.
```
**Note：The max length of SYMBOL is 60, case insensitive, only numbers, letters and `.`、`-`、`_`、`@` are allowed. The max length of content is 256. MIT identifier is unique on blockchain.**

Example：Account `Alice` registers `MIT` named `Alice@MIT` to DID `Alice`。
```bash
Command：
$ ./mvs-cli registermit Alice passwd1 Alice Alice@MIT -c "Alice's MIT"

Output：
{
	"transaction" : 
	{
		"hash" : "d48a0a03cce8b41dd9a3d38ca930cab20ce849f9c952ae996c3e82d5d8b18c8f",
		"inputs" : 
		[
			{
				"address" : "MUipcgtbBZVCn1n45SaCfK62YBrvkjWe7J",
				"previous_output" : 
				{
					"hash" : "4d5b2cce79e0e684dbc4e910957c201cc05cfe0e4495ab9ae527c29b9c74b6af",
					"index" : 1
				},
				"script" : "[ 304402202da2f8c3ce9619f5ac20402082ab7ae4d3437ea200c36994eccf5f99e008bb89022015e4c79eb7ee23fb19bca8427ca656fd64f65457fe38dac9eb569420b5375acd01 ] [ 025ba481942947bd28613ac58a4ce7fae897e14ef113aca8b4dd76cd0fa2de0558 ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "MUipcgtbBZVCn1n45SaCfK62YBrvkjWe7J",
				"attachment" : 
				{
					"address" : "MUipcgtbBZVCn1n45SaCfK62YBrvkjWe7J",
					"content" : "Alice's MIT",
					"from_did" : "Alice",
					"status" : "registered",
					"symbol" : "Alice@MIT",
					"to_did" : "Alice",
					"type" : "mit"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ e4661b6687395fda26767695c7217fd5b2c4707f ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MUipcgtbBZVCn1n45SaCfK62YBrvkjWe7J",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ e4661b6687395fda26767695c7217fd5b2c4707f ] equalverify checksig",
				"value" : 199990000
			}
		],
		"version" : "4"
	}
}
```
