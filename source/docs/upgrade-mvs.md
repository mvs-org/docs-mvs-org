---
title: How to Upgrade MVS Wallet?
date: 2018-06-07 10:59:46
tags: Metaverse
categories: Guide
---


# MVS Wallet Upgrade Manual

**1 Download the installation package from Metaverse’s official website**
URL: <https://mvs.org/wallet.html>

**2 Read the release notes**
URL: <https://docs.mvs.org/news/>

**3 Exit the running old wallet (ignore this step if no one is running)**

**4 Backup account and database** <font color="#FF0000"><b>(IMPORTANT)</b></font>
**4.1 Backup account**
<font color="#FF0000"><b>CAUTION: PLEASE BACKUP YOUR ACCOUNT's MNEMONIC-PHRASE OF MASTER-KEY AT FIRST.
</b></font> Ref. [How To Backup And Import Account](backup-account.html#Backup-and-import-account)

**4.2 Backup database**
Open or enter the following directory:
```
# Windows: Explorer
%HOMEPATH%\AppData\Roaming\Metaverse

# Mac-OSX: Finder => go to folder
~/Library/Application Support/Metaverse

# Linux(unix-like):
~/.metaverse
```
Copy and paste the whole `mainnet` directory as a backup.

In order to save disk space, you can only backup the account related tables whose table name have prefix `account_`.  Ref. [How To Backup And Import Account Related Tables](backup-account.html#Backup-and-import-tables)

**5 Install latest version of Metaverse full node wallet**

You can re-install the new wallet by overlay installation,
or uninstall the old wallet and then install the new wallet.

**6 Startup the new wallet**

In the intial startup of the new wallet, do not exit soon after startup.
Please give 10 minutes or so for the wallet to init or upgrade the database.
When the block is beginning to synchronize, you can exit whenever you want.

**7 Check the running status of the wallet**

Mainly check if the wallet is running, and check if the blocks is synchronizing normally.

**8 Recover and retry when failed (ignore this step if has no problem in the previous steps)**

Just replace the `mainet` database with the backup one, and retry to run the new wallet.
If still has problem, please contact the MVS technical support.
