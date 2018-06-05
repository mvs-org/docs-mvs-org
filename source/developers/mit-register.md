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
		"hash" : "9d52158296a9e33b49dcd0f9ceee26c8f2356f1486dc0d9a56ea49a1dd0d97e3",
		"inputs" : 
		[
			{
				"address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
				"previous_output" : 
				{
					"hash" : "bce39df08273418f93d594185f23273225ae5aadfe6bd54ea4f7bbae50a61ea2",
					"index" : 1
				},
				"script" : "[ 304402201f0d5f9c5c4d3de0db3ea80f3ae356558f76dfddc124c10eceb6523d2255b075022001f788e0a008b002c6bc9a31e2c945f9bbed4e6ba7def1f5c867e29f01d362c001 ] [ 039497a1b7e0dbc762fbd389d8b1ac3215782758c753c521fc4e40914f8e14d5e8 ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
				"attachment" : 
				{
					"address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
					"content" : "Alice's MIT",
					"from_did" : "Alice",
					"status" : "registered",
					"symbol" : "Alice@MIT",
					"to_did" : "Alice",
					"type" : "mit"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 75f7e6e4b14d0aaa72a96bd5751070e7b7f813fb ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 75f7e6e4b14d0aaa72a96bd5751070e7b7f813fb ] equalverify checksig",
				"value" : 199990000
			}
		],
		"version" : "4"
	}
}
```
