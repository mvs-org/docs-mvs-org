title: Testnet
comments: false
---

## Testnet
The Metaverse testnet is provided by Metaverse for users to develop, debug and test on.
The testnet's network fees are paid using testnet ETP. It is not fungible with real (i.e. mainnet) ETP. You can apply to receive testnet ETP on the official Metaverse website.

The testnet's blockdata is completely independent of the mainnet. The testnet can be used to develop simple functions such as asset registration; once the function is ready it can be migrated to the mainnet. The official Metaverse website has been updated. The Metaverse official website <https://mvs.org> has added a "Testnet Button" so that users can easily try out the Metaverse Wallet's functions.

## Testnet Features
1.  Users can experience the Metaverse Wallet without expending their own ETP.
2.  Users need not sync the entire blockchain, saving time.
3.  Users can experience transferring and issuing assets, and carry out secondary issuances. 
4.  Robust page and platform compatibility.
5.  An improved wallet program that greatly reduces consumption of system resources.
6.  Multi-signature addresses and multi-signature transactions.
7.  Enhanced wallet UI.

## Start the full node wallet in testnet mode
* You need to run the wallet through the command line.
```bash
mvsd -t
```
* Register
```bash
mvs-cli getnewaccount testaccout testpasswd
```

* Start CPU mining.
```bash
mvs-cli start testaccount testpasswd
```
