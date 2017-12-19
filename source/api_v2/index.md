title: API v2 Usage
comments: false
---
This documentation provides more detailed information about the **API.v2(JSON-RPC 2.0)** list and will be particularly helpful for people who want to build BaaS(Blockchain As A Service) appliacations. If you are interested in more basic usage of Metaverse, please refer to the [docs](../docs) instead.

Please note that this documentation is only valid for MVS FULL noDE.

## API v2 Usage
** API v2 will be supported in v0.7.3 **

### API v2 Call list (Draft)

* Command : JSON-RPC Method
* Module : belongs to function
* Admin Option : whether provides administrator authorization, defaluts to no. (name: administrator)(password: mvsgo).
```bash
# mvs.conf
[server]
administrator_required = 1
```
* Account Auth : account name, password required. 
* Version : release in version.

|  Command | Module | Admin Option| Account Auth | Version | 
|  ------- | -------| --------| --------------| -------| 
| [getnewaccount](account.html#getnewaccount)|  account | no | no  | 0.7.3 |
| [getnewaddress](account.html#getnewaddress)|  account | no | yes | 0.7.3 |
| [listaddresses](account.html#listaddresses)|  account | no | yes | 0.7.3 |
| [validateaddress](account.html#validateaddress)|  account | no | no | 0.7.3 |
| [importaccount](account.html#importaccount)|  account | no | no  | 0.7.3 |
| [importkeyfile](account.html#importkeyfile)|  account | no | no  | 0.7.3 |
| [dumpkeyfile](account.html#dumpkeyfile)|  account | no | yes | 0.7.3 |
| [changepasswd](account.html#changepasswd)|  account | no | yes | 0.7.3 |
| [deleteaccount](account.html#deleteaccount)|  account | no | yes | 0.7.3 |
| [getaccount](account.html#getaccount)|  account | no | yes | 0.7.3 |
| [shutdown](wallet.html#stopall)| wallet | yes | yes | 0.7.3 |
| [getinfo](wallet.html#getmininginfo)| wallet | yes | no | 0.7.3 |
| [getpeerinfo](wallet.html#getpeerinfo)| wallet | yes | no | 0.7.3 |
| [getmininginfo](wallet.html#getmininginfo)| wallet | yes | no | 0.7.3 |
| [startmining](wallet.html#start)| wallet | yes | yes | 0.7.3 |
| [stopmining](wallet.html#stop)| wallet | yes | yes | 0.7.3 |
| [getwork](wallet.html#getwork)| wallet | yes | yes | 0.7.3 |
| [addnode](wallet.html#addnode)| wallet | yes | yes | 0.7.3 |
| [setminingaccount](wallet.html#setminingaccount)| wallet | yes | yes | 0.7.3 |
| [submitwork](wallet.html#submitwork)| wallet | yes | yes | 0.7.3 |
| [getmemorypool](wallet.html#getmemorypool)| wallet | yes | no | 0.7.3 |
| [getbestblockhash](block.html#getbestblockhash)| block | yes | no | 0.7.3 |
| [getbestblockheader](block.html#getbestblockheader)| block | yes | no | 0.7.3 |
| [getblock](block.html#getblock)| block | yes | no | 0.7.3 |
| [getbalance](etp.html#getbalance)| etp | no | yes | 0.7.3 |
| [listbalances](etp.html#listbalances)| etp | no | yes | 0.7.3 |
| [deposit](etp.html#deposit)| etp | no | yes | 0.7.3 |
| [send](etp.html#send)| etp | no | yes | 0.7.3 |
| [sendfrom](etp.html#sendfrom)| etp | no | yes | 0.7.3 |
| [sendmore](etp.html#sendmore)| etp | no | yes | 0.7.3 |
| [gettx](transaction.html#gettx)| transaction | no | yes | 0.7.3 |
| [listtxs](transaction.html#listtxs)| transaction | no | yes | 0.7.3 |
| [createasset](asset.html#createasset)| asset | no  | no  | 0.7.3 |
| [deletelocalasset](asset.html#deletelocalasset)| asset | no  | yes | 0.7.3 |
| [getaccountasset](asset.html#getaccountasset)| asset | no | yes | 0.7.3 |
| [getaddressasset](asset.html#getaddressasset)| asset | no | yes | 0.7.3 |
| [getnetasset](asset.html#getnetasset)| asset | no | yes | 0.7.3 |
| [issue](asset.html#issue)| asset | no | yes | 0.7.3 |
| [issuefrom](asset.html#issuefrom)| asset | no | yes | 0.7.3 |
| [listassets](asset.html#listassets)| asset | no | yes | 0.7.3 |
| [sendasset](asset.html#sendasset)| asset | no | yes | 0.7.3 |
| [sendassetfrom](asset.html#sendassetfrom)| asset | no | yes | 0.7.3 |
| [createmultisigtx](multisig.html#createmultisigtx)| multisig | no  | yes | 0.7.3 |
| [getpublickey](multisig.html#getpublickey)| multisig | no  | yes | 0.7.3 |
| [deletemultisig](multisig.html#deletemultisig)| multisig | no | yes | 0.7.3 |
| [getnewmultisig](multisig.html#getnewmultisig)| multisig | no | yes | 0.7.3 |
| [listmultisig](multisig.html#listmultisig)| multisig | no | yes | 0.7.3 |
| [signmultisigtx](multisig.html#signmultisigtx)| multisig | no | yes | 0.7.3 |
| [createrawtx](rawtx.html#createrawtx)| rawtx | no | no | 0.7.3 |
| [signrawtx](rawtx.html#signrawtx)| rawtx | no | no | 0.7.3 |
| [decoderawtx](rawtx.html#decoderawtx)| rawtx | no | yes | 0.7.3 |
| [sendrawtx](rawtx.html#sendrawtx)| rawtx | no  | no | 0.7.3 |


### Compatibility odder than v0.7.3
* ○ - keep same name, compatible in `result`
* × - obliterate
* rename new name in v2 api.

| Commands | => | New Name | response modification |
| ------- |  ------------ |------------ | ------------ | 
| [changepasswd](#changepasswd)| => |  ○  | yes 
| [deleteaccount](#deleteaccount)| => | ○| yes 
| [importaccount](#importaccount)| => | ○ | yes 
| [deposit](#deposit)| => | ○ | yes 
| [exportaccountasfile](#exportaccountasfile)| => | dumpkeyfile | yes 
| [importaccountfromfile](#importaccountfromfile)| => | importkeyfile | yes 
| [getaccount](#getaccount)| => | ○ | yes 
| [getbalance](#getbalance)| => | ○ | yes 
| [getnewaccount](#getnewaccount)| => | ○| yes 
| [getnewaddress](#getnewaddress)| => | ○ | yes 
| [listaddresses](#listaddresses)| => | ○ | yes 
| [listbalances](#listbalances)| => | ○ | yes 
| [send](#send)| => | ○ | yes 
| [sendfrom](#sendfrom)| => | ○ | yes 
| [sendmore](#sendmore)| => | ○ | yes 
| [validateaddress](#validateaddress)| => | ○ | yes 
| [getmininginfo](#getmininginfo)| => | ○ | yes 
| [getwork](#getwork)| => | ○ | yes 
| [setminingaccount](#setminingaccount)| => | ○ | yes 
| [start](#start)| => | startmining | yes 
| [stop](#stop)| => | stopmining | yes 
| [stopall](#stopall)| => | shutdown | yes 
| [submitwork](#submitwork)| => | ○ | yes 
| [fetchheaderext](#fetchheaderext)| => | × | yes 
| [getbestblockhash](#getbestblockhash)| => | ? | yes 
| [getbestblockheader](#getbestblockheader)| => | ? | yes 
| [getblock](#getblock)| => | ○ | yes 
| [getmemorypool](#getmemorypool)| => | ○ | yes 
| [getpeerinfo](#getpeerinfo)| => | ○ | yes 
| [getpublickey](#getpublickey)| => | getaddresspublickey | yes 
| [gettransaction](#gettransaction)| => | gettx | yes 
| [listtxs](#listtxs)| => | ○ | yes 
| [xfetchbalance](#xfetchbalance)| => | × | yes 
| [xfetchutxo](#xfetchutxo)| => | × | yes 
| [createasset](#createasset)| => | ○ | yes 
| [deleteasset](#deleteasset)| => | deletelocalasset | yes 
| [getaccountasset](#getaccountasset)| => | ○ | yes 
| [getaddressasset](#getaddressasset)| => | ○ | yes 
| [getasset](#getasset)| => | × | yes 
| [listassets](#listassets)| => | ○ | yes 
| [issue](#issue)| => | ○ | yes 
| [issuefrom](#issuefrom)| => | ○ | yes 
| [sendasset](#sendasset)| => | ○ | yes 
| [sendassetfrom](#sendassetfrom)| => | ○ | yes 
| [createmultisigtx](#createmultisigtx)| => | ○ | yes 
| [deletemultisig](#deletemultisig)| => | ○ | yes 
| [getnewmultisig](#getnewmultisig)| => | ○ | yes 
| [listmultisig](#listmultisig)| => | ○ | yes 
| [signmultisigtx](#signmultisigtx)| => | ○ | yes 


