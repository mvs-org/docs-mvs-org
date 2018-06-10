---
title: How To Backup And Import Account?
date: 2018-06-05 13:44:21
tags: Metaverse
categories: Guide
---

# Backup and import account

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


# Backup and import tables

If you want to backup and import your account related tables, please do as beblow:

1. Backup account related tables
	Copy and paste the below into the path search function on your device's explorer:
	```
	# Windows: Explorer
	%HOMEPATH%\AppData\Roaming\Metaverse
	
	# Mac-OSX: Finder => go to folder
	~/Library/Application Support/Metaverse
	
	# Linux(unix-like):
	~/.metaverse
	```
	Copy and paste the account related tables in the sub-directory `mainnet` as a backup.
	All those tables' name have prefix `account_`, include the followings:
	```
	account_address_rows
	account_address_table
	account_asset_row
	account_asset_table
	account_table
	```
2. Import account related tables
Just copy the backuped tables in the above step back into the `mainet` sub-directory.
