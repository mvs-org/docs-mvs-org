---
title: How To Reset Metaverse Environment?
date: 2017-04-18 13:44:21
tags: Metaverse
categories: Guide
---

If you can't startup Metaverse full node wallet, please do as beblow:

1. <font color="#FF0000"> <b>CAUTION: PLEASE BACKUP YOUR ACCOUNT's MNEMONIC-PHRASE OF MASTER-KEY AT FIRST.
注意: 请在做重置操作前备份好您所有账户的主私钥助记符（即注册账户时生成的24个单词）。
</b></font> 

2. Uninstall Metaverse wallet from your device.
Copy and paste the below into the path search function on your device's explorer:
```
# Windows: Explorer
%HOMEPATH%\AppData\Roaming\Metaverse

# Mac-OSX: Finder => go to folder
~/Library/Application Support/Metaverse

# Linux(unix-like):
~/.metaverse
```
Rename the 'Metaverse' folder as 'Metaverse.bak'. 

3. Install latest version of Metaverse full node wallet.
