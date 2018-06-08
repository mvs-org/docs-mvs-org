title: MST Certificate
---

## Precondition
You need an account and a did. You can use `"mvs-cli getnewaccount accountname password"` and `"mvs-cli issuedid accountname password address did"` to generate a new account and a new did.

**For convenience, I'll uniformly use `Alice` as account name, `passwd1` as password, `Alice` as did, and use `testing addresses` in the following examples. When you refer to the following examples, please change to your account name, password and did, and pay attention to the correct addresses.**

With an account, if you want to `issue` or `send` an asset, you have to make sure that there is enough ETP in the account to pay fees. You can use `"mvs-cli getbalance account_name password"` to get the total balance of the account. You can also use `"mvs-cli listbalances account_name password"` to list the balance of each address in the account.

You can use `help` to get the help information of each command. For eaxmple, use `"mvs-cli help createasset"` or `"mvs-cli createasset -h"` to get the help information of `createasset` command.

## What is MST Certificate?
The asset certificate is a certificate of an asset's interest. It is unique and can be transferred between DIDs. Secondary issue certificate, domain certificate and naming certificate are supported now. Assets or certificate can only be issued if user has the appropriate certificate.

## Type of certificate
Secondary issue certificate, domain certificate and naming certificate are supported now：
> **issue**: Secondary issue certificate. Asset can only be secondary issued if user has a secondary issue certificate with the same name as the asset. This certificate is automatically issued to the issuer when issuing assets that can be secondary issued. Related commands: `createasset`, `issue`, `secondaryissue`.  
> **domain**: Domain certificate. The domain certificate is automatically provided at the asset creation stage and is available on the first-issue first-served basis. For example, if you own the domain `MVS`, only you can create an asset whose name starts with `MVS.`. Related commands: `createasset`, `issue`.  
> **naming**: Naming certificate. The owner of domain certificate can create the naming certificate that can be transferred to others, for them to issue the asset with the same name as the naming certificate. Related commands: `issuecert`, `transfercert`.  

**Notes: Issuing a asset whose name starts with a dot `.` would not generate any certificate.**

## Obtain certificate
Secondary issue certificate and domain certificate are provided after asset is issued. Naming certificate is provided by command `issuecert`. For issuing asset, please refer to [MST issue](/developers/da-issue.html).

### Obtain secondary issue certificate and domain certificate
1. Create asset that can be secondary issued by command `createasset`  
If the value of option `--rate` of command `createasset` is -1 or between [1, 100], then asset that can be secondary issued is created.
```bash
Command: 
$ ./mvs-cli createasset Alice passwd1 --symbol MVS.ALICE --volume 1000000000000 --description "Asset of Alice." --issuer Alice --decimalnumber 8 --rate -1

Output:   
{
	"asset" : 
	{
		"address" : "",
		"decimal_number" : 8,
		"description" : "Asset of Alice.",
		"is_secondaryissue" : false,
		"issuer" : "Alice",
		"maximum_supply" : 1000000000000,
		"secondaryissue_threshold" : 127,
		"status" : "unissued",
		"symbol" : "MVS.ALICE"
	}
}
```
2. Issue asset by command `issue`  
No domain certificate named `MVS` exists on Metavase network before `Alice` issues an asset named `MVS.ALICE`. So `Alice` got a domain certificate named `MVS` after she issued an asset named `MVS.ALICE`. She also got a secondary issue certificate named `MVS.ALICE` because the asset `MVS.ALICE` can be secondary issued. We can find the `cert` fileds value of which are `issue` or `domain` from the output bellow. 
```bash
Command: 
$ ./mvs-cli issue Alice passwd1 MVS.ALICE

Output:   
{
	"transaction" : 
	{
		"hash" : "c88bd3914577df14063f8df7b9365d0061ee902a9ab90bf80df541ec41536321",
		"inputs" : 
		[
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"previous_output" : 
				{
					"hash" : "6ff77f00f50b18f108e6f185c99bf226a0803a0a6e58844d4043c86003de8ef3",
					"index" : 1
				},
				"script" : "[ 3044022021d7739ba53653920b02bced24f1d9e0aed5d702188f6a28c2c7371883fc9b0b02204fe7bc03309331b0355cf79600691a63b5ee8f1c64cd8db01321db041614851b01 ] [ 038d7048a4e640a0e0a27ef85d2a7e5b339834cd565ada0d6ea042127732fa105e ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"previous_output" : 
				{
					"hash" : "19dad273d07090648279817e8dcbce8dc06c9815ee94fa798d8e779cf66a9076",
					"index" : 0
				},
				"script" : "[ 304402205e6cb2bd7e9746bc9181ec66043a3244d9f502f03174a384d53853da44f2d2eb022056e19b54d01ae8ad164ca6e856ab7ed12c8c42081c0451cc66c990c08a783be101 ] [ 038d7048a4e640a0e0a27ef85d2a7e5b339834cd565ada0d6ea042127732fa105e ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"previous_output" : 
				{
					"hash" : "c42114b2626d9a6e82888deade68c82500e1e55494318c2c3eed7f0a065895e9",
					"index" : 0
				},
				"script" : "[ 304502210091b393ed73b59d89a37a7d8c2d0145f5f010a3ca29897b9ed0283782cebba7690220489e6564f17f62a9ec5b1f642be030395318f405ffeb4023c08282360070301b01 ] [ 038d7048a4e640a0e0a27ef85d2a7e5b339834cd565ada0d6ea042127732fa105e ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"previous_output" : 
				{
					"hash" : "cb62c51992f141490ba8934e422a47f5e8d11cf92cbfedbd99bf4247865d6579",
					"index" : 0
				},
				"script" : "[ 304402200a152c449de59abbd53bd54cd8164b2b2ede152e8350358b4aa1014f733b75a902200bc64b0edfd4c5cd3667d9b416f4361ea6cf24649aebe06e6d3e93b2fa0b2ce301 ] [ 038d7048a4e640a0e0a27ef85d2a7e5b339834cd565ada0d6ea042127732fa105e ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"attachment" : 
				{
					"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
					"decimal_number" : 8,
					"description" : "Asset of Alice.",
					"from_did" : "",
					"is_secondaryissue" : false,
					"issuer" : "Alice",
					"quantity" : 1000000000000,
					"secondaryissue_threshold" : 127,
					"symbol" : "MVS.ALICE",
					"to_did" : "Alice",
					"type" : "asset-issue"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 95c9a5e647870bbc535d83a3c394ef40d298aa46 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"attachment" : 
				{
					"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
					"cert" : "issue",
					"from_did" : "",
					"owner" : "Alice",
					"symbol" : "MVS.ALICE",
					"to_did" : "Alice",
					"type" : "asset-cert"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 95c9a5e647870bbc535d83a3c394ef40d298aa46 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"attachment" : 
				{
					"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
					"cert" : "domain",
					"from_did" : "",
					"owner" : "Alice",
					"symbol" : "MVS",
					"to_did" : "Alice",
					"type" : "asset-cert"
				},
				"index" : 2,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 95c9a5e647870bbc535d83a3c394ef40d298aa46 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 3,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 95c9a5e647870bbc535d83a3c394ef40d298aa46 ] equalverify checksig",
				"value" : 100000000
			}
		],
		"version" : "4"
	}
}
```

### Obtain naming certificate
The owner of domain certificate can issue the naming certificate whose domain name is the name of domain certificate by command `issuecert`.   

`issuecert` needs the following paramenters: account_name, account_passwd, to_did, cert_symbol, cert_type. Only `naming` certificate can be issued now.  

For example, `Alice` owns a domain certificate named `MVS` then she can issue a naming certificate named `MVS.BOB` to did `Alice` which belongs to she too.  
```bash
Command: 
$ ./mvs-cli issuecert Alice passwd1 Alice MVS.BOB naming

Output:   
{
	"transaction" : 
	{
		"hash" : "578c23781ab4251c02f2987f5ad0cbeb8ed526546877364efe853e5a345549d9",
		"inputs" : 
		[
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"previous_output" : 
				{
					"hash" : "c88bd3914577df14063f8df7b9365d0061ee902a9ab90bf80df541ec41536321",
					"index" : 3
				},
				"script" : "[ 3045022100fef8cf721e972b256241aa983c5ce123be4ce0d50bfaf5c8696e5c17486e133f02203147741b4868e34e4f8a3b32e8b7ef1605582950e80c0cd04eee584989507cff01 ] [ 038d7048a4e640a0e0a27ef85d2a7e5b339834cd565ada0d6ea042127732fa105e ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"previous_output" : 
				{
					"hash" : "c88bd3914577df14063f8df7b9365d0061ee902a9ab90bf80df541ec41536321",
					"index" : 2
				},
				"script" : "[ 3045022100959f7b4e694610c1078b310dbf5ea1cf710175e1349b469239fb79e81ca974f502202bf495d589a5b9ef0341689a8c88bb739762b538cf472422216e0dfc33f51f8101 ] [ 038d7048a4e640a0e0a27ef85d2a7e5b339834cd565ada0d6ea042127732fa105e ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"attachment" : 
				{
					"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
					"cert" : "naming",
					"from_did" : "",
					"owner" : "Alice",
					"symbol" : "MVS.BOB",
					"to_did" : "Alice",
					"type" : "asset-cert"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 95c9a5e647870bbc535d83a3c394ef40d298aa46 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"attachment" : 
				{
					"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
					"cert" : "domain",
					"from_did" : "",
					"owner" : "Alice",
					"symbol" : "MVS",
					"to_did" : "Alice",
					"type" : "asset-cert"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 95c9a5e647870bbc535d83a3c394ef40d298aa46 ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 2,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 95c9a5e647870bbc535d83a3c394ef40d298aa46 ] equalverify checksig",
				"value" : 99990000
			}
		],
		"version" : "4"
	}
}
```


### Transfer cert
Certificates can be transfered to other DIDs which can be owned by other account by command `transfercert`.  

`transfercert` needs the following paramenters: account_name, account_passwd, to_did, cert_symbol, cert_type. This command suports multi-sign, that means certificates can be transferd from or to DIDs which is multi-signed.  

In the previous example, `Alice` issued a naming certificate named `MVS.BOB`. Now `Alice` can transfer it to DID `Bob` which belongs to account `Bob`.  
```bash
Command: 
$ ./mvs-cli transfercert Alice passwd1 Bob MVS.BOB naming

Output:   
{
	"transaction" : 
	{
		"hash" : "0a985f55345cd5ca81df08c263033c34b8895bf18db6435e8b2509ebbe9f4b0f",
		"inputs" : 
		[
			{
				"address" : "MNz5WH5CH1T44hTpanbG1v1NBjcZXf4je4",
				"previous_output" : 
				{
					"hash" : "98f70aba9c690700dd66ec0c8fce2c56c22043d1c20ff76f164170cc10050c70",
					"index" : 0
				},
				"script" : "[ 3045022100a0527a44333aa92ed469b34431eff09d31a7eaaf20a7b86b09cd395d69f74c0e02203b28dc32d9db29ee1d398021a0652be0a2b4486b8137471efb29b77a215aa11701 ] [ 02eee915ccdb35cc35583a3ad58be24fe914d754d00cd75641f56cc90fc305e307 ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
				"previous_output" : 
				{
					"hash" : "578c23781ab4251c02f2987f5ad0cbeb8ed526546877364efe853e5a345549d9",
					"index" : 0
				},
				"script" : "[ 3045022100bada970681995f64fdd8716075f3b4ee7116d63376a5811ed1d897c99283eea3022027cd6761027155b7f892ad4d4944019fdb75ee3b15761e7e9f58738ed0010c0e01 ] [ 038d7048a4e640a0e0a27ef85d2a7e5b339834cd565ada0d6ea042127732fa105e ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"attachment" : 
				{
					"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
					"cert" : "naming",
					"from_did" : "",
					"owner" : "Bob",
					"symbol" : "MVS.BOB",
					"to_did" : "Bob",
					"type" : "asset-cert"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ ee51cd6e869195dca48ede01f40a18c275322fbd ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MNz5WH5CH1T44hTpanbG1v1NBjcZXf4je4",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ a57805573daf3760779ff5dfc820ba5728e462d2 ] equalverify checksig",
				"value" : 299990000
			}
		],
		"version" : "4"
	}
}
```


## Use Certificate
Certificates are usually used implicitly. For example, domain certificate or naming certificate may be used while issuing asset by command `issue`; secondary issue certificate is used while secondary issuing asset by command `secondaryissue`; domain certificate is used while issuing naming certificate by command `issuecert`. Certificates can be used explicitly by command `transfercert` too.

### Using naming certificate to create asset
In the previous example, `Bob` got a naming certificate named `MVS.BOB` from `Alice`. Now `Bob` can issue an asset named `MVS.BOB`.   
1. Create asset
```bash
$ ./mvs-cli createasset Bob passwd1 --symbol MVS.BOB --volume 1000000000000 --description "Asset of BOB." --issuer Bob --decimalnumber 8 --rate -1
{
	"asset" : 
	{
		"address" : "",
		"decimal_number" : 8,
		"description" : "Asset of BOB.",
		"is_secondaryissue" : false,
		"issuer" : "Bob",
		"maximum_supply" : 1000000000000,
		"secondaryissue_threshold" : 127,
		"status" : "unissued",
		"symbol" : "MVS.BOB"
	}
}
```
2. Issue asset
```bash
$ ./mvs-cli issue Bob passwd1 MVS.BOB
{
	"transaction" : 
	{
		"hash" : "3e6084732f35dac309f2243ef890e9455ccf930f1f54be386666e52356961234",
		"inputs" : 
		[
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"previous_output" : 
				{
					"hash" : "0a985f55345cd5ca81df08c263033c34b8895bf18db6435e8b2509ebbe9f4b0f",
					"index" : 0
				},
				"script" : "[ 3045022100b79b10adf94b3cf7dfe33d45e6b65598c3008b348d87363cee429d24f9a0bd74022077ab16d574b0d3c118058316b950c27f1660c7ef2ece3e4bdbdd6b6bf2b7004701 ] [ 0218feb8b4eb5d83d5ca93116a09c1b16f9587db78af950a06c15c1c82e81866df ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"previous_output" : 
				{
					"hash" : "a0b321d1ce636644fa51f78f3a4a2ea66aa52b623a4759ae5b61b9f57ea4b647",
					"index" : 1
				},
				"script" : "[ 3045022100ec6ff9fb6cdd7fb11883d05c43bbbb767111b4efbad2b96b5bfb456e470df54f0220531100981698ff204b76ffc53399de1bf33fbaf4dbd0ca666f57ceaf75bcfbf001 ] [ 0218feb8b4eb5d83d5ca93116a09c1b16f9587db78af950a06c15c1c82e81866df ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"previous_output" : 
				{
					"hash" : "5be8df2c2e3d2a7ecd6f1963cba046a78a4c959b6eb4d94a8396602d23c2a44a",
					"index" : 0
				},
				"script" : "[ 3045022100e2d0c79673293c971b146fb3974ee5d36aa1c1fd8a24a785fe1577d634676df602203f048e25dd9c2920a29ecf2ea60774a8a1f6429b6c0ba1bc712d54757b9e994801 ] [ 0218feb8b4eb5d83d5ca93116a09c1b16f9587db78af950a06c15c1c82e81866df ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"previous_output" : 
				{
					"hash" : "91290adcfae5b490e0077ea6f2ba4484b4195f187a823023cc0bf829cae66147",
					"index" : 0
				},
				"script" : "[ 30440220790e9ac92450ae4bd18420d5d3bb94cdd85f50c30ec54dace549169deb500a7b0220384038a8fe308a1330af337d3f3e3404e62d147b1b00f30a4c4a304a205f2e7901 ] [ 0218feb8b4eb5d83d5ca93116a09c1b16f9587db78af950a06c15c1c82e81866df ]",
				"sequence" : 4294967295
			},
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"previous_output" : 
				{
					"hash" : "e4df769a43a7fb28aa29c2c9809014c04335afd690ab48f5359bcf4f70f94e9a",
					"index" : 0
				},
				"script" : "[ 3045022100f1eb735631261c4e7b1e7591f09d999dbcda13efec29f8e350c5ceb3772f7769022077168d79740e4ee1f0af9b5f733855cd70091b9564562d57e571ddcace1f139101 ] [ 0218feb8b4eb5d83d5ca93116a09c1b16f9587db78af950a06c15c1c82e81866df ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"attachment" : 
				{
					"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
					"decimal_number" : 8,
					"description" : "Asset of BOB.",
					"from_did" : "",
					"is_secondaryissue" : false,
					"issuer" : "Bob",
					"quantity" : 1000000000000,
					"secondaryissue_threshold" : 127,
					"symbol" : "MVS.BOB",
					"to_did" : "Bob",
					"type" : "asset-issue"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ ee51cd6e869195dca48ede01f40a18c275322fbd ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"attachment" : 
				{
					"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
					"cert" : "issue",
					"from_did" : "",
					"owner" : "Bob",
					"symbol" : "MVS.BOB",
					"to_did" : "Bob",
					"type" : "asset-cert"
				},
				"index" : 1,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ ee51cd6e869195dca48ede01f40a18c275322fbd ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"attachment" : 
				{
					"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
					"cert" : "naming",
					"from_did" : "",
					"owner" : "Bob",
					"symbol" : "MVS.BOB",
					"to_did" : "Bob",
					"type" : "asset-cert"
				},
				"index" : 2,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ ee51cd6e869195dca48ede01f40a18c275322fbd ] equalverify checksig",
				"value" : 0
			},
			{
				"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
				"attachment" : 
				{
					"type" : "etp"
				},
				"index" : 3,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ ee51cd6e869195dca48ede01f40a18c275322fbd ] equalverify checksig",
				"value" : 100000000
			}
		],
		"version" : "4"
	}
}
```


## Query certificates
Follow commands: `listassets`, `getasset`, `getaccountasset` and `getaddressasset`, have an option `--cert` to query information of certificates。

The information of certificate have four field：
> address: address of certificate.  
> cert: type name of certificate. "domain", "issue", "naming" are supported.  
> owner: DID who owned the certificate.  
> symbol: name of certificate.  

### `getasset`
Query the names of certificates on Metaverse network or display the information of specified certificate.
```
$ ./mvs-cli getasset
{
	"assets" : 
	[
		"MVS",
		"MVS.ALICE",
		"MVS.BOB",
	]
}

$ ./mvs-cli getasset --cert MVS.BOB
{
	"assetcerts" : 
	[
		{
			"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
			"cert" : "naming",
			"owner" : "Bob",
			"symbol" : "MVS.BOB"
		}
	]
}

```

### `listassets`
Query the information of certificates on Metaverse network or the information of certificates owned by the specified account.
```
$ ./mvs-cli listassets --cert
{
	"assetcerts" : 
	[
		{
			"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
			"cert" : "domain",
			"owner" : "Alice",
			"symbol" : "MVS"
		},
		{
			"address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
			"cert" : "issue",
			"owner" : "Alice",
			"symbol" : "MVS.Alice"
		},
		{
			"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
			"cert" : "issue",
			"owner" : "Bob",
			"symbol" : "MVS.BOB"
		},
		{
			"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
			"cert" : "naming",
			"owner" : "Bob",
			"symbol" : "MVS.BOB"
		},
	]
}

./mvs-cli listassets --cert Bob passwd1
{
	"assetcerts" : 
	[
		{
			"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
			"cert" : "naming",
			"owner" : "Bob",
			"symbol" : "MVS.BOB"
		}

	]
}
```

### `getaccountasset`
Query the information of certificates owned by the specified account.
```
$ ./mvs-cli getaccountasset Bob passwd1 --cert
{
	"assetcerts" : 
	[
		{
			"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
			"cert" : "naming",
			"owner" : "Bob",
			"symbol" : "MVS.BOB"
		}
	]
}

$ ./mvs-cli getaccountasset Bob passwd1 MVS.BOB --cert
{
	"assetcerts" : 
	[
		{
			"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
			"cert" : "naming",
			"owner" : "Bob",
			"symbol" : "MVS.BOB"
		}
	]
}
```

### `getaddressasset`
Query the information of certificates at the specified address.
```
$ ./mvs-cli getaddressasset MD9i7CXfRssTXr3DTtsn22KFyWwaxRLu4f --cert
{
	"assetcerts" : 
	[
		{
			"address" : "MVdH3pZrjPqgvg51pYfr7ct1hEqL4R25fz",
			"cert" : "naming",
			"owner" : "Bob",
			"symbol" : "MVS.BOB"
		}
	]
}
```
