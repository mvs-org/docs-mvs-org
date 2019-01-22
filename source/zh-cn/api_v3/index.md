title: API v3 Usage
comments: false
---
This documentation provides more detailed information about the **API.v3(JSON-RPC 2.0)** list and will be particularly helpful for people who want to build BaaS(Blockchain As A Service) appliacations. If you are interested in more basic usage of Metaverse, please refer to the [docs](../docs) instead.

Please note that this documentation is only valid for MVS FULL NODE.
Differences between **API.v3** and **API.v2**, please refers to [v3 VS v2](../api_v3/v3-VS-v2.html)
Compatiblity for API v2, please refers to [API v2](/api_v2).
Compatiblity for API v1, please refers to [API v1](/api).

## API v3 Usage
** Supported [v0.8.2](/news) and later**

|   API      |  Default Port | URI | Default URL |
| ------------------ | ------------ | ------------- |
| API v3     |  8820 | **/rpc/v3**|**http://127.0.0.1:8820/rpc/v3**|
| Websocket  |  8821 | **/ws**    |**http://127.0.0.1:8821/ws**|

Refers to [How to configure Port](../docs/config-file.html).

Build Json, then HTTP POST to URL:
```json
{                                                                        
 "id":number,                                                         
 "method":"xxx",                                                         
 "params":[                                                              
     "param1",  //command arguments from help
     "param2",  
     {
         "option1": value1,  //command options from help
         "option2": value2,  
     }
     ]                                                                   
 }
```

Example:
```bash
$ curl -X POST --data '{"jsonrpc":"2.0","method":"getinfo","params":[],"id":25}' http://127.0.0.1:8820/rpc/v3
$ curl -X POST --data '{"jsonrpc":"2.0","method":"sendmore","params":["account_name","account_auth",{"receivers":"t7r9twiK5gAwhR2gXDqT2zqpzS6ogvaqnJ:100000"}],"id":25}' http://127.0.0.1:8820/rpc/v3
```

Obviously, Use `help` to get all commands(methods) list.
```bash
$ ./mvs-cli help
$ ./mvs-cli help $command
```

### API v3 Call List

#### Account

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [getnewaccount](account.html#getnewaccount)    |  × | × | × | 0.7.3 |
| [validateaddress](account.html#validateaddress)|  × | × | × | 0.7.3 |
| [importaccount](account.html#importaccount)    |  × | × | × | 0.7.3 |
| [importkeyfile](account.html#importkeyfile)    |  × | × | × | 0.7.3 |
| [dumpkeyfile](account.html#dumpkeyfile)        |  × | × | √ | 0.7.3 |
| [getnewaddress](account.html#getnewaddress)    |  × | × | √ | 0.7.3 |
| [listaddresses](account.html#listaddresses)    |  × | × | √ | 0.7.3 |
| [changepasswd](account.html#changepasswd)      |  × | × | √ | 0.7.3 |
| [deleteaccount](account.html#deleteaccount)    |  × | × | √ | 0.7.3 |
| [getaccount](account.html#getaccount)          |  × | × | √ | 0.7.3 |

#### Blockchain

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [shutdown](blockchain.html#shutdown)          | × | √ | × | 0.7.3 |
| [getinfo](blockchain.html#getinfo)            | × | √ | × | 0.7.3 |
| [getheight](blockchain.html#getheight)        | × | √ | × | 0.7.3 |
| [getpeerinfo](blockchain.html#getpeerinfo)    | × | √ | × | 0.7.3 |
| [getmininginfo](blockchain.html#getmininginfo)| √ | √ | × | 0.7.3 |
| [getstakeinfo](blockchain.html#getstakeinfo)  | √ | √ | × | 0.9.0 |
| [startmining](blockchain.html#startmining)    | √ | × | √ | 0.7.3 |
| [stopmining](blockchain.html#stopmining)      | √ | × | √ | 0.7.3 |
| [getwork](blockchain.html#getwork)            | √ | × | √ | 0.7.3 |
| [addnode](blockchain.html#addnode)            | × | √ | × | 0.7.3 |
| [setminingaccount](blockchain.html#setminingaccount)| √ | × | √ | 0.7.3 |
| [submitwork](blockchain.html#submitwork)      | √ | × | √ | 0.7.3 |
| [getmemorypool](blockchain.html#getmemorypool)| × | √ | × | 0.7.3 |

#### Block

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [getblock](block.html#getblock)                    | × | √ | × | 0.7.3 |
| [getblockheader](block.html#getblockheader)        | × | √ | × | 0.7.3 |

#### ETP

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [getbalance](etp.html#getbalance)     | × | × | √ | 0.7.3 |
| [listbalances](etp.html#listbalances) | × | × | √ | 0.7.3 |
| [send](etp.html#send)                 | √ | × | √ | 0.7.3 |
| [sendfrom](etp.html#sendfrom)         | √ | × | √ | 0.7.3 |
| [sendmore](etp.html#sendmore)         | √ | × | √ | 0.7.3 |
| [getaddressetp](etp.html#getaddressetp)   | × | × | × | 0.8.0 |
| [lock](etp.html#lock)                 | √ | × | √ | 0.9.0 |
| [getlocked](etp.html#getlocked)       | √ | × | √ | 0.9.0 |

#### Transaction

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [gettx](transaction.html#gettx)    | √ | × | × | 0.7.3 |
| [listtxs](transaction.html#listtxs)| √ | × | √ | 0.7.3 |

#### Multi-Signatue

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [createmultisigtx](multisig.html#createmultisigtx)    | × | × | √ | 0.7.3 |
| [getpublickey](multisig.html#getpublickey)            | × | × | √ | 0.7.3 |
| [deletemultisig](multisig.html#deletemultisig)        | × | × | √ | 0.7.3 |
| [getnewmultisig](multisig.html#getnewmultisig)        | × | × | √ | 0.7.3 |
| [listmultisig](multisig.html#listmultisig)            | × | × | √ | 0.7.3 |
| [signmultisigtx](multisig.html#signmultisigtx)        | × | × | √ | 0.7.3 |

#### Rawtx(offline-sign)

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [createrawtx](rawtx.html#createrawtx)     | × | × | × | 0.7.3 |
| [signrawtx](rawtx.html#signrawtx)         | × | × | √ | 0.7.3 |
| [decoderawtx](rawtx.html#decoderawtx)     | × | × | × | 0.7.3 |
| [sendrawtx](rawtx.html#sendrawtx)         | √ | × | × | 0.7.3 |

#### DID

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [registerdid](identity.html#registerdid)      | √ | × | √ | 0.8.0 |
| [didchangeaddress](identity.html#didchangeaddress)    | √ | × | √ | 0.8.0 |
| [listdids](identity.html#listdids)            | × | × | × | 0.8.0 |
| [getdid](identity.html#getdid)                | × | × | × | 0.8.0 |
| [didsend](etp.html#send)              | √ | × | √ | 0.8.0 |
| [didsendfrom](etp.html#sendfrom)      | √ | × | √ | 0.8.0 |
| [didsendmore](etp.html#sendmore)         | √ | × | √ | 0.8.0 |
| [didsendasset](asset.html#sendasset)      | √ | × | √ | 0.8.0 |
| [didsendassetfrom](asset.html#sendassetfrom)   | √ | × | √ | 0.8.0 |

#### MST

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [createasset](asset.html#createasset)          | × | ×  | √ | 0.7.3 |
| [deletelocalasset](asset.html#deletelocalasset)| × | ×  | √ | 0.7.3 |
| [getaccountasset](asset.html#getaccountasset)  | √ | × | √ | 0.7.3 |
| [getaddressasset](asset.html#getaddressasset)  | √ | × | √ | 0.7.3 |
| [getasset](asset.html#getasset)                | × | × | × | 0.7.3 |
| [issue](asset.html#issue)                      | √ | × | √ | 0.7.3 |
| [issuefrom](asset.html#issuefrom)              | √ | × | √ | 0.7.3 |
| [listassets](asset.html#listassets)            | √ | × | optional | 0.7.3 |
| [sendasset](asset.html#sendasset)              | √ | × | √ | 0.7.3 |
| [sendassetfrom](asset.html#sendassetfrom)      | √ | × | √ | 0.7.3 |
| [burn](asset.html#burn)                        | √ | × | √ | 0.8.0 |
| [validatesymbol](asset.html#validatesymbol)    | × | × | √ | 0.9.0 |

#### Cert

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [issuecert](asset.html#issuecert)         | √ | × | √ | 0.8.0 |
| [transfercert](asset.html#transfercert)   | √ | × | √ | 0.8.0 |

#### MIT

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [registermit](mit.html#registermit)       | √ | × | √ | 0.8.0 |
| [transfermit](mit.html#transfermit)       | √ | × | √ | 0.8.0 |
| [listmits](mit.html#listmits)             | × | × | optional | 0.8.0 |
| [getmit](mit.html#getmit)                 | × | × | × | 0.8.0 |


* Method : JSON-RPC Method
* Online-required: whether needs to wait for almost latest height.
* Admin-required: whether provides administrator authorization, defaluts to no. (name: administrator)(password: mvsgo).
```bash
# mvs.conf
[server]
administrator_required = 1
```
* Account-required : user account name, password required. 
* Version : release in version.


### mvs-cli
mvs-cli uses `/rpc/v3` to call mvsd after v0.8.2.
