title: PoS 与 MST 挖矿指南
comments: true
---

# 下载 v0.9.0 MPC1 测试版
* [For Linux](http://newmetaverse.org/mvs-download/testnet/mvs-linux-x86_64-v0.9.0.tar.gz)  
* [For MacOS](http://newmetaverse.org/mvs-download/testnet/mvs-macOSX-x86_64-v0.9.0.pkg)  
* [For Windows](http://newmetaverse.org/mvs-download/testnet/mvs-win64-v0.9.0.exe)
* 
# PoS 挖矿

## 简介
在“创世之柱”的第一阶段，我们将实施 `PoW` + `PoS` 的混合共识，这将有效地防止自私挖矿和 51％ 攻击。由于 `PoW` 和 `PoS` 矿工都会以随机顺序生成区块，因此 `Nothing at Stake` 和 `Long Range attacks` 将不会发生。对于 `PoW` 矿工来说，采矿难度的调整速度要优于 `SuperNova` 版本，总体来说网络的稳定性会更高，由于哈希算力爆炸式增长而造成的不自然快速出块现象也将不复存在。

## 如何进行 POS 挖矿
矿工需要满足一定的约束条件才能进行 `PoS` 挖矿。具体操作如下：
1. 注册数字身份；
2. 用该数字身份调用 `lock` 命令无利息锁仓至少 1000 `ETP`，锁仓高度至少为 100000 块高；
3. 该数字身份需要持有至少一个不低于 1000 ETP 的 `UTXO`，且经历了 1000 块的成熟；
4. 用该数字身份调用 `startmining` 附加 `-c pos`

## 提高 POS 挖矿成功率
用于挖矿的数字身份下持有超过 1000 `ETP` 的 `UTXO` 越多，`PoS` 挖矿的成功率就越大。

## 全节点操作流程
![PoS挖矿全节点操作流程](/images/mining/zh/pos_mst_mining_overview.png)

# MST 挖矿

## 简介
除了 `ETP` 挖矿以外，允许 `MST` 通过 `PoW` 和 `PoS` 进行挖矿。`MST` 挖矿使得 `MST` 发行人更自由地设计代币，从而为 `MST` 代币标准提供更大的灵活性，并提供更多创造空间，将产业与区块链完美结合。

## 如何进行 MST 挖矿

### MST 发行方
一个 `MST` 资产如果想要利用元界的算力进行挖矿，需要在 `issue` 该资产时，指定 `MST` 挖矿的参数 `--subsidy`，该参数格式为：`initial:unit32,interval:unit32,base:float`，MST 挖矿奖励计算公式为：`initial * pow(base, (block_height/interval))`。

#### 示例：
参数：
`./mvs-cli issue testacc testacc MST.MINING -s "initial:300000000,interval:500000,base:0.95"`

MST 挖矿奖励 = 300000000 * pow(0.95, (当前块高 - 资产首次发行时的块高) / 500000)。

#### 全节点操作示例
![MST挖矿全节点操作流程](/images/mining/zh/mst_mining_create_asset.png)

### 矿工
矿工在调用 `startmining` 附加 `--symbol` 参数指定想要挖矿的 `MST` 的名称即可。

