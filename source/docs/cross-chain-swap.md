title: 跨链置换操作指南
comments: false
---

# 功能简介

跨链置换可以实现将其它链上的 Token 转移到元界公链上来，同时也支持从元界置换回原来的链上去。

目前只支持元界与以太坊之间的跨链转换。

对于以太坊，只支持 ETH 和满足 ERC20 接口的 Token（以 XYZ 为例）与元界资产的置换。

置换比例为 1:1，置换后在元界会生成对应的资产（默认加上前缀 ERC20.）。

ETH 对应 ERC20.ETH

XYZ 对应 ERC20.XYZ


# 从以太坊置换到元界

## 绑定元界DID或地址
建立以太坊账号与元界的数字身份或者钱包地址之间的绑定映射。
建立绑定映射后使用该以太坊账号发起的向元界的置换交易最终会在其绑定的元界钱包地址上生成置换后的资产。

**绑定方法**  
* 导入合约 ABI  
```
[{"constant":true,"inputs":[{"name":"addr","type":"address"}],"name":"get_address","outputs":[{"name":"","type":"string","value":""}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"etpaddr","type":"string"}],"name":"map_address","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"anonymous":false,"inputs":[{"indexed":false,"name":"","type":"address"},{"indexed":false,"name":"","type":"string"}],"name":"MapAddress","type":"event"}]
```

* 向合约发起绑定交易  
```
合约地址为：0x9faa766fcbcd3bdbab27681c7cca6e1a6016b7c5
```

该合约支持绑定地址和查询绑定操作。

可以通过钱包操作，也可以使用其它工具。

* 通过imtoken钱包绑定
通过钱包向合约地址(0x9faa766fcbcd3bdbab27681c7cca6e1a6016b7c5)发起一笔交易
点击高级选项，输入十六进制数据(用来调用合约map_address(string)方法绑定元界did或者地址)

绑定ETH当前账户地址到ALICE.DIID示例:
~~~
参数：ALICE.DIID
data数据:0xfa42f3e50000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000a414c4943452e4449494400000000000000000000000000000000000000000000

数据解析：
0xfa42f3e5: 函数ID, map_address(string) 通过sha1加密后的前8个字符
0000000000000000000000000000000000000000000000000000000000000020:第一个参数(ALICE.DIID)的位置，0x20,从当前位置跳过0x20(32)个字节
000000000000000000000000000000000000000000000000000000000000000a:第一个参数的长度，0x0a(ALICE.DIID的长度)
414c4943452e4449494400000000000000000000000000000000000000000000:第一个参数的信息，ALICE.DIID由ASCII转换为十六进制后的数据

以太坊十六进制生成规则参考:http://solidity.readthedocs.io/en/v0.4.24/abi-spec.html
~~~


* truffle 使用示例  

```
truffle(development)> etpmap_abi = [{"constant":true,"inputs":[{"name":"addr","type":"address"}],"name":"get_address","outputs":[{"name":"","type":"string","value":""}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"etpaddr","type":"string"}],"name":"map_address","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"anonymous":false,"inputs":[{"indexed":false,"name":"","type":"address"},{"indexed":false,"name":"","type":"string"}],"name":"MapAddress","type":"event"}]

truffle(development)> etpmap_contract_address = '0x9faa766fcbcd3bdbab27681c7cca6e1a6016b7c5'

# 生成合约对象
truffle(development)> etpmap = web3.eth.contract(etpmap_abi).at(etpmap_contract_address)

# 查询绑定
truffle(development)> eth_account_address = '0x2d23fdffe79c9b5769b399ccd0d8c2e46e1aea26'
truffle(development)> etpmap.get_address(eth_account_address)

# 发起绑定
truffle(development)> eth_account_address2 = '0x0c1933b3fdaf77bc196e7853256959ab9b28e1ff'
truffle(development)> did_to_be_bind = '@TestAccount'
truffle(development)> web3.personal.unlockAccount(eth_account_address2, 'account_password')
truffle(development)> etpmap.map_address.sendTransaction(did_to_be_bind, {'from':eth_account_address2})
```

## 发起置换交易
使用该建立了绑定关系的以太坊账号发起置换交易，**接收方为指定的以太坊地址(下例中设为 exchange_eth_account_address)**。

* 以下为 truffle 使用示例  
```
truffle(development)> eth_account_address2 = '0x0c1933b3fdaf77bc196e7853256959ab9b28e1ff'
truffle(development)> exchange_eth_account_address = '0x2d23fdffe79c9b5769b399ccd0d8c2e46e1aea26'
truffle(development)> web3.personal.unlockAccount(eth_account_address2, 'account_password')
truffle(development)> web3.eth.sendTransaction({'from':eth_account_address2, 'to':exchange_eth_account_address, 'value':8888*(10**14)})

```

# 从元界置换到以太坊

## 直接发起置换交易
**接收方为指定的元界数字身份或者钱包地址(下例中为数字身份 droplet)**，并将置换的目标以太坊账号地址写入交易备注之中。
发起置换的资产必须是从以太坊那边置换过来的资产。

* 以下为元界全节点钱包使用示例  
```
./mvs-cli didsendasset accountname password droplet ERC20.XYZ 8123456789 -i '0x0c1933b3fdaf77bc196e7853256959ab9b28e1ff'
```
