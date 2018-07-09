title: Installation for linux
comments: false
---

Please download the wallet installation package from Metaverse’s official website <https://mvs.org/wallet.html>. The wallet is now support Linux 64bit system.

There are standard and data packet versions of the installation package. The packet version comes with a database, which greatly reduces the time required for initial block syncing. We recommend that new users download and install this version; existing users are recommended to install the standard version, because the packet version may overwrite some raw data. Please choose the appropriate installation package.

**Take version v0.8.1 as an example.**

## Download and unzip
Download standard versions
```bash
# for tarballs
wget http://newmetaverse.org/mvs-download/mvs-linux-x86_64-v0.8.1.tar.gz
tar -zxf mvs-linux-x86_64-v0.8.1.tar.gz
```
## Install standard versions
```bash
cd mvs-linux-x86_64-v0.8.1
./mvs-install.sh
```

Download data packet
```bash
wget http://newmetaverse.org/mvs-download/block-data/mainnet-linux-height-1273528.tar.gz
tar -zxvf mainnet-linux-height-1273528.tar.gz
```

## Install data packet
```bash
cd metaverse-mainnet-blocks
./install.sh
```

## Run
```bash
# run 'mvsd', waiting for block synchronized. Get lastes block height from <https://explorer.mvs.org>.
# option '-d' run as daemon mode
./mvsd -d

# Get helps from mvsd
./mvsd --help

# Get helps from mvs-cli
./mvs-cli help
```

## Get started
1. Run mvs-cli in terminal.
    More mvs-cli usage information please see [mvs-cli usage](command-line.html#mvs-cli-usage)
2. Access wallet on browser.
    Default URL is `127.0.0.1:8820` (specified by `mongoose_listen` vaule in `mvs.conf`)
    More configuration information please see [Config file](config-file.html)
