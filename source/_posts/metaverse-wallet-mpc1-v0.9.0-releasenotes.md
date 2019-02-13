title: Wallet MPC1(v0.9.0) Release Notes
comments: false
---

## CAUTION
MPC1 is a hard-fork version which upgrades MVS mainnet protocol, new features will be actived at height **1,924,000**.
After height 1,924,000, if you do not upgrade (only full-node, Desktop/Linux), MVS wallet no blocks synchronizing.
Please refer to [Manual of upgrading to MPC1](https://docs.mvs.org/docs/mpc1-upgrade-manual.html)

<font color="#FF0000"> <b>
After wallet program upgraded, please waiting for synchronizing to the latest height, DO NOT EXIT. 
当钱包程序升级以后，请等待区块同步到最新，请勿直接退出；
</b></font>

## Metaverse Full Node Wallet 0.9.0 Release Notes

### New Features
1. Supports PoW & PoS
2. Supports MST mining
3. Supports [BIP65](https://github.com/bitcoin/bips/blob/master/bip-0065.mediawiki).
4. Supports [BIP68](https://github.com/bitcoin/bips/blob/master/bip-0068.mediawiki).
5. Supports [BIP112](https://github.com/bitcoin/bips/blob/master/bip-0112.mediawiki).
6. Add new cli commands: lock, getlocked, getstakeinfo.
7. Improve listassets to query cert by type.

### Tech & Bugfix
1. [Custom config file](https://github.com/mvs-org/metaverse/issues/336)
2. [Mining difficulty adjustment](https://github.com/mvs-org/metaverse/issues/325)
3. Remove deposit.

### PoS & MST Mining
Please refer to [PoS & MST Mining](https://docs.mvs.org/docs/pillars.html)

### Support
If you have any issue, please contact us.
Thank you for your continuous support! 
Metaverse Dev Team.
