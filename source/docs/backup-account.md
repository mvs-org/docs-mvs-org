---
title: How To Backup And Import Account?
date: 2018-06-05 13:44:21
tags: Metaverse
categories: Guide
---

# Backup and import single account

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
NOTICE: you must use the same password as when using dumpkeyfile.
	```
	$ ./mvs-cli importkeyfile account_name password path_of_backup_keyfile
	```
	> path_of_backup_keyfile: The path of backup file.  


# Backup and import accounts' database file

Somehow, We have to backup/import database of accounts, we can do as below:

1. Backup accounts database (without blocks)
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

2. Import accounts' database file
Just copy the backuped tables in the above step back into the `mainet` sub-directory.
NOTICE: when access your account, you must use the same username and password as in the backuped account tables.



### Solution - re-syncing from height 0 (Linux) :
```bash
# backup old mainnet directory
$ mv ~/.metaverse/mainnet ~/.metaverse/mainnet.bak

# re-build new database
$ ./mvsd -i

# import accounts database(overwirte)
$ cp -f ~/.metaverse/mainnet.bak/account_* ~/.metaverse/mainnet/

# re-start mvsd in daemon mode:
$ ./mvsd -d

# waiting for syncing completed.
$ tail -f ~/.metaverse/debug.log

```

### Solution - re-syncing from height 1270000+ (Linux) :
```bash
# backup old mainnet directory
$ mv ~/.metaverse/mainnet ~/.metaverse/mainnet.bak

# re-build new database
# use mainnet-linux-height-1273528.tar.gz (md5sum is 723f3bc0125ba658266df5e332b843f0)
$ cd ~/.metaverse
$ wget http://newmetaverse.org/mvs-download/block-data/mainnet-linux-height-1273528.tar.gz
$ tar -xzvf mainnet-linux-height-1273528.tar.gz

# import accounts database(overwirte)
$ cp -f ~/.metaverse/mainnet.bak/account_* ~/.metaverse/mainnet/

# re-start mvsd in daemon mode:
$ ./mvsd -d

# waiting for syncing completed.
$ tail -f ~/.metaverse/debug.log

```

