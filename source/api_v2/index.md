title: API v2 Usage
comments: false
---
This documentation provides more detailed information about the **API.v2(JSON-RPC 2.0)** list and will be particularly helpful for people who want to build BaaS(Blockchain As A Service) appliacations. If you are interested in more basic usage of Metaverse, please refer to the [docs](../docs) instead.

Please note that this documentation is only valid for MVS FULL NODE.
Compatiblity for API v1, please refers to [API v1](/api).

## API v2 Usage
** Supported [v0.7.3](/news) and later**

|   API      |  Default Port | URI | Default URL |
| ------------------ | ------------ | ------------- |
| API v2     |  8820 | **/rpc/v2**|**http://127.0.0.1:8820/rpc/v2**|
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
$ curl -X POST --data '{"jsonrpc":"2.0","method":"getinfo","params":[],"id":25}' http://127.0.0.1:8820/rpc/v2
$ curl -X POST --data '{"jsonrpc":"2.0","method":"sendmore","params":["account_name","account_auth",{"receivers":"t7r9twiK5gAwhR2gXDqT2zqpzS6ogvaqnJ:100000"}],"id":25}' http://127.0.0.1:8820/rpc/v2
```

Obviously, Use `help` to get all commands(methods) list.
```bash
$ ./mvs-cli help
$ ./mvs-cli help $command
```

### API v2 Call List

#### Account

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [getnewaccount](account.html#getnewaccount)    |  × | × | ×  | 0.7.3 |
| [validateaddress](account.html#validateaddress)|  × | × | ×  | 0.7.3 |
| [importaccount](account.html#importaccount)    |  × | × | ×  | 0.7.3 |
| [importkeyfile](account.html#importkeyfile)    |  × | × | ×  | 0.7.3 |
| [dumpkeyfile](account.html#dumpkeyfile)        |  × | × | yes | 0.7.3 |
| [getnewaddress](account.html#getnewaddress)    |  × | × | yes | 0.7.3 |
| [listaddresses](account.html#listaddresses)    |  × | × | yes | 0.7.3 |
| [changepasswd](account.html#changepasswd)      |  × | × | yes | 0.7.3 |
| [deleteaccount](account.html#deleteaccount)    |  × | × | yes | 0.7.3 |
| [getaccount](account.html#getaccount)          |  × | × | yes | 0.7.3 |

#### Blockchain

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [shutdown](blockchain.html#shutdown)          | × | yes | × | 0.7.3 |
| [getinfo](blockchain.html#getinfo)            | × | yes | × | 0.7.3 |
| [getheight](blockchain.html#getheight)        | × | yes | × | 0.7.3 |
| [getpeerinfo](blockchain.html#getpeerinfo)    | × | yes | × | 0.7.3 |
| [getmininginfo](blockchain.html#getmininginfo)| yes | yes | × | 0.7.3 |
| [startmining](blockchain.html#startmining)    | yes | ×  | yes | 0.7.3 |
| [stopmining](blockchain.html#stopmining)      | yes | ×  | yes | 0.7.3 |
| [getwork](blockchain.html#getwork)            | yes | ×  | yes | 0.7.3 |
| [addnode](blockchain.html#addnode)            | × | yes | × | 0.7.3 |
| [setminingaccount](blockchain.html#setminingaccount)| yes | ×  | yes | 0.7.3 |
| [submitwork](blockchain.html#submitwork)      | yes | ×  | yes | 0.7.3 |
| [getmemorypool](blockchain.html#getmemorypool)| × | yes | × | 0.7.3 |

#### Block

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [getblock](block.html#getblock)                    | × | yes | × | 0.7.3 |
| [getblockheader](block.html#getblockheader)        | × | yes | × | 0.7.3 |

#### ETP

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [getbalance](etp.html#getbalance)     | yes | × | yes | 0.7.3 |
| [listbalances](etp.html#listbalances) | yes | × | yes | 0.7.3 |
| [deposit](etp.html#deposit)           | yes | × | yes | 0.7.3 |
| [send](etp.html#send)                 | yes | × | yes | 0.7.3 |
| [sendfrom](etp.html#sendfrom)         | yes | × | yes | 0.7.3 |
| [sendmore](etp.html#sendmore)         | yes | × | yes | 0.7.3 |

#### Transaction

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [gettx](transaction.html#gettx)    | yes | × | × | 0.7.3 |
| [listtxs](transaction.html#listtxs)| yes | × | yes | 0.7.3 |

#### Asset

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [createasset](asset.html#createasset)          | × | ×  | yes  | 0.7.3 |
| [deletelocalasset](asset.html#deletelocalasset)| × | ×  | yes | 0.7.3 |
| [getaccountasset](asset.html#getaccountasset)  | yes | × | yes | 0.7.3 |
| [getaddressasset](asset.html#getaddressasset)  | yes | × | yes | 0.7.3 |
| [getasset](asset.html#getasset)                | yes | × | ×   | 0.7.3 |
| [issue](asset.html#issue)                      | yes | × | yes | 0.7.3 |
| [issuefrom](asset.html#issuefrom)              | yes | × | yes | 0.7.3 |
| [listassets](asset.html#listassets)            | yes | × | optional | 0.7.3 |
| [sendasset](asset.html#sendasset)              | yes | × | yes | 0.7.3 |
| [sendassetfrom](asset.html#sendassetfrom)      | yes | × | yes | 0.7.3 |

#### Multi-Signatue

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [createmultisigtx](multisig.html#createmultisigtx)    | × | ×  | yes | 0.7.3 |
| [getpublickey](multisig.html#getpublickey)            | × | ×  | yes | 0.7.3 |
| [deletemultisig](multisig.html#deletemultisig)        | × | × | yes | 0.7.3 |
| [getnewmultisig](multisig.html#getnewmultisig)        | × | × | yes | 0.7.3 |
| [listmultisig](multisig.html#listmultisig)            | × | × | yes | 0.7.3 |
| [signmultisigtx](multisig.html#signmultisigtx)        | × | × | yes | 0.7.3 |

#### Rawtx(offline-sign)

|  Method | Online-required | Admin-required | Account-required | Version | 
|  ------- | -------| --------| --------------| -------| 
| [createrawtx](rawtx.html#createrawtx)     | × | × | × | 0.7.3 |
| [signrawtx](rawtx.html#signrawtx)         | × | × | yes | 0.7.3 |
| [decoderawtx](rawtx.html#decoderawtx)     | × | × | × | 0.7.3 |
| [sendrawtx](rawtx.html#sendrawtx)         | × | ×  | × | 0.7.3 |


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
mvs-cli uses `/rpc/v2` to call mvsd after v0.7.3.

