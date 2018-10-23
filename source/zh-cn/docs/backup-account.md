---
title: 如何备份和导入账户信息?
date: 2018-06-05 13:44:21
tags: Metaverse
categories: Guide
---

# 备份与导入账户
请按照如下步骤来备份与导入您的账户信息：

1 . <font color="#FF0000"> <b>CAUTION: PLEASE BACKUP YOUR ACCOUNT's MNEMONIC-PHRASE OF MASTER-KEY AT FIRST.
注意: 请首先备份好您所有账户的主私钥助记符（即注册账户时生成的24个单词）。
</b></font> 

2 . 备份账户
使用命令 `dumpkeyfile` 逐个将账户信息导出到备份文件。
    ```
    $ ./mvs-cli dumpkeyfile account_name password last_word path_of_backup_keyfile
    ```
> last_word 为注册账户时生成的24个单词的最后一个单词  
> path_of_backup_keyfile 为备份文件路径  

3 . 导入账户
使用命令 `importkeyfile` 从备份文件逐个导入账户信息。
注意，导入时需要使用与导出时一致的账户密码。
    ```
    $ ./mvs-cli importkeyfile account_name password path_of_backup_keyfile
    ```
> path_of_backup_keyfile 为备份文件路径  

# 备份与导入账户相关表
请按照如下步骤来备份与导入您的账户信息相关的表：
1 . 备份账户相关的表
在文件浏览器中输入以下位置进入相关目录:
    ```
    # Windows: Explorer
    %HOMEPATH%\AppData\Roaming\Metaverse
    
    # Mac-OSX: Finder => go to folder
    ~/Library/Application Support/Metaverse
    
    # Linux(unix-like):
    ~/.metaverse
    ```
通过拷贝粘贴方式备份子目录 `mainnet` 中的账户相关表，
这些表都是以 `account_` 为前缀，包括如下几张表:
    ```
    account_address_rows
    account_address_table
    account_asset_row
    account_asset_table
    account_table
    ```

2 . 导入账户相关的表
只需将上一步备份好的账户相关表拷贝加 `mainnet` 子目录即可。
注意，使用时需要记住备份表中的账户名和密码。


# 重新同步区块
以下为数据库出现问题时重新同步的两种解决方案

### 方案一 - 重新从块高0同步(Linux)
```bash
# 备份老的 mainnet 目录
$ mv ~/.metaverse/mainnet ~/.metaverse/mainnet.bak

# 重建新的数据库
$ ./mvsd -i

# 导入账户相关的表(覆盖)
$ cp -f ~/.metaverse/mainnet.bak/account_* ~/.metaverse/mainnet/

# 重新启动 mvsd （以守护进程方式运行）
$ ./mvsd -d

# 等待同步完成，查看日志
$ tail -f ~/.metaverse/debug.log

```

### 方案二 - 重新从块高1270000+同步(Linux)

#### Linux
##### 自动方式（推荐）
```bash
# 下载最新数据包
$ wget http://newmetaverse.org/mvs-download/block-data/mvs-block-data-for-linux.tar.gz

# 解压数据包
$ tar -xzvf mvs-block-data-for-linux.tar.gz

# 执行数据拷贝脚本：默认数据目录路径为： ~/.metaverse/mainnet
# 如果您的数据目录不是默认的路径，请将数据目录路径当作参数传入：
# ./copy-block-data.sh PATH_TO_BLOCK_DATA
$ ./copy-block-data.sh
```

##### 手动方式
```bash
# 备份老的 mainnet 目录
$ mv ~/.metaverse/mainnet ~/.metaverse/mainnet.bak

# 重建新的数据库
# 下载 mainnet-linux-height-1473277.tar.gz 区块数据包 (md5sum 为 54c996066d1249eca25e28babc3940b7)
$ cd ~/.metaverse
$ wget http://newmetaverse.org/mvs-download/block-data/mainnet-linux-height-1473277.tar.gz
$ tar -xzvf mainnet-mainnet-linux-height-1473277.tar.gz

# 导入账户相关的表(覆盖)
$ cp -f ~/.metaverse/mainnet.bak/account_* ~/.metaverse/mainnet/

# 重新启动 mvsd （以守护进程方式运行）
$ ./mvsd -d

# 等待同步完成，查看日志
$ tail -f ~/.metaverse/debug.log

```

#### Mac OS
##### 自动方式（推荐）
1. 打开终端：启动台->其它->终端
2. 执行如下命令：
```bash
# 下载最新数据包
$ wget http://newmetaverse.org/mvs-download/block-data/mvs-block-data-for-mac.tar.gz
# 解压数据包
$ tar -xzvf mvs-block-data-for-linux.tar.gz
# 执行数据拷贝脚本：默认数据目录路径为： ~/Library/Application Support/Metaverse/mainnet
# 如果您的数据目录不是默认的路径，请将数据目录路径当作参数传入：
# ./copy-block-data.sh PATH_TO_BLOCK_DATA
$ ./copy-block-data.sh
```

##### 手动方式
1. 停止运行钱包程序，升级到[最新版本](https://mvs.org/wallet.html)
2. 在 `~/Library/Application Support/Metaverse` 目录下新建 `account_bak` 目录；备份账户信息：拷贝 `mainnet` 中的账户相关文件到 `account_bak` 下。这些文件都是以 `account_` 为前缀，总共拷贝五个文件： `account_address_rows`, `account_address_table`, `ccount_asset_row`, `account_asset_table` 和 `account_table`；
3. 重命名 `mainnet` 目录为 `mainnet_bak`；
4. 下载区块数据包[mainnet-macOSX-height-1308526.tar.gz](https://newmetaverse.org/mvs-download/block-data/mainnet-macOSX-height-1308526.tar.gz)到 `~/Library/Application Support/Metaverse` 下，并解压到该目录下；
5. 恢复账户信息：覆盖拷贝 `account_bak` 下的所有文件到 `mainnet` 下。
6. 启动钱包程序，等待同步到最新区块。


#### Windows
##### 自动方式（推荐）
1. 下载最新数据包：[mvs-block-data-for-windows.zip](http://newmetaverse.org/mvs-download/block-data/mvs-block-data-for-windows.zip)
2. 解压，然后进入解压后的目录： `mvs-block-data-for-windows`
3. 执行拷贝数据脚本：  
 > 如果您的数据目录路径为默认路径： `%HOMEPATH%\AppData\Roaming\Metaverse`，右击 `copy-block-data.ps1`，选择菜单 `使用 PowerShell 运行`。若命令行出现执行策略更改选择菜单：`是(Y)`、`全是(A)` 等，请输入 `A` 回车即可。  
 > 如果您的数据目录路径不为默认路径：请以管理员身份运行 `Window Power Shell`，然后输入命令 `Set-ExecutionPolicy Unrestricted` 回车，在执行策略更改选择菜单：`是(Y)`、`全是(A)` 等界面，请输入 `A` 回车，然后 `cd` 到解压后的目录，请将数据目录路径当作参数传入脚本执行：`copy-block-data.sh PATH_TO_BLOCK_DATA`

##### 手动方式
1. 停止运行钱包程序，升级到[最新版本](https://mvs.org/wallet.html)
2. 重命名 `C:\Users\%USER_NAME%\AppData\Roaming\Metaverse\mainnet` 为 `C:\Users\%USER_NAME%\AppData\Roaming\Metaverse\mainnet_bak`
3. 下载区块数据包[mainnet-windows-height-1475846.zip](https://newmetaverse.org/mvs-download/block-data/mainnet-windows-height-1475846.zip)，保存为 `C:\Users\%USER_NAME%\AppData\Roaming\Metaverse\mainnet-windows-height-1475846.zip`
4. 解压 `mainnet-windows-height-1475846.zip`
5. 从 `mainnet_bak` 目录下拷贝所有以 `account_` 开头的文件到目录 `mainnet`下。总共拷贝五个文件： `account_address_rows`, `account_address_table`, `account_asset_row`, `account_asset_table` 和 `account_table`
6. 启动钱包程序，等待同步到最新区块。