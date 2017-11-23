title: Introduction
comments: false
---

MVS，short for Metaverse

## Metaverse full node introduction
Full nodes are nodes that store the entire Metaverse blockchain and are connected in a P2P network architecture. In the blockchain network, all full nodes are treated as equals, and serve as both clients and servers. 

The MVS full node consists of two programs and a graphical interface:
•   mvsd: The core wallet program, similar to Bitcoin’s bitcoind;
•   mvs-cli: a command line interface, similar to Bitcoin’s bitcoin-cli
•   mvs-htmls: a browser-based graphical user interface built with AngularJS. This GUI may not be necessary for developers. 


## MVS full node wallet download address:

Generally, the latest MVS full node client can be downloaded from Metaverse's official website (https://mvs.org#download)


Supported versions:

| OS Version                        | Version | mvsd&mvs-cli |
| --------------------------------- | ------- | ----------------- |
| Red Hat Enterprise Linux 7 Server | 7+|   √               |
| Ubuntu                        | 14.04+ |   √               |
| Debian                            | 8+|   √               |
| Fedora                            | 21+|   √               |
| CentOS                            | 6.5+|   √               |
| openSUSE                      | 13.2+ |   √               |
| Docker                            | -     |   √               |

## MVS full node wallet - function list
|                 | mvsd&mvs-cli | Broswer GUI |
| --------------- | ---- | ---- |
|Graphic Interfac          |       |   √    |
|Command Line Interface        |   √   |   √    |
|Create Account     |   √   |   √    |
|Import and Export Mnemonics   |   √   |   √    |
|Create Address     |   √   |   √    |
|Batch Generation Address      |   √   |   √    |    
|ETP Transfer           |   √   |   √    |  
|ETP Deposit (Coinlock)     |   √   |   √    |
|Show All Addresse      |   √   |   √    |
|Show All Assets      |   √   |   √    |
|Create Asset (Not broadcast)  |   √   |   √    |
|Delete Asset (Not broadcast)  |   √   |        |
|Issue Asset          |   √   |   √    |
|Transfer Asset|   √   |   √    |
|Create a multi-party signature transactio  |   √   |   √    |
|Offline signature          |   √   |        |
|List the transaction details of the designated assets of the wallet|   √   |    √    |
|mining            |   √   |        |


## Port descriptions

The firewall port needs to be opened if external programs are allowed to access the node's API. The following is port descriptions which can be partially or fully opened as required.


|                    | Main Net | Test Net |
| ------------------ | ------------ | ------------- |
| JSON-RPC via HTTPS | ×    | ×    |
| JSON-RPC via HTTP  | 8820 | 8820 |
| P2P via TCP        | 5251 | 15251|

