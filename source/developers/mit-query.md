title: Query MIT
---

## Precondition
This is mainly about register MIT command line operation, and other commands can be referred to [Command-line](command-line.html).

First, you need an account and a did. You can use `"mvs-cli getnewaccount accountname password"` and `"mvs-cli issuedid accountname password address did"` to generate a new account and a new did.

**For convenience, I'll uniformly use `Alice` as account name, `passwd1` as password, `Alice` as did, and use `testing addresses` in the following examples. When you refer to the following examples, please change to your account name, password and did, and pay attention to the correct addresses.**

With an account, if you want to `issue` or `send` an asset, you have to make sure that there is enough ETP in the account to pay fees. You can use `"mvs-cli getbalance account_name password"` to get the total balance of the account. You can also use `"mvs-cli listbalances account_name password"` to list the balance of each address in the account.

You can use `help` to get the help information of each command. For eaxmple, use `"mvs-cli help registermit"` or `"mvs-cli registermit -h"` to get the help information of `registermit` command.

## Query with listmits
Command: `listmits`, query all registered `MIT` on blockchain or unspent `MIT` of spcified account。
```bash
Usage:
mvs-cli listmits [-h] [ACCOUNTNAME] [ACCOUNTAUTH]   

Options (named):
-h [--help]          Get a description and instructions for this command.

Arguments (positional):
ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
**Note: If account name and password is specified, then query unspent `MIT` of spcified account.**

1. Example: query all registered `MIT` on blockchain：
```bash
Command: 
$ ./mvs-cli listmits

Output: 
{
	"mits" : 
	[
		{
			"address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
			"content" : "Alice's MIT",
			"height" : 3692,
			"status" : "registered",
			"symbol" : "Alice@MIT",
			"time_stamp" : 1528182825,
			"to_did" : "Alice"
		}
	]
}
```

2. Example: query unspent `MIT` of account `Bob`：
```bash
Command: 
$ ./mvs-cli listmits Bob passwd1

Output: 
{
	"mits" : 
	[
		{
			"address" : "MFj3WGtCxWT2BJZSJUJ9N9A3hKqCoaehaX",
			"content" : "Alice's MIT",
			"status" : "transfered",
			"symbol" : "Alice@MIT"
		}
	]
}
```


## Query with getmit
Command: `getmit`, query all MIT identifiers on blockchain or registration of the specified MIT or history of the specified MIT.

```bash
Usage:
mvs-cli getmit [-ht] [--index value] [--limit value] [SYMBOL]   

Options (named):
-h [--help]          Get a description and instructions for this command.
-t [--trace]         Tracing history.
-i [--index]         Page index.
-l [--limit]         MIT count per page.

Arguments (positional):
SYMBOL               MIT identifier.
```

1. Example: query all MIT identifiers on blockchain:
```bash
Command: 
$ ./mvs-cli getmit

Output: 
{
	"mits" : 
	[
		"Alice@MIT"
	]
}
```

2. Example: query registration of `MIT` named `Alice@MIT`:
```bash
Command: 
$ ./mvs-cli getmit Alice@MIT

Output: 
{
	"address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
	"content" : "Alice's MIT",
	"height" : 3692,
	"status" : "registered",
	"symbol" : "Alice@MIT",
	"time_stamp" : 1528182825,
	"to_did" : "Alice"
}
```

3. Example: query history of `MIT` named `Alice@MIT`:
```bash
Command: 
$ ./mvs-cli getmit Alice@MIT -t

Output: 
{
	"mits" : 
	[
		{
			"address" : "MFj3WGtCxWT2BJZSJUJ9N9A3hKqCoaehaX",
			"height" : 7090,
			"status" : "transfered",
			"symbol" : "Alice@MIT",
			"time_stamp" : 1528183391,
			"to_did" : "Bob"
		},
		{
			"address" : "MJevGQHGwKQGNpeJF1vDxBawxKoRZMqsRz",
			"height" : 3692,
			"status" : "registered",
			"symbol" : "Alice@MIT",
			"time_stamp" : 1528182825,
			"to_did" : "Alice"
		}
	]
}
```
