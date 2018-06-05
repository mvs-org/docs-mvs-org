---
title: How To Backup And Import Account?
date: 2018-06-05 13:44:21
tags: Metaverse
categories: Guide
---

If you want to backup and import your account, please do as beblow:

1. <font color="#FF0000"> <b>CAUTION: PLEASE BACKUP YOUR ACCOUNT's MNEMONIC-PHRASE OF MASTER-KEY AT FIRST.</b></font> 

2. Backup Account
Using cli command `dumpkeyfile` to export your account information to backup file.
```
$ ./mvs-cli dumpkeyfile account_name password last_word path_of_backup_keyfile
```
> last_word: The last word of your account's mnemonic-phrase.  
> path_of_backup_keyfile: The path of backup file.  

3. Import Account
Using cli command `importkeyfile` to import your account information from backup file.
```
$ ./mvs-cli importkeyfile account_name password path_of_backup_keyfile
```
> path_of_backup_keyfile: The path of backup file.  