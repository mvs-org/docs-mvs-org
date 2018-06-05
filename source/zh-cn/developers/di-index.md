title: 数字身份
comments: false

## 数字身份（Avatar）：

数字身份与用户所拥有的主私钥绑定, 在全网中拥有唯一标识，与用户的地址是一一绑定的，并且可以在同一账户的不同地址间转移。数字身份可以由单个或多个注册者共同持有，是不可伪造的，当多个用户共同持有时，绑定的是这几个用户创建的多重签名地址，此时发布交易必须通过多个人的共同签名确认。可以不使用地址直接通过数字身份创建交易，通过数字身份创建的交易会在链上进行验证，发给无效的数字身份会被拒绝。拥有数字身份的用户可以持有和发行资产。



## 创建注册
创建同时注册数字身份，需要目的地址支付至少 1个etp的手续费，交易入块后，才可以使用它来发送交易
注册数字身份需要参数: 账户，账户密码，目的地址，数字身份标志。
```bash
命令：
$ registerdid ACCOUNTNAME  ACCOUNTAUTH  ADDRESS SYMBOL

规则：
ADDRESS属于当前账户;
SYMBOL由字母、数字和特殊字符("@",".","_","-")组成，大小写敏感，最大长度不能超过64;
SYMBOL不能为有效地址并且在链上不能重复;
SYMBOL不能为关键字"BLACKHOLE"。"BLACKHOLE"大小写不敏感，即"BLACKHOLE","blockhole","BlockHole"等形式都是无效的SYMBOL;
SYMBOL不能为政治相关的敏感词;
注册did至少需要1个etp
```

### 查看数字身份列表
发行成功的数字身份，可以通过listdids查看
不加任何参数输出链上所有有效的数字身份和当前绑定地址，如果只需要查看当前账户下的数字身份，需要校验账户名和密码
```bash
查看链上已注册的所有did
命令：
$ listdids 

查看当前账户下的所有的did
$ listdids  ACCOUNTNAME  ACCOUNTAUTH
```


### 数字身份转移
数字身份可以通过改变地址进行迁移；如果要把数字身份从用户1向用户2转移，可以先转移到两个人的多重签名地址，再从多重签名地址转移到用户2的公钥地址，每次转移过程都需要收取手续费。
转移数字身份需要校验当前所属账户和目的地址。如果需要迁移到多重签名地址，需要多个人对迁移交易签名确认。
 ```bash
命令：   
$ didchangeaddress ACCOUNTNAME ACCOUNTAUTH TOADDRESS SYMBOL
规则：
TOADDRESS为当前账户下有效的地址且未绑定其他did
 ```

### 查看历史
每个数字身份从注册到转移都会记录在链上，可以查看did的迁移记录
不加任何参数查看所有did列表，区别于不加参数的listdids在于不会显示当前绑定地址。如果添加数字身份的symbol或者绑定数字身份的有效地址，显示数字身份迁移的历史地址。
 ```bash
查看所有数字身份列表
命令：   
$ getdid 
输出说有有效的did列表

查看did的历史地址
命令：   
$ getdid SYMBOL/ADDRESS
规则：
参数为ADDRESS时显示ADDRESS对应的did的历史地址
 ```

### 发送etp到其他数字身份(或有效地址)
兼容send接口
 ```bash
命令：
$ didsend ACCOUNTNAME ACCOUNTAUTH DID/ADDRESS AMOUNT
规则：
目标可以为did或address
 ```

### 从当前did(或地址)发送etp到其他did(或地址)
兼容sendfrom
 ```bash
命令： 
$ didsendfrom ACCOUNTNAME ACCOUNTAUTH FROMDID/FROMADDRESS TODID/TOADDRESS AMOUNT
规则：
FROMDID/FROMADDRESS为当前账户下的did或者地址
 ```

### 发送到到多个did(或地址)
兼容sendmore
 ```bash
命令： 
$ didsendmore ACCOUNTNAME ACCOUNTAUTH -r todid1/toaddress1:AMOUNT1 -r todid2/toaddress2 -m did3/toaddress3
规则：
"-r" 选项指定目的did(或地址)和金额,可以添加多个;
"-m" 选项指定找零的did或地址
```

### 发送资产到其他did(或地址)

 ```bash
命令： 
$ didsendasset ACCOUNTNAME ACCOUNTAUTH TODID/TOADDRESS AMOUNT
规则：
目标可以为有效did或address
```
### 从当前did(或地址)发送资产到其他did(或地址)

 ```bash
命令： 
$ didsendfrom ACCOUNTNAME ACCOUNTAUTH FROMDID/FROMADDRESS TODID/TOADDRESS AMOUNT
规则：
FROMDID/FROMADDRESS为当前账户下的did或者地址
```

