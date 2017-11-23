title: Deploy Metaverse Wallet For Platforms
comments: false
---
## Frequently-Used Documents
* [API-Call-List](/api)

## Standard Procedure
1. Deploy a Metaverse node on a Linux server. Download [Metaverse Wallet Download]([https://mvs.org/#download)
2. Do the following steps using mvs-cli commands
```
a. Create a account in wallet
b. Generate addresses in batch
```
3. Import Metaverse ETP addresses to the database
```
a. Import Metaverse ETP addresses into the database of the exchange
b. Assign the addresses to the users when the users deposit
```
4. Develop programs to fulfil the following functions:
```
a. Monitor new blocks through the API of the wallet (getblock method)
b. User imformation based depositing
c. Save the trading records related to the exchange
```
*Other standard operations to connect to the website of the exchange*

## A Brief Introduction of Metaverse(MVS) wallet

MVS wallet consist of 'mvsd' and 'mvs-cli';

mvs-cli is a command-line client (wallet) for developers. Developers have two ways to interact with it:
Using the CLI (command-line interface) commands. For example, you can create an account, generate addresses, etc. 

mvsd is the core wallet program which provide Remote Procedure Call (RPC), port defaluts to 8820. For example, you can transfer to the designated address, acquire the block information of the designated height, acquire the information of the designated trade, etc. 

1. Every MVS node optionally provides an API to retrieve blockchain data from the nodes. This facilitates the development of blockchain applications. The interfaces are provided through (JSON-RPC)[http://www.jsonrpc.org/specification].

*To start a node which provides RPC service, you can run the following commands*
```
./mvsd 
```
**Just like what bitcoind does.**
see RPC CALL LIST details: <https://github.com/mvs-org/metaverse/wiki/Metaverse-API-Call-List>

2. It is a wallet controlled through the command line. You can manage your assets using commands. The basic functions include: creating an account, creating addresses and transferring assets. 

show all commands mvsd supported.
```
./mvs-cli help
```

### >>> Creating a account

An account is used to store the account information for users. 
It is the most important proof that the users hold. Users no need to keep the wallet files and the wallet passwords secure, **but have to backup mnemonics, once it is lost or forgotten, all your assets can't be found back, including the ETP. Please store mnemonics of the master private key in a safe place, such as copying to paper or storing them into an encrypted flash disk.**

The exchange must have an online wallet to manage the deposit addresses of the users. 

*Note: Exchanges do not have to create a account for every user. An online wallet usually keeps all deposit addresses of a account. A cold wallet (offline wallet) is another storage option which provides better security.*

How to create an new account：<https://github.com/mvs-org/metaverse/wiki/Metaverse-API-Call-List#-account>

### >>> Generating Deposit Addresses

A wallet can store multiple addresses. The exchange needs to generate a deposit address for each user. 

There are basically two methods to generate a deposit address: 

1. When the user deposit (ETP) for the first time, the program can dynamically generate ETP addresses. The advantage is that there is no need to generate addresses at fixed time intervals, while the disadvantage is that the exchange needs to pay extra effort to develop this function.
2. The exchange creates a batch of ETP addresses in advance. When the user charges ETP at the first time, the exchange platform assigns a ETP address to this user. The advantage is quick connections and no further development, while the disadvantage is the need to generate ETP addresses manually. 

We suggest exchanges to adopt the 2nd method which ensures fast connections to the exchanges. 

To generate MVS addresses in batch, you can use the command:  
```
./mvs-cli getnewaddress accountname accountpassword -n 1000
```
see <https://github.com/mvs-org/metaverse/wiki/Metaverse-API-Call-List#-address>

Those addresses will be shown as json format reponse. The exchange needs to import these addresses into the database of the exchange, and distribute them to the users.


### >>> User deposits and deposit records

Regarding user deposit, the exchange need to be informed about the following:

* Metaverse blockchain has only one main chain without side chains, will not fork, and will not have isolated blocks. you can find blocks information on <https://explorer.mvs.org>.

* A transaction recorded in Metaverse blockchain cannot be tampered with, which mean a confirmation represents a deposit success. we recommand the confirmation number over 30.

* There is no notification when the amount of asset in an address changes. The metaverse wallet DOES have an interface(listtxs) to query all transactions for an address. See details <https://github.com/mvs-org/metaverse/wiki/Metaverse-API-Call-List#-transaction>.

* Metaverse shares addresses for between ETP and other assets. More assets issued by users (such as stock or token) can be stored. The exchange should determine the type of assets when user deposit. Neither regard other assets as ETP shares or other assets nor confuse the withdrawal. The asset type need to be determined specifically.


* mvsd is a full node, which needs to stay online to synchronize blocks. You can view the block synchronization status through the show state in the mvs-cli or RPC-CALL, where the left side is the local block height, while the right side is the node block height.

* In the exchange, the transfer between users should not be recorded through the blockchain. In general, it modifies the user's balance in the database directly. Only deposits and withdrawals should be recorded on the blockchain.

''Regarding the 3rd point mentioned above:''

''The exchange needs to write code to monitor every transaction in a block and record all the transactions related to the exchanges addresses in the database. If a deposit occur, then the balance of the user should be updated.''


## <font size=5 color=red>CAUTION PLEASE</font>
1. Metaverse wallet can combine small etp automatically, no need to group small changes manually.
2. When sending assets , if use command 'send', my changes will go back to a random address belongs to this account. **So we strongly recommand exchange platform to use 'sendfrom'/'sendmore'.**
3. [Recognize Fronzen ETP Transaction Outputs](recognize-fronzen-ETP-transaction-outputs.html)

