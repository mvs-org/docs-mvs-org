---
title: 如何升级钱包？
date: 2018-06-07 10:59:46
tags: Metaverse
categories: Guide
---


# 元界钱包升级手册

一、从官网下载新版本钱包的安装包
URL: <https://mvs.org/wallet.html>

二、阅读产品发布日志了解下版本更新内容
URL: <https://docs.mvs.org/news/>

三、退出正在运行的老版本钱包，如果没有钱包正在运行则略过此步骤

四、备份钱包账户和数据表 <font color="#FF0000"><b>(重要)</b></font>
1. 备份账户
<font color="#FF0000"> <b> 注意: 请在做升级操作前备份好您所有账户的主私钥助记符（即注册账户时生成的24个单词）。
</b></font> 参考文档 [备份账户](backup-account.html#%E5%A4%87%E4%BB%BD%E4%B8%8E%E5%AF%BC%E5%85%A5%E8%B4%A6%E6%88%B7)。

2. 备份数据表
在文件浏览器中打开以下位置：
```
# Windows: Explorer
%HOMEPATH%\AppData\Roaming\Metaverse

# Mac-OSX: Finder => go to folder
~/Library/Application Support/Metaverse

# Linux(unix-like):
~/.metaverse
```
拷贝粘贴 `mainnet` 目录以作备份。

为了节省磁盘空间，可以只备份账户信息相关的数据表（这些表的表名前缀均为 `account_`）。
参考文档 [备份账户相关表](backup-account.html#%E5%A4%87%E4%BB%BD%E4%B8%8E%E5%AF%BC%E5%85%A5%E8%B4%A6%E6%88%B7%E7%9B%B8%E5%85%B3%E8%A1%A8)。

五、安装新版本钱包

可以直接进行覆盖安装，也可以先卸载老版本再安装新版本。

六、启动新版本钱包

初次启动升级程序时请不要马上退出，预留十分钟左右时间给程序进行数据库的初始化或者升级操作。如果区块开始同步了，则可以随时退出。

七、查验钱包运行状态

主要查看钱包是否正在运行，区块是否正常同步。

八、启动异常时的恢复操作，如无异常则略过此步骤

将备份的mainnet替换回来即可。此时可以重新启动新版本钱包再试一次看看能否成功运行。
如果继续失败请联系元界技术支持。
