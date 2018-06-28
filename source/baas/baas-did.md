title: 数字身份微服务
---

## 概要
数字身份微服务提供 `API` 接口以方便交易所为用户注册数字身份，并绑定到用户钱包。

交易所也可以参照本文档中的设计自己实现同样的功能。涉及到的`CLI command`:
> getnewaddress  
> registerdid  
> didchangeaddress  
> getdid  
> getpublickey  
> getnewmultisig  
> sendrawtx  

以上命令的详细文档可以查看[API文档](https://docs.mvs.org/zh-cn/api_v2/)。

## 用例
以下用例场景涉及到两个角色：交易所和用户 `Alice`。

### 一，用户申请登记数字身份
`Alice` 通过交易所的交互界面申请登记名为 `Alias@Alice` 的数字身份。

### 二，交易所登记数字身份
交易所使用自己的 `MVS` 账户用命令 `getnewaddress` 生成新的地址，然后通过命令 `registerdid` 将名为 `Alias@Alice` 的数字身份绑定到该地址。

### 三，用户绑定数字身份到自己的钱包

#### 1. 生成多重签名地址
`Alice` 和交易所通过命令 `getpublickey` 获取各自账号下某个地址的公钥，并交换公钥。然后各自通过命令 `getnewmultisig` 使用公钥信息生成 `m:n` 为 `1:2` 的相同多重签名地址 `multisig_address`。交易所

#### 2. 交易所转出数字身份到多重签名地址
交易所通过命令 `didchangeaddress` 创建将数字身份 `Alias@Alice` 转出到多重签名地址 `multisig_address` 的交易，并使用命令 `sendrawtx` 广播交易。

#### 3. 用户转入数字身份到钱包地址
`Alice` 通过命令 `didchangeaddress` 创建将数字身份 `Alias@Alice` 转入到钱包地址的交易，并使用命令 `sendrawtx` 广播交易。

#### 4. 确认数字身份
交易所或者 `Alice` 通过命令 `getdid` 可以查看数字身份 `Alias@Alice` 的历史记录确认。

## 数字身份微服务
为了简化交易所的工作，数字身份微服务对以上业务进行了封装，提供了便利的接口。

#### 1. 交易所登记数字身份
交易所使用自己的 `MVS` 账户用命令 `getnewaddress` 生成新的地址，然后通过命令 `registerdid` 将用户请求的数字身份绑定到该地址。然后交易所将用户在交易所的帐户ID，登记的数字身份名称以及绑定的地址通过数字身份微服务接口 `savedid` 保存起来。

#### 2. 交易所生成多重签名地址
当用户申请转出数字身份到用户钱包时，交易所用用户在交易所的帐户ID通过数字身份微服务接口 `querydid` 获得数字身份名称以及绑定的地址。

交易所通过命令 `getpublickey` 获取绑定地址的公钥，并将该公钥出示给用户，同时要求用户输入用户地址的公钥。然后通过命令 `getnewmultisig` 使用公钥信息生成 `m:n` 为 `1:2` 的多重签名地址。

#### 3. 交易所转出数字身份到多重签名地址
交易所通过命令 `didchangeaddress` 创建将数字身份转出到多重签名地址的交易，并使用命令 `sendrawtx` 广播交易。

## 实现
TODO
