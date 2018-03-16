title: Wallet v0.7.5 Release Notes
comments: false
---

Since Beijing time 3.15 11PM ~ 3.16 4PM, MVS mainnet are under 'future blocktime attack', MVS mainnet got separated.
Attacker wrote future blocktime into each block, that caused mining difficulty drop down, then he/she control mainnet with selfish-mining.
So we decide to hard-fork on height 1030000.

![](/images/metaverse-wallet-v0.7.5-releasenotes-1.png)

Now explorer.mvs.org, lightwallet is work well.

Your wallet may be in 2 cases.
## CASE 1 - current height under 1030000
start v0.7.5 wallet, then startup, you will see current height.
Then leave it alone, waiting for a while, see if the height close to explorer.mvs.org

## CASE 2 - current height over 1030000
That means you may in attacker's chain. need re-sync by below tools.
1. Stop mvsd, if running.
```bash
$ pkill -9 mvsd
```

2. Download fix-tool from here, Linux only.
```bash
$ wget  http://sfo.newmetaverse.org/mvs-download/mvs-popblocks-tool.tar.gz
$ tar -xzvf mvs-popblocks-tool.tar.gz
```

5. Execute pop tool.

Example：
```
[jowen@JOWEN popblocks]$ ls
mvs-cli  mvsd-popblock  popblock.sh
[jowen@JOWEN popblocks]$ ./popblock.sh 
step 1: start to run ./mvsd-popblock
sleep 5 seconds to wait ./mvsd-popblock start completed
please input the start height to pop from.
eg, if specified 1000000, then all blocks with height greater than or equal to 1000000 will be poped out.

the current height is
{
   "id" : 1,
   "jsonrpc" : "2.0",
   "result" : 1031285
}

please input the height to pop from :1030000

sending popblock request
{
   "id" : 1,
   "jsonrpc" : "2.0",
   "result" : null
}

popblock finished
the block height now is
{
   "id" : 1,
   "jsonrpc" : "2.0",
   "result" : 1029999
}

kill mvsd-popblock and exit
sending SIGTERM to mvsd.
[jowen@JOWEN popblocks]$
```

## Metaverse Full Node Wallet 0.7.5 Release Notes
Download official wallet binary here: <https://mvs.org/wallet.html>


If you have any issue, please contact us.
Thank you for your continuous support! 
Metaverse Dev Team.

