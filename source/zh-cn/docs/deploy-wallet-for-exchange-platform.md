title: 交易所平台部署Metaverse钱包指南
comments: false
---

## 经常使用的文档
* [API-Call-List](/zh-cn/api_v2/index.html)
* [Command-line](/zh-cn/docs/command-line.html)
* [Build Wallet](/zh-cn/docs/build-linux.html)

## 标准程序
1. 在Linux服务器上部署Metaverse节点。下载 [Metaverse钱包](https://mvs.org/#download)
2. 使用mvs-cli命令执行以下步骤
```
a. 创建钱包帐户
b. 批量生成地址
```
3.  将Metaverse ETP地址导入数据库
```
a. 将Metaverse ETP地址导入到交易所数据库
b. 用户存款时将地址分配给用户
```
4. 开发程序来完成以下功能：:
```
a. 通过钱包API监视新的区块（getblock方法）
b. 基于用户信息的存款
c. 保存与交易所有关的交易记录
```
*链接到交易所网站的其他标准操作*

## Metaverse（MVS）钱包简介

MVS钱包分为 `mvsd` 和 `mvs-cli`;

mvs-cli 是供开发者使用的命令行客户端（钱包）。

mvsd 是核心钱包程序，可远程过程调用（RPC），端口默认为8820。

开发者有两种方式与钱包交互：

1. 使用CLI（命令行界面）命令。例如，您可以创建一个帐户，生成地址等。
2. 使用curl 发送 JSON-RPC 调用。例如，可将资产转移到指定的地址，获取指定块高的信息，获取指定交易的信息等。

每个MVS节点都可以选择提供一个API来检索区块链数据。这有助于区块链应用程序的开发。这些接口是通过 JSON-RPC (<http://www.jsonrpc.org/specification>) 提供的.

*若要启动提供RPC服务的节点，可以运行以下命令*
```
./mvsd 
```
**类似于比特币节点**
RPC CALL LIST详细信息请查看: <http://docs.mvs.org/zh-cn/api_v2/index.html>

这是一个由命令行控制的钱包。您可以使用命令来管理资产。其基本功能包括：创建账户，创建地址和转移资产。 

显示 mvs-cli 支持的所有命令。
```
./mvs-cli help
```
显示 mvs-cli 某个命令的帮助。
```
./mvs-cli help $command (替换$command为具体命令名称)
```

### >>> 创建帐户

帐户用于存储用户的帐户信息，这是表明用户持有资产最重要的证据。用户无需确保钱包文件和钱包密码的安全，**但必须备份助记词，一旦丢失或遗忘助记词，所有的资产都无法找回，包括ETP。请将主私钥的助记词存储在安全的地方，如抄写在纸上或存储到加密的U盘中**

交易所必须有一个在线钱包来管理用户的存款地址。 

*注意：交易所不必为每个用户创建一个帐户。在线钱包通常保存一个账户的所有存款地址。也可选择冷钱包（离线钱包）来储存地址，这样更安全。*

创建新账户使用方法请参阅：<http://docs.mvs.org/zh-cn/api_v2/account.html#getnewaccount>

### >>> 生成存款地址

钱包可以存储多个地址。交易所需要为每个用户生成一个存款地址。

基本有以下两种方法来生成存款地址：

1. 当用户第一次存入（ETP）时，程序可以动态生成ETP地址。其优点是不需要以固定的时间间隔产生地址，而缺点是需要额外开发这个功能。
2. 交易所可以提前创建一批ETP地址。当用户首次被收取ETP费用时，交易所平台为该用户分配一个ETP地址。其优点是连接速度快，不需要进一步开发，缺点是需要手动生成ETP地址。

我们建议交易所采用第二种方法，以确保交易与交易所的快速连接。

要批量生成MVS地址，可以使用以下命令：
```
./mvs-cli getnewaddress accountname accountpassword -n 1000
```
参看 <http://docs.mvs.org/zh-cn/api_v2/account.html#getnewaddress>

这些地址将显示为json响应格式。交易所需要将这些地址导入到其数据库中来分发给用户。


### >>> 用户存款和存款记录


关于用户存款，交易所需要被告知以下内容：

* Metaverse区块链只有一个主链，没有侧链，不会分叉，也不会有孤立的区块。你可以在区块浏览器查询区块信息： <https://explorer.mvs.org>.

* 在Metaverse区块链中记录的交易不能被篡改，这意味着用户确认即代表存款成功。我们建议确认密码超过30位。


* 存款地址资产数量变化时不会发出通知。元界钱包有一个接口（listtxs）来查询地址的所有交易。详情请查看 <http://docs.mvs.org/zh-cn/api_v2/transaction.html#listtxs>。

* Metaverse共享ETP和其他资产之间的地址。用户发行的其他资产（例如股票或代币）也可储存在元界上。交易所应确定用户存款时的资产类型。不将其他资产视为ETP股票或其他，也不会混淆存款和取款。资产类型需要具体情况来确定。


* Mvsd是全节点，需要在联网状态下才能同步区块。您可以通过mvs-cli或RPC-CALL中的显示状态查看同步状态，其中左侧是本地区块高度，右侧是节点区块高度。


* 对交易所来说，用户之间的资产转移不应该通过区块链来记录。通常，它直接在数据库中修改用户的余额。只有存款和取款应记录在区块链上。


''关于上述第三点''

''交易所需要编写代码来监视区块中的每笔交易，并在数据库中记录与交换地址相关的所有交易。每发生一笔存款，用户的余额应该被更新。''


## <font color=red>*警告*</font>
1. Metaverse钱包可以自动结余少量的ETP，不需要手动对余额进行分组。
2. 发送资产时，如果使用**“send”**命令，我的余额将会返还至帐户的随机地址。 **所以我们强烈建议交易所使用“sendfrom”/“sendmore”。**
3. [识别冻结的ETP交易输出](/zh-cn/docs/recognize-fronzen-ETP-transaction-outputs.html)

