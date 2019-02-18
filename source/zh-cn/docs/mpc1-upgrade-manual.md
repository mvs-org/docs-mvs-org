title: MPC1 升级手册
---

# MPC1 升级手册
`MPC1` 版钱包实现了 `PoW & PoS` 混合共识与 MST 挖矿等新特性。在 `MPC1` 版钱包启用之后，使用老版本钱包发布的交易有可能不能在 `MPC1` 版钱包中通过验证，因此元界决定基于 `MPC1` 版进行硬分叉，分叉时间在第 1924000 个区块高度，大约在2019年2月28日。

什么是硬分叉？

硬分叉是对元界底层协议的改变，创建新的规则，完善整个系统。协议改变在某个特定区块上被激活。所有的元界客户端都需要升级，否则将停留在遵循旧规则的老链上。

请按照如下说明进行升级操作。

**注意: 请在操作前备份好您所有账户的主私钥助记符（即注册账户时生成的24个单词）**

## 普通用户
1. 您只需卸载旧版桌面钱包，然后下载安装[`MPC1 v0.9.0`](https://mvs.org/wallet.html)新钱包即可。
2. 注意安装后首次运行请等待几分钟同步至最新区块高。

## 平台升级

### 备份(可选)
使用命令 `dumpkeyfile` 命令备份账户信息。
```
$ ./mvs-cli dumpkeyfile account_name password last_word path_of_backup_keyfile
$ ./mvs-cli importkeyfile account_name password path_of_backup_keyfile
```

参考文档 [备份账户](https://docs.mvs.org/zh-cn/docs/backup-account.html)。

### 升级
停止运行当前钱包程序并卸载，然后下载并安装 `MPC1` 版钱包程序。

1. 下载
```
# 找到您对应的操作系统，例如Linux平台：
$ wget http://newmetaverse.org/mvs-download/mvs-linux-x86_64-v0.9.0.tar.gz
$ tar -zxf mvs-linux-x86_64-v0.9.0.tar.gz

```
2. 安装  
```
$ cd mvs-linux-x86_64-v0.9.0
$ ./mvs-install.sh
```

参考<https://docs.mvs.org/zh-cn/docs/setup-linux.html>

### 同步
运行全节点钱包，同步区块数据，然后使用命令 `getinfo` 查看钱包状态。
**安装后首次运行，请不要直接退出程序，请等待同步区块到最新!**

### MPC1 新增交易说明
MPC1 新增了一些交易构造，如果您在项目中需要自己解析交易，请阅读[MPC1 新增交易说明](https://docs.mvs.org/zh-cn/developers/mpc1-new-transactions.html)。
