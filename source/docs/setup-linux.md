title: Installation for linux
comments: false
---

Take version v0.7.1 as an example.

## Download and unzip
```bash
wget http://newmetaverse.org/mvs-download/mvs-linux-x86_64-v0.7.1.zip
unzip mvs-linux-x86_64-v0.7.1.zip
```

## Install
```bash
./mvs-install.sh
```

## Run
```bash
# run 'mvsd', waiting for block synchronized. Get lastes block height from <https://explorer.mvs.org>.
# option '-d' run as daemon mode
./mvsd -d

# Get helps from mvsd
./mvsd help

# Get helps from mvs-cli
./mvs-cli help
```

## Get started
1. Run mvs-cli in terminal.
2. Access wallet on browser.
