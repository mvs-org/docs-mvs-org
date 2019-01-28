title: Guide to PoS and MST mining 
comments: true
---

# Download v0.9.0 for MPC1 test
* [For Linux](https://s3-us-west-1.amazonaws.com/wallet.mvs.org/download/testnet/mvs-linux-x86_64-v0.9.0.tar.gz)  
* [For MacOS](https://s3-us-west-1.amazonaws.com/wallet.mvs.org/download/testnet/mvs-macOSX-x86_64-v0.9.0.pkg)  
* [For Windows](https://s3-us-west-1.amazonaws.com/wallet.mvs.org/download/testnet/mvs-win64-v0.9.0.exe)

# PoS Mining

## How to start PoS mining
Please follow the steps to start PoS mining:
1. Register a avatar.
2. Lock at least 1000 `ETP` by call `lock` with the avatar. The minimum lock height range is 100000.
3. The avatar should holds at least one `UTXO` which has at least 1000 `ETP` and over 1000 height maturity. 
4. `startmining` with option `-c pos`.

## Tips
It is easy to mine PoS block for avatar that has many `UTXO`s which has at least 1000 `ETP`.

## Operations on fullnode wallet 
![Operations on fullnode wallet](/images/mining/en/pos_mst_mining_overview.png)

# MST Mining

## How to start MST mining

### MST issuer
`MST` issuer should specify the `MST` mining subsidy parameters(`--subsidy`) when he issue a `MST` if he want the `MST` to be mined.

The format of `--subsidy` parameter is `initial:unit32,interval:unit32,base:float`. 

And `MST` mining reword is calculated by：`initial * pow(base, (block_height/interval))`.

#### Example
issue:
`./mvs-cli issue testacc testacc MST.MINING -s "initial:300000000,interval:500000,base:0.95"`

`MST` mining reword = 300000000 * pow(0.95, (Current block height - Height shen MST issued) / 500000).

#### Operations on fullnode wallet
![Operations on fullnode wallet ](/images/mining/en/mst_mining_create_asset.png)

### Miner
Miner `startmining` with option `--symbol` and the symbol of `MST` to be mined.
