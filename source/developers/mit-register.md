title: Register MIT
comments: false
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
-m [--mits]          List of symbol and content pair. Symbol and content are separated by a ':'.
-f [--fee]           The fee of tx. default_value 0.0001 etp.

Arguments (positional):
ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
TODID                To DID required.
SYMBOL               MIT identifier required.
```
**Note：**  
1. The max length of SYMBOL is 60, case insensitive, only numbers, letters and `.`、`-`、`_`、`@` are allowed. The max length of content is 256. MIT identifier is unique on blockchain.  
2. The maximum size of list of symbol and content pair is 100. Symbol and content are separated by a ':'.

Example： 
1. Account `Alice` registers `MIT` named `Alice@MIT` to DID `Alice`。
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
2. Account `Alice` registers three `MITs` to DID `Alice`: `BATCH_01@MIT` and `BATCH_02@MIT` with unified content, `BATCH_03@MIT` with customized content.  
```bash
Command：
$ ./mvs-cli registermit Alice passwd1 Alice -c "unified content of batch registerring mit." -m "BATCH_01@MIT" -m "BATCH_02@MIT" -m "BATCH_03@MIT:customized content."

Output：
{
    "id" : 25,
    "jsonrpc" : "2.0",
    "result" :
    {
        "transaction" :
        {
            "hash" : "67c520b7f0b514986c645f35bf116607e6de4cddb3051d38a1ead1228a5009cf",
            "inputs" :
            [
                {
                    "address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
                    "previous_output" :
                    {
                        "hash" : "94018aff4d4c9c5732486d3108b85e15e59982b65d0ac8964582ed3a2ddfb7ac",
                        "index" : 2
                    },
                    "script" : "[ 304402201fd9b8068df744a02b6e4995c86827e24a126781b81a2598e93401fe3349ab9d02200cf4d3f4b262ca37b6aefef9b8ea9c1759f27cf44cc573688d579b06d7143cd701 ] [ 0351404c07aba6fe1fc78e4bc1a97a9b6f293b0909f1f4ea4eb0ef1b5bca4bf4af ]",
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
                        "content" : "unified content of batch registerring mit.",
                        "from_did" : "Alice",
                        "status" : "registered",
                        "symbol" : "BATCH_01@MIT",
                        "to_did" : "Alice",
                        "type" : "mit"
                    },
                    "index" : 0,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ b5eb75b67ccc47363ea623a3c73b2d23c9dd801a ] equalverify checksig",
                    "value" : 0
                },
                {
                    "address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
                    "attachment" :
                    {
                        "address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
                        "content" : "unified content of batch registerring mit.",
                        "from_did" : "Alice",
                        "status" : "registered",
                        "symbol" : "BATCH_02@MIT",
                        "to_did" : "Alice",
                        "type" : "mit"
                    },
                    "index" : 1,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ b5eb75b67ccc47363ea623a3c73b2d23c9dd801a ] equalverify checksig",
                    "value" : 0
                },
                {
                    "address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
                    "attachment" :
                    {
                        "address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
                        "content" : "customized content.",
                        "from_did" : "Alice",
                        "status" : "registered",
                        "symbol" : "BATCH_03@MIT",
                        "to_did" : "Alice",
                        "type" : "mit"
                    },
                    "index" : 2,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ b5eb75b67ccc47363ea623a3c73b2d23c9dd801a ] equalverify checksig",
                    "value" : 0
                },
                {
                    "address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
                    "attachment" :
                    {
                        "type" : "etp"
                    },
                    "index" : 3,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ b5eb75b67ccc47363ea623a3c73b2d23c9dd801a ] equalverify checksig",
                    "value" : 199980000
                }
            ],
            "version" : "4"
        }
    }
}
```
