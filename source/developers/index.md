title: 底层技术概要介绍
comments: false
---

# 实现基础
元界代码主要基于[libbitcoin](https://github.com/libbitcoin)修改实现。
我们集成了以下8个模块：
* [libbitcoin](https://github.com/libbitcoin/libbitcoin)
* [libbitcoin-explorer](https://github.com/libbitcoin/libbitcoin-explorer)
* [libbitcoin-database](https://github.com/libbitcoin/libbitcoin-database)
* [libbitcoin-blockchain](https://github.com/libbitcoin/libbitcoin-blockchain)
* [libbitcoin-server](https://github.com/libbitcoin/libbitcoin-server)
* [libbitcoin-network](https://github.com/libbitcoin/libbitcoin-network)
* [libbitcoin-protocol](https://github.com/libbitcoin/libbitcoin-protocol)
* [libbitcoin-node](https://github.com/libbitcoin/libbitcoin-node)
* [libbitcoin-consensus](https://github.com/libbitcoin/libbitcoin-consensus)

MVS在开发时，发现libbitcoin并未提供以下2个模块：HTTPServer,Mining。所以：
MVS集成了Ethererum的挖矿算法： [ETHASH](https://github.com/ethereum/ethash)
MVS集成了一个轻量级的嵌入式HTTPServer: [mongoose](https://github.com/cesanta/mongoose) 

元界在开发时的版本与libbitcoin当前版本已经有较大差异，核心开发者也作了大量修改，故以上仅作参考学习。
元界会在后续版本尽量与libbitcoin主体代码保持一致，元界核心开发组和libbitcoin共同维护。

# 元界全节点钱包架构图
总体架构图
![](/zh-cn/developers/images/mvs-architecture.png)

库编译依赖关系
![](/zh-cn/developers/images/mvs-libraries.png)

元界区块链账本结构
![](/zh-cn/developers/images/ledger-struct.png)

