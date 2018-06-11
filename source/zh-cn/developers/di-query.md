
## 查看数字身份列表
注册成功的数字身份，可以通过listdids查看
```bash
命令：
$ listdids 
Usage: mvs-cli listdids [-h] [ACCOUNTNAME] [ACCOUNTAUTH]                 

Info: list whole network DIDs in details.                                

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Account name required.                              
ACCOUNTAUTH          Account password(authorization) required.    

```

1. 示例：查看链上已注册的所有did
```bash
命令：
$ ./mvs-cli listdids
输出：
{
        "dids" :
        [
            {
                    "address" : "MN3UNt5FbUbpsYtW6UfhcieykUb8rXKP5g",
                    "status" : "registered",
                    "symbol" : "Alice.DIID"
            },
            {
                    "address" : "MLixg7rxKmtPj9DT9wPKSy6WkJkoUDWUSv",
                    "status" : "registered",
                    "symbol" : "Alice.DIID2"
            },
            {
                    "address" : "M9ZTG5ed4Tbsir7rD1JYYFVaaWnYmBxHs7",
                    "status" : "registered",
                    "symbol" : "Bob.DIID"
            },
            {
                    "address" : "MAhmaLbfLFFMQF88xWAqibDaPfQfYqpv8Y",
                    "status" : "registered",
                    "symbol" : "Cindy.DIID"
            }
        ]
}
```

2. 示例：查看当前账户已注册的所有did
```bash
命令：
$ ./mvs-cli listdids Alice 123
输出：
{
        "dids" :
        [
            {
                    "address" : "MN3UNt5FbUbpsYtW6UfhcieykUb8rXKP5g",
                    "status" : "registered",
                    "symbol" : "Alice.DIID"
            },
            {
                    "address" : "MLixg7rxKmtPj9DT9wPKSy6WkJkoUDWUSv",
                    "status" : "registered",
                    "symbol" : "Alice.DIID2"
            }
        ]
}
```


## 查看历史地址
每个数字身份从注册到转移都会记录在链上，可以查看did的迁移记录
 ```bash
查看所有数字身份列表
命令：   
$ getdid
Usage: mvs-cli getdid [-h] [DID/ADDRESS]                                 

Info: getdid                                                             

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

DID/ADDRESS          Did symbol or standard address; If no input         
                     parameters, then display whole network DIDs. 
规则：
参数为ADDRESS时显示ADDRESS对应的did的历史地址
 ```

1. 示例：查看链上已注册的所有did
```bash
命令：
$ ./mvs-cli getdid
输出：
{
        "dids" :
        [
            "Alice.DIID",
            "Alice.DIID2",
            "Bob.DIID",
            "Cindy.DIID",
        ]   
}
```

2. 示例：查看did迁移的历史地址
```bash
命令：
$ ./mvs-cli getdid test.mvs 或者 ./mvs-cli getdid M9kDHsDKJj9hM8FzSmDu4xCDbo2DFzUhzj
输出：
{
	"addresses" : 
	[
		{
			"address" : "M9kDHsDKJj9hM8FzSmDu4xCDbo2DFzUhzj",
			"status" : "current"
		},
		{
			"address" : "35cY636TPTfFW8PxhqH3BNRL54g1T4mbR2",
			"status" : "history"
		},
		{
			"address" : "MP5FoYQHiEQ52pcEURkaYmuqZMnYHNAZ83",
			"status" : "history"
		},
		{
			"address" : "M9L3ipy3Hcf6kdvknU3mH7mwH9ER3uCziu",
			"status" : "history"
		}
	],
	"did" : "test.mvs"
}  
```