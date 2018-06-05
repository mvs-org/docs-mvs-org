title: Transfer MIT
comments: false
---

## Precondition
This is mainly about register MIT command line operation, and other commands can be referred to [Command-line](command-line.html).

First, you need an account and a did. You can use `"mvs-cli getnewaccount accountname password"` and `"mvs-cli issuedid accountname password address did"` to generate a new account and a new did.

**For convenience, I'll uniformly use `Alice` as account name, `passwd1` as password, `Alice` as did, and use `testing addresses` in the following examples. When you refer to the following examples, please change to your account name, password and did, and pay attention to the correct addresses.**

With an account, if you want to `issue` or `send` an asset, you have to make sure that there is enough ETP in the account to pay fees. You can use `"mvs-cli getbalance account_name password"` to get the total balance of the account. You can also use `"mvs-cli listbalances account_name password"` to list the balance of each address in the account.

You can use `help` to get the help information of each command. For eaxmple, use `"mvs-cli help registermit"` or `"mvs-cli registermit -h"` to get the help information of `registermit` command.

## Transfer MIT
Command: `transfermit`

```bash
Usage:
mvs-cli transfermit [-h] [--fee value] ACCOUNTNAME ACCOUNTAUTH    
TODID SYMBOL     

Options (named):
-h [--help]          Get a description and instructions for this command.
-f [--fee]           The fee of tx. default_value 0.0001 etp.

Arguments (positional):
ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
TODID                To DID required, multi-sign DID is supported.
SYMBOL               MIT identifier required.
```

Example：Account `Alice` transfers `MIT` named `Alice@MIT` to DID `Bob`
```bash
Command：
$ ./mvs-cli transfermit Alice passwd1 Bob Alice@MIT

Output：
{
	"transaction" : 
	{
		"hash" : "4fe272acccf0dae96ca71fc34350bbc425588725ef9224b23447cca57b86be60",
		"inputs" : 
		[
			{
				"address" : "MH257NnjBJZNAy258c4bjVVkFB8phMFqtY",
				"previous_output" : 
				{
					"hash" : "6e34003a72537c7f0f8802c962ecb6c6660a581bfd34ba9e4e1132492b5cdd80",
					"index" : 0
				},
				"script" : "[ 304402203b281aed68b352d07fec303ac8baef47c4020edbeaa5a35ba146ba33d2e9c54c02202fb08aa2c1f3c0dda914a3c4f1630bbd795686690bec955475fef39283c78d2f01 ] [ 030848a4429c900e09159b39993e3edf6df1a4302d28d3a2af78a343042d7a8b5e ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
				"previous_output" : 
				{
					"hash" : "9d52158296a9e33b49dcd0f9ceee26c8f2356f1486dc0d9a56ea49a1dd0d97e3",
					"index" : 0
				},
				"script" : "[ 304402200b8c33403b6cd72e086ebea2335812351fcb268421dffb9322f6e133518c393602202376aa29f4803150ed60a86984a0956e299f15a53f698bfcedd484ba2f722c1a01 ] [ 039497a1b7e0dbc762fbd389d8b1ac3215782758c753c521fc4e40914f8e14d5e8 ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "MFj3WGtCxWT2BJZSJUJ9N9A3hKqCoaehaX",
				"attachment" : 
				{
					"address" : "MFj3WGtCxWT2BJZSJUJ9N9A3hKqCoaehaX",
					"from_did" : "",
					"status" : "transfered",
					"symbol" : "Alice@MIT",
					"to_did" : "Bob",
					"type" : "mit"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 55d73b3c20a6dd7391426624d4a7a697ed5c27cc ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MH257NnjBJZNAy258c4bjVVkFB8phMFqtY",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 6407c4bae99d9784c60ab5c991fb3e7fe20ad647 ] equalverify checksig",
				"value" : 299990000
			}
		],
		"version" : "4"
	}
}
```
