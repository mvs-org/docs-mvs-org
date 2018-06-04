title: Transfer MIT
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
TODID                To DID required.
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
		"hash" : "97f18446040831a1e51ac38d93064cdc1001aca16d4eb852c61c1f5ed602f78c",
		"inputs" : 
		[
			{
				"address" : "MANkcAf1RAwEMCNvD3byoh596JraAi3eZC",
				"previous_output" : 
				{
					"hash" : "c09ea5ef791534014fad5256e33681ade13df5892a8e5d3844b927bbb3c62b3f",
					"index" : 0
				},
				"script" : "[ 30450221008a9fca6fc0e7d42cd0df00ab87a1cedc19b22add25ea106698ab3d839cb31db802201892c5bf55d2cbbe663f893c92a862c5c065b3f532ea47e5380427627b3ebaf001 ] [ 03b714ee6fa096be717f68775e507fc87579aaca5eaf7e0393671563a5ff8ea0b2 ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MUipcgtbBZVCn1n45SaCfK62YBrvkjWe7J",
				"previous_output" : 
				{
					"hash" : "d48a0a03cce8b41dd9a3d38ca930cab20ce849f9c952ae996c3e82d5d8b18c8f",
					"index" : 0
				},
				"script" : "[ 30440220282bb15403338b736ff8e871528caf88528d7f9b77f72cb953489b94436e86b902204e2be80df47678187badef8577e699a615f865891ff5a00635a70141ccdb3b3701 ] [ 025ba481942947bd28613ac58a4ce7fae897e14ef113aca8b4dd76cd0fa2de0558 ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "M9cFfg7xrv1kBvxBp93QVWhNxBYxE8g7Tk",
				"attachment" : 
				{
					"address" : "M9cFfg7xrv1kBvxBp93QVWhNxBYxE8g7Tk",
					"from_did" : "Alice",
					"status" : "transfered",
					"symbol" : "Alice@MIT",
					"to_did" : "Bob",
					"type" : "mit"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 12bdb7a3ddf892797e8787e300ddf0413977726c ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MANkcAf1RAwEMCNvD3byoh596JraAi3eZC",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 1b282d5a09f00a957cdcb090491b00a4fc0ebb59 ] equalverify checksig",
				"value" : 299990000
			}
		],
		"version" : "4"
	}
}
```
