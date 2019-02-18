title: MPC1 Upgrade Manual
---

# MPC1 Upgrade Manual

The Metaverse network will be undergoing a planned hard fork upgrading for MPC1 at block number 1.924mil (1,924,000), which will likely occur on Monday, Feb 28, 2019.

What is a hard fork upgrade in Metaverse?

A hard fork is a change to the underlying Metaverse protocol, creating new rules to improve the system. The protocol changes are activated at a specific block number. All Metaverse clients need to upgrade, otherwise they will be stuck on an incompatible chain following the old rules.

Please follow the following steps to upgrade your client.

**CAUTION: PLEASE BACKUP YOUR ACCOUNT’s MNEMONIC-PHRASE OF MASTER-KEY AT FIRST.**

## Upgrade Manual for desktop users
1. Download MPC1 wallet from <https://mvs.org/wallet.html>
1. Install MPC1(v0.9.0) wallet.
2. Waiting for sync compeleted (a few mintues).
3. Done.

## Upgrade Manual for platforms developers

### Dump and Backup Accounts (Optional)
Use cli command `dumpkeyfile` to backup your account information.
```
$ ./mvs-cli dumpkeyfile account_name password last_word path_of_backup_keyfile
$ ./mvs-cli importkeyfile account_name password path_of_backup_keyfile
```
Refers to [Backup Accounts](https://docs.mvs.org/docs/backup-account.html).

### Upgrading Procedures
If mvsd is still running, please stop it, and replace this binary with latest release (v0.9.0).

1. [Download latest release](https://mvs.org/wallet.html)
```
# Eg: Linux
$ wget http://newmetaverse.org/mvs-download/mvs-linux-x86_64-v0.9.0.tar.gz
$ tar -zxf mvs-linux-x86_64-v0.9.0.tar.gz
```
2. Installation
```
# Eg: Linux
$ cd mvs-linux-x86_64-v0.9.0
$ ./mvs-install.sh
```
References: <https://docs.mvs.org/docs/setup-linux.html>

### Sync
Run latest wallet binary, sync blocks from Metaverse mainnet, Use command `getinfo` to check height and compare from <https://explorer.mvs.org>.

### MPC1 New transactions
MPC1 uses some new transactions. If you parse transations in your project, please refer to [MPC1 New transactions](https://docs.mvs.org/zh-cn/developers/mpc1-new-transactions.html) to known what you need.