title: 跨链置换操作指南
comments: true
---

## 功能简介

跨链置换服务可以实现以太坊`ERC20`资产与元界`MST`资产的相互置换。

## 绑定以太坊地址与元界数字身份或地址

### 获取地址绑定交易数据

#### 全节点钱包
1. 进入地址页面，选择用绑定的数字身份或地址，点击`链接到以太坊地址`
![链接到以太坊地址](https://i.imgur.com/LGVc5SP.png)

2. 点击`生成数据`
![生成数据](https://i.imgur.com/UIdqCPZ.png)

3. 点击`拷贝数据`
![拷贝数据](https://i.imgur.com/6kjEyZM.png)

#### myetpwallet
TODO

### 执行地址绑定合约
打开支持附加交易数据的以太坊钱包，如 [`myetherwallet`](https://www.myetherwallet.com/) 或 [`imtoken`](https://token.im/)，发起转账交易。转账地址填写地址绑定智能合约的地址：`0xa52b0a032139e6303b86cfeb0bb9ae780a610354`，转账数量填写：`0`，点击`高级选项`，将前面拷贝的数据粘贴到`十六进制数据`一栏中。然后点击`下一步`完成转账交易。 该交易用于建立以太坊地址与元界的数字身份或者钱包地址之间的绑定映射。
![绑定以太坊地址与元界的数字身份](https://i.imgur.com/GAFn530.jpg)


## 将以太坊资产置换为元界`MST`资产

### 向元界资产置换的以太坊地址转账`ERC20`资产
![向元界资产置换的以太坊地址转账`ERC20`资产](https://i.imgur.com/XPurSyh.jpg)

### 查询
在 [`myetpwallet`](https://www.myetpwallet.com/) 钱包或在[区块链浏览器](https://explorer.mvs.org/avatar)上查看置换完成的`MST`资产，该`MST`资产默认以`ERC20.`为前缀。


## 将元界`MST`资产置换为以太坊资产

### 全节点钱包
在主界面上选择要置换的元界`MST`资产，点击转账。
![选择资产](https://i.imgur.com/rHpCiHG.png)

在转账界面中选择选项`我愿意将MST资产置换为等值的ERC20代币`，填写要置换的资产数量，接收置换资产的以太坊地址。置换操作的手续费为`1 ETP`。
![转账资产](https://i.imgur.com/Ofv9FIj.png)

### myetpwallet
TODO

