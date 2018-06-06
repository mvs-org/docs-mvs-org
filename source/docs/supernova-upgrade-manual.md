---
title: Super Nova Upgrade Manual
---

## Super Nova Upgrade Manual

The Metaverse network will be undergoing a planned hard fork at block number 1.27mil (1,270,000), which will likely occur on Monday, June 18, 2018.

What is a hard fork in Metaverse?

A hard fork is a change to the underlying Metaverse protocol, creating new rules to improve the system. The protocol changes are activated at a specific block number. All Metaverse clients need to upgrade, otherwise they will be stuck on an incompatible chain following the old rules.

Please follow the following steps to upgrade your client.

**CAUTION: PLEASE BACKUP YOUR ACCOUNT’s MNEMONIC-PHRASE OF MASTER-KEY AT FIRST.**

### Backup
Use cli command `dumpkeyfile` to backup your account information.
```
$ ./mvs-cli dumpkeyfile account_name password last_word path_of_backup_keyfile
```

Then [Reset MVS Wallet](https://docs.mvs.org/docs/reset-mvs.html).

References:  
1. https://docs.mvs.org/docs/reset-mvs.html  
2. https://docs.mvs.org/docs/backup-account.html

### Upgrade
Stop running the old client and unstall, then download and install Super Nova client.

1. Download
```
# for Centos, MD5: 897c7259c1b5fb9b7e723a19cde67520
$ wget http://newmetaverse.org/mvs-download/mvs-centos-x86_64-v0.8.0.tar.gz
$ tar -zxf mvs-centos-x86_64-v0.8.0.tar.gz

# for Linux, MD5: 23b40c9f3aa23ed1de5ac7ab6a3c21f2
$ wget http://newmetaverse.org/mvs-download/mvs-linux-x86_64-v0.8.0.tar.gz
$ tar -zxf mvs-ubuntu-x86_64-v0.8.0.tar.gz

# for Windows, MD5: 899c11c3b7c68c8941cad6cc3ae4ad42
http://newmetaverse.org/mvs-download/mvs-win64-v0.8.0.exe

# for Mac OS, MD5: 731b4e0aa76fd4269edba570f2fd3934
http://newmetaverse.org/mvs-download/mvs-macOSX-x86_64-v0.8.0.pkg
```
2. Install  
Double click the install-package on Windows or Mac to start installing.
```
# for Centos
$ cd mvs-centos-x86_64-v0.8.0
$ ./mvs-install.sh

# for Linux
$ cd mvs-ubuntu-x86_64-v0.8.0
$ ./mvs-install.sh
```

References: 
https://docs.mvs.org/docs/setup-linux.html

### Sync
Run Super Nova client, sync data from Metaverse network, then use cli command `importkeyfile` to import your account. **Please do not exit before syncing data!**
```
$ ./mvsd -d
$ ./mvs-cli importkeyfile account_name password path_of_backup_keyfile
```

References: 
https://docs.mvs.org/docs/setup-linux.html
