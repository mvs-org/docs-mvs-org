title: Burn Asset
---

# Introduction
User can send asset to a special address called blackhole address(`1111111111111111111114oLvT2`) to burn asset. Assets on blackhole address can not be spent.

# burn
Command：`burn`
```bash
Usage:
mvs-cli burn [-h] ACCOUNTNAME ACCOUNTAUTH SYMBOL AMOUNT   

Options (named):
-h [--help]          Get a description and instructions for this command.

Arguments (positional):
ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
SYMBOL               Asset symbol required.
AMOUNT				 Amount of asset required.
```

# Example
```
$ ./mvs-cli burn Alice passwd1 MVS.Alice 2000000000
{
	"transaction" : 
	{
		"hash" : "383544319feef17b11df00fce2406af8d70a167b141c33dac5a72a7175c010a5",
		"inputs" : 
		[
			{
				"address" : "MRmQLBpRF4nz9BgxtHkfWfmZATC5yMKziH",
				"previous_output" : 
				{
					"hash" : "825fcdff85ec5fbc951424b3a5b76fa125c0e2f5cf62ef082d760c48076aadbd",
					"index" : 0
				},
				"script" : "[ 3044022043f1aa6a535240499c3e934ddbb639648ff6d19ace8a03863e87d4d835dd48cf0220380c75711f5fc1bdc040f0f909b2ee8c182bb53eaa186a217bc6865f2450699101 ] [ 02b3b23bbdc7e1031c6dcd9914eaa42c7b1cd5969fae06fd5102b830020f3d9e55 ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MTNAPPhPnNWGg3w4P7s3HEFVzouabJp77H",
				"previous_output" : 
				{
					"hash" : "2a06aa22297e06cf09231acec4972b84e6493efc684eaa991956a077d2b1e2f3",
					"index" : 0
				},
				"script" : "[ 304402207e751c0b6c8b6dcab44a7df4ad71b1a6ad9fb0b3a2c7ed6fb479b7ff4fe057a00220502443066efa719724e3dd3b9443e7065cdb8d872ba6dac21945092f7afc572901 ] [ 02dbefb4acbd8ef0c8f6ef19a04b03033d74575fe4d8439d8f19f0c41eaf589c12 ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "1111111111111111111114oLvT2",
				"attachment" : 
				{
					"from_did" : "",
					"quantity" : 2000000000,
					"symbol" : "MVS.ALICE",
					"to_did" : "BLACKHOLE",
					"type" : "asset-transfer"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "return",
				"value" : 0
			},
			{
				"address" : "MRmQLBpRF4nz9BgxtHkfWfmZATC5yMKziH",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ c3fab4b4d16052868c2dee4f5a4c773fbe358d86 ] equalverify checksig",
				"value" : 299990000
			},
		],
		"version" : "4"
	}
}
```