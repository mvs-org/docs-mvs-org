---
title: MVS History ReleaseNotes
date: 2017-10-20 00:00:00
tags: Metaverse
categories: ReleaseNotes
---

### 0.7.5版本更新如下###
- - -
Since Beijing time 3.15 11AM ~ 3.16 8PM, MVS mainnet was under `future blocktime attack`, MVS mainnet got separated.
Attacker wrote future blocktime into each block, that caused mining difficulty drop down, then he/she controled MVS mainnet through selfish-mining.
So we decided to hard-fork at height 1030000.

MVS mainnet hard-fork already actived successfully on the safty longest chain.
explorer.mvs.org, lightwallet works well.
Please download wallet v0.7.5 to support this hard-fork to defend potential `future blocktime attack`.

![](/images/metaverse-wallet-v0.7.5-releasenotes-1.png)

After upgrade to v0.7.5, your wallet may be in 2 cases.
## CASE 1 - current height under 1030000
open v0.7.5 wallet, check current height.
Then leave it alone, waiting for may 1 hour, see whether wallet height close to the height of <https://explorer.mvs.org>.

## CASE 2 - current height over 1030000
That means you may in attacker's chain. need re-sync by below tools.
1. Stop mvsd, if running.
```bash
$ pkill -9 mvsd
```

2. Download fix-tool from here, Linux only.
```bash
$ wget  http://sfo.newmetaverse.org/mvs-download/mvs-popblocks-tool.tar.gz
$ tar -xzvf mvs-popblocks-tool.tar.gz
```

3. Execute pop tool.

Example：
```
[jowen@JOWEN popblocks]$ ls
mvs-cli  mvsd-popblock  popblock.sh
[jowen@JOWEN popblocks]$ ./popblock.sh 
step 1: start to run ./mvsd-popblock
sleep 5 seconds to wait ./mvsd-popblock start completed
please input the start height to pop from.
eg, if specified 1000000, then all blocks with height greater than or equal to 1000000 will be poped out.

the current height is
{
   "id" : 1,
   "jsonrpc" : "2.0",
   "result" : 1031285
}

please input the height to pop from :1030000

sending popblock request
{
   "id" : 1,
   "jsonrpc" : "2.0",
   "result" : null
}

popblock finished
the block height now is
{
   "id" : 1,
   "jsonrpc" : "2.0",
   "result" : 1029999
}

kill mvsd-popblock and exit
sending SIGTERM to mvsd.
[jowen@JOWEN popblocks]$
```

### 0.7.3版本更新如下###
- - -

1.   Provides developers standard JSON-RPC 2.0 call with URI: `/rpc/v2`. Refers to [API v2](/api_v2/).
2.   Compatible API calls on version older than v0.7.3 with URI: `/rpc/`.
3.   Other optimizations.
4.   Performance improvement.

### 0.7.2版本更新如下###
- - -

1.	Added an offline transaction signing function. This function is unavailable through the MVSD GUI; It is only available for createrawtx/ signrawtx/ decoderawtx/ sendrawtx RPC calls.
2.	 Accounts are no longer created when users input incorrect mnemonic words.
3.	 Network performance optimization
4.	 Users are no longer given a time estimate when using the freezing function. Instead, the period required to unlock one’s deposit is displayed in blocks. 
5.	 Optimized performance of the getnewaddress RPC call. Irrelevant to the MVSD GUI.
6.	 Added “locked_height_range” fields during transaction output of RPC calls to distinguish freezing transactions
7.	 Fixed peer connection problem in the configuration file
8.	 Display transaction message on homepage
9.	 Users must now type in their backup words (mnemonic passphrase) upon registration to confirm that they have made a backup.
10.	 Fixed WebSocket in the “advanced” function on the Internet Explorer browser
11.	 Optimized the UI

### 0.7.1版本更新如下###
- - -

1. Fix the problem that some users can’t deposit ETP;
2. Add the functionality that miners could independently determine the mining fees;
3. Add the functionality of multi-signature;
4. Fix the problem that the wallet can’t connect background procedures occasionally;
5. Display the block height of the ETP (estimated value) maturity for deposit function;
6. Improve performance of wallet.
7. Improve user experience.


### 0.7.0版本更新如下###
- - -

1.界面重新设计，全新钱包UI

2.重构多重签名命令，优化输出方式 

3.扩展send命令，发送交易时携带附加信息

4.新增账户高级备份，账户可导出到加密文件

5.优化getaccountasset命令，在资产信息中增加该资产数量及其所附属地址信息

6.优化listtxs命令提升执行性能并支持分页查看

7.优化日志系统，限制log file占用磁盘空间大小

8.优化钱包安装程序，新增程序后台运行功能

9.新增钱包程序在安装过程中初始化数据库功能

10.新增带块数据库的安装包，减少钱包同步时间





### 0.6.10版本更新如下###
- - -

1.增加多重签名功能

2.本地数据库无缝升级，无须进行多余的网络同步

3.查询性能优化

4.修复window下中文路径名导致钱包异常退出的问题

5.window环境工程整理

6.window环境增加dump文件用以反馈问题

7.增加启动选项--datadir用于人工指定区块数据存放目录

8.优化网络流量

9.修复交易发送失败

10.统一rpc异常接口

11.修复linux各个系列的兼容性问题

12.修复在更换版本之后帐号密码不匹配的问题

#### 注意事项：

1.使用0.6.9版本linux平台的钱包需要备份私钥并删除数据重新同步

2.在centos平台下编译的也需要进行如上操作

3.使用钱包rpc的用户需要对rpc接口异常返回结果需要注意，此处有升级

4.window用户在钱包客户端崩溃时可提供dump文件



本次发布为升级级别，针对钱包BUG作修正和功能性增强，最新版本请至官网 [http://mvs.org](http://mvs.org) 下载。

以上,
元界核心开发和运营团队


0.6.9 版本更新如下: 
-------------
1. 发行资产新增指定小数位数(最小交易单位)的功能；
1. 新增交易添加附加备注信息；
2. 性能和网络同步优化；
3. 修复数据库交易索引碰撞的问题；
4. 页面修复资产转移交易显示的问题；
5. 其他一些非功能性修改；

有关增加资产发行小数位数：
1)区块链已有资产发行总量默认小数位为0个，即全部为整数；
2)ETP转移不受任何影响；
3)若想使用资产转移收发含小数位数量的资产，请使用0.6.9版本。
4)若更新后浏览器不显示新版本，OSX请使用command+shift+R 更新缓存， Windows 请使用ctrl+F5更新缓存即可；


本次发布为升级级别，针对钱包BUG作修正和功能性增强，本地数据库重建索引会自动更新数据库(需重新同步区块)，请耐心等待。
最新版本请至官网 [http://mvs.org](http://mvs.org) 下载。

0.6.8 版本更新如下: 
-------------
1. 前端页面增加显示交易HASH
9. 前端页面增加指定从地址发送etp的功能
2. 修复资产发行冻结过多ETP的问题
3. 前端页面增加显示全网已发行资产
6. 增加指定块高checkpoint
7. listtxs命令按时间排序,并修复按地址查询的bug
8. sendmore命令增加指定找零地址
10. 移除忘记密码的功能
11. 其他一些非功能性修改.

0.6.8b 版本更新如下: 
1. 回退:找零随机布局到交易体
9. 前端页面功能修复

0.6.8c 版本更新如下: 
1. 修复前端页面无法转移资产的BUG

Linux 下载地址:[http://newmetaverse.org/mvs-download/mvs068c-linux-x86_64.zip](http://newmetaverse.org/mvs-download/mvs068c-linux-x86_64.zip)
OSX   下载地址:[http://newmetaverse.org/mvs-download/mvs068c-OSX-x86_64.zip](http://newmetaverse.org/mvs-download/mvs068c-OSX-x86_64.zip)
Windows下载地址:[http://newmetaverse.org/mvs-download/mvs068c-win64.zip](http://newmetaverse.org/mvs-download/mvs068c-win64.zip)

本次发布为补丁级别，针对程序BUG作修正和功能性增强，不需要重新同步块数据。


0.6.7 版本更新如下：
----------------
1. 一些性能问题修正；
2. 减小同步区块时产生的log；
3. 增加deposit到指定地址的功能；
4. 其他一些已知问题。

本次发布为补丁级别，针对程序BUG作修正和功能性增强，不涉及任何账户数据迁移。
最新版本请至官网 [http://mvs.live](http://mvs.live)下载。


0.6.6 版本更新如下:
------------------
1. 增加gettransaction命令，命令输入为transaction hash，返回该hash所对应的transaction信息以及该transaction所在的块高。
2. 修改listtx命令，修改后该命令会默认返回account的100条交易记录而不是返回account的所有记录
3. 增加utxo限制，若一个地址的utxo中含有资产，则该utxo所包含的etp是不能参与etp->etp的交易，只能用于资产交易
4. 增加etp借用功能。转移资产时，若一个地址上的etp不足支付交易费，则从该account上的其他etp充足的地址上借取etp以完成资产转移交易。
5. 修改WebUI中的一些文字提示，让其更友好。
6. 增加WebUI的错误提示内容；

Linux 下载地址:[http://newmetaverse.org/mvs-download/mvs066-linux-x86_64.tar.gz](http://newmetaverse.org/mvs-download/mvs066-linux-x86_64.tar.gz)
OSX   下载地址:[http://newmetaverse.org/mvs-download/mvs066-OSX-x86_64.tar.gz](http://newmetaverse.org/mvs-download/mvs066-OSX-x86_64.tar.gz)

本次发布为补丁级别，针对程序BUG作修正和功能性增强，不涉及任何账户数据迁移。
最新版本请至官网 [http://mvs.live](http://mvs.live) 下载。


0.6.5 版本更新如下:
------------------
一些已知问题修正。
Linux 下载地址:[http://newmetaverse.org/mvs-download/mvs065-linux-x86_64.tar.gz](http://newmetaverse.org/mvs-download/mvs065-linux-x86_64.tar.gz)
OSX   下载地址:[http://newmetaverse.org/mvs-download/mvs065-OSX-x86_64.tar.gz](http://newmetaverse.org/mvs-download/mvs065-OSX-x86_64.tar.gz)

本次发布为补丁级别，针对程序BUG作修正和功能性增强，不涉及任何账户数据迁移。
最新版本请至官网 [http://mvs.live](http://mvs.live) 下载。


0.6.4 版本更新如下:
------------------
一些已知问题修正。

本次发布为补丁级别，针对程序BUG作修正和功能性增强，需要重新同步块数据。
最新版本请至官网 [http://mvs.live](http://mvs.live) 下载。

