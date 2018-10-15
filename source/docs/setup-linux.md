title: Installation for linux
comments: false
---

Please download the latest wallet installation package from Metaverse’s official website <https://mvs.org/wallet.html>. The wallet is now support Linux 64 bit system. At least 10 GB of free disk space is required for the installation.

**Take version v0.8.4 as an example.**

## Download and unzip
Download standard versions
```bash
# for tarballs
wget https://s3-us-west-1.amazonaws.com/wallet.mvs.org/download/mvs-linux-x86_64-v0.8.4.tar.gz
tar -zxf mvs-linux-x86_64-v0.8.4.tar.gz
```

## Install standard versions
```bash
cd mvs-linux-x86_64-v0.8.4
./mvs-install.sh
```

## Run
```bash
# run 'mvsd', waiting for block synchronized. Get lastes block height from <https://explorer.mvs.org>.
# option '-d' run as daemon mode
mvsd -d

# Get helps from mvsd
mvsd --help

# Get helps from mvs-cli
mvs-cli help
```

## Download database package to reduces the time required for initial block syncing
Please refer to [re-syncing from height 1270000+](https://docs.mvs.org/docs/backup-account.html#Solution-2-re-syncing-from-height-1270000)

## Get started
1. Run mvs-cli in terminal.
    More mvs-cli usage information please see [mvs-cli usage](command-line.html#mvs-cli-usage)
2. Access wallet on browser.
    Default URL is `127.0.0.1:8820` (specified by `mongoose_listen` vaule in `mvs.conf`)
    More configuration information please see [Config file](config-file.html)
