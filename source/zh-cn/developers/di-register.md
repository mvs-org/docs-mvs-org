
## 注册
注册数字身份前必须有已经创建好的账户，需要目的地址支付有 1个etp来支付手续费，注册成功并入块后，才可以使用它来发送交易
注册数字身份需要参数: 账户，账户密码，目的地址，数字身份标志。

```bash
命令：
$ registerdid
Usage: mvs-cli registerdid [-h] [--fee value] ACCOUNTNAME ACCOUNTAUTH    
ADDRESS SYMBOL                                                           

Info: registerdid                                                        

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           The fee of tx. defaults to 1 etp.                   

Arguments (positional):

ACCOUNTNAME          Account name required.                              
ACCOUNTAUTH          Account password(authorization) required.           
ADDRESS              The address will be bound to, can change to other   
                     addresses later.                                    
SYMBOL               The symbol of global unique MVS Digital Identity    
                     Destination/Index, supports                         
                     alphabets/numbers/(“@”, “.”, “_”,       
                     “-“), case-sensitive, maximum length is 64. 


规则：
ADDRESS属于当前账户;
SYMBOL由字母、数字和特殊字符("@",".","_","-")组成，大小写敏感，最大长度不能超过64;
SYMBOL不能为有效地址并且在链上不能重复;
SYMBOL不能为关键字"BLACKHOLE"。"BLACKHOLE"大小写不敏感，即"BLACKHOLE","blockhole","BlockHole"等形式都是无效的SYMBOL;
SYMBOL不能为政治相关的敏感词;
注册did至少需要1个etp
```

示例: 使用账号'test'注册名称为'test.mvs'的数字身份，并绑定到给账户下的有效地址'M9L3ipy3Hcf6kdvknU3mH7mwH9ER3uCziu'
```bash
命令：
$ ./mvs-cli registerdid test 123 M9L3ipy3Hcf6kdvknU3mH7mwH9ER3uCziu test.mvs

输出：
{
	"transaction" : 
	{
		"hash" : "4d5ae5bfdd89d30a771680cd3080478e741ff1bea65b4903ea42160952c0c9e8",
		"inputs" : 
		[
			{
				"address" : "M9L3ipy3Hcf6kdvknU3mH7mwH9ER3uCziu",
				"previous_output" : 
				{
					"hash" : "a7db09dcf9e8d9341f8343a6f1edfb2fd1fdf350ccef8f3517b446eeb2d73076",
					"index" : 0
				},
				"script" : "[ 304402201c9b9706b3e198e9de8887c94c6e7f1192a65cb1fa15318b409f6d4fc4952f9a0220306d2f5fcdf2e1e32861399dc55b7c81a1cedc7790d2ff8a73a8bb3f9bac5fde01 ] [ 035f572a164ec0e7d8f1935e357d86c6441152bed7251389a1c66174ae890dad90 ]",
				"sequence" : 4294967295
			}
		],
		"lock_time" : "0",
		"outputs" : 
		[
			{
				"address" : "M9L3ipy3Hcf6kdvknU3mH7mwH9ER3uCziu",
				"attachment" : 
				{
					"address" : "M9L3ipy3Hcf6kdvknU3mH7mwH9ER3uCziu",
					"symbol" : "test.mvs",
					"type" : "did-register"
				},
				"index" : 0,
				"locked_height_range" : 0,
				"script" : "dup hash160 [ 0fad171975f1100309022c83c7b9dca0a8f8e6b8 ] equalverify checksig",
				"value" : 0
			}
		],
		"version" : "4"
	}
}
```