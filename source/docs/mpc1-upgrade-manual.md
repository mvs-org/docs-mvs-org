title: MPC1 Upgrade Manual
---

# MPC1 Upgrade Manual

The Metaverse network will be undergoing a planned hard fork at block number 1.924mil (1,924,000), which will likely occur on Monday, Feb 28, 2019.

What is a hard fork in Metaverse?

A hard fork is a change to the underlying Metaverse protocol, creating new rules to improve the system. The protocol changes are activated at a specific block number. All Metaverse clients need to upgrade, otherwise they will be stuck on an incompatible chain following the old rules.

Please follow the following steps to upgrade your client.

**CAUTION: PLEASE BACKUP YOUR ACCOUNT’s MNEMONIC-PHRASE OF MASTER-KEY AT FIRST.**

## Upgrade on desktop
1. Download MPC1 wallet from <https://mvs.org/wallet.html>
1. Install MPC1(v0.9.0) wallet.
2. Waiting for sync compeleted (a few mintues).
3. Done.

## Upgrade for platforms

### Backup Accounts (Optional)
Use cli command `dumpkeyfile` to backup your account information.
```
$ ./mvs-cli dumpkeyfile account_name password last_word path_of_backup_keyfile
$ ./mvs-cli importkeyfile account_name password path_of_backup_keyfile
```
Refers to [Backup Accounts](https://docs.mvs.org/docs/backup-account.html).

### Upgrade
Stop running the old client and uninstall, then download and install MPC1 client.

1. [Download](https://mvs.org/wallet.html)
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
Run MPC1 wallet, sync blocks from Metaverse mainnet, **Please do not exit before syncing compeleted!**
User command `getinfo` to check and see <https://explorer.mvs.org>.

