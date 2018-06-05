---
title: 如何备份和导入账户信息?
date: 2018-06-05 13:44:21
tags: Metaverse
categories: Guide
---

请按照如下步骤来备份与导入您的账户信息：

1. <font color="#FF0000"> <b>CAUTION: PLEASE BACKUP YOUR ACCOUNT's MNEMONIC-PHRASE OF MASTER-KEY AT FIRST.
注意: 请在置操作前备份好您所有账户的主私钥助记符（即注册账户时生成的24个单词）。
</b></font> 

2. 备份账户
使用命令 `dumpkeyfile` 将账户信息导出到备份文件。
```
$ ./mvs-cli dumpkeyfile account_name password last_word path_of_backup_keyfile
```
> last_word 为注册账户时生成的24个单词的最后一个单词  
> path_of_backup_keyfile 为备份文件路径  

3. 导入账户
使用命令 `importkeyfile` 将账户信息导出到备份文件。
```
$ ./mvs-cli importkeyfile account_name password path_of_backup_keyfile
```
> path_of_backup_keyfile 为备份文件路径  