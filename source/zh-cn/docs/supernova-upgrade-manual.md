---
title: Super Nova 升级手册
---

## Super Nova 升级手册
`Super Nova` 版钱包增加了数字身份、证书、MIT、定量以及固定通胀率增发等新特性。在 `Super Nova` 版钱包启用之后，使用老版本钱包发布的交易有可能不能在 `Super Nova` 版钱包中通过验证，因此元界决定基于 `Super Nova` 版进行硬分叉，分叉时间在第 1270000 个区块高度，大约在2018年6月18日。

什么是硬分叉？

硬分叉是对元界底层协议的改变，创建新的规则，完善整个系统。协议改变在某个特定区块上被激活。所有的元界客户端都需要升级，否则将停留在遵循旧规则的老链上。

请按照如下说明进行升级操作。

**注意: 请在操作前备份好您所有账户的主私钥助记符（即注册账户时生成的24个单词）**

### 备份
使用命令 `dumpkeyfile` 命令备份账户信息。
```
$ ./mvs-cli dumpkeyfile account_name password last_word path_of_backup_keyfile
```

然后[重置钱包](https://docs.mvs.org/zh-cn/docs/reset-mvs.html)。

参考链接：  
1. https://docs.mvs.org/zh-cn/docs/reset-mvs.html  
2. https://docs.mvs.org/zh-cn/docs/backup-account.html

### 升级
停止运行当前钱包程序并卸载，然后下载并安装 `Super Nova` 版钱包程序。

1. 下载
```
# for Centos/RHEL, MD5: fde128f36838f9b2a74ebf5528bd1264
$ wget http://newmetaverse.org/mvs-download/mvs-linux-backport-x86_64-v0.8.0.tar.gz
$ tar -zxf mvs-linux-backport-x86_64-v0.8.0.tar.gz

# for Linux, MD5: 1d97d188dd17cb3182758d5abc834340
$ wget http://newmetaverse.org/mvs-download/mvs-linux-x86_64-v0.8.0.tar.gz
$ tar -zxf mvs-linux-x86_64-v0.8.0.tar.gz

# for Windows, MD5: 46907900131b04d8d4d46ce4a7196211
http://newmetaverse.org/mvs-download/mvs-win64-v0.8.0.exe

# for Mac OS, MD5: 032d31f9bb2db907e1bd374ba155197e
http://newmetaverse.org/mvs-download/mvs-macOSX-x86_64-v0.8.0.pkg
```
2. 安装  
Windows 和 Mac 系统双击安装包运行。
```
# for Centos/RHEL
$ cd mvs-linux-backport-x86_64-v0.8.0
$ ./mvs-install.sh

# for Linux
$ cd mvs-linux-x86_64-v0.8.0
$ ./mvs-install.sh
```

参考链接：https://docs.mvs.org/zh-cn/docs/setup-linux.html

### 同步
运行全节点钱包，同步区块数据，然后使用命令 `importkeyfile` 导入备份的账户信息。**在首次数据同步之前，请不要退出程序，建议同步到最新块高之后再进行其他操作!**
```
$ ./mvsd -d
$ ./mvs-cli importkeyfile account_name password path_of_backup_keyfile
```

参考链接：https://docs.mvs.org/zh-cn/docs/setup-linux.html
