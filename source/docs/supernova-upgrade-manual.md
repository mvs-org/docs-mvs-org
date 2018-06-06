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
2. Install  
Double click the install-package on Windows or Mac to start installing.
```
# for Centos/RHEL
$ cd mvs-linux-backport-x86_64-v0.8.0
$ ./mvs-install.sh

# for Linux
$ cd mvs-linux-x86_64-v0.8.0
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
