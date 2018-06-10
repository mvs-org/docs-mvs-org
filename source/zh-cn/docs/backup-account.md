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
使用命令 `dumpkeyfile` 将账户信息导出到备份文件。
	```
	$ ./mvs-cli dumpkeyfile account_name password last_word path_of_backup_keyfile
	```
> last_word 为注册账户时生成的24个单词的最后一个单词  
> path_of_backup_keyfile 为备份文件路径  

3 . 导入账户
使用命令 `importkeyfile` 将账户信息导出到备份文件。
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

