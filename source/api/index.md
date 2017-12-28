title: API(v1) Usage
comments: false
---

Please note that API documentation is only valid for MVS FULL NODE.
You can refer to [Metaverse wiki](https://github.com/mvs-org/metaverse/wiki/Metaverse-API-Call-List) instead as well.

## NOTICE
<font color=red size=4>Strongly recommends referring to <a href=/api_v2/>API v2</a> to replace api v1.</font>

API v1 has some non-standard JSON-RPC reponse, will confused developers.
>We found a boost library issue [ptree write_json does not conform to JSON standard](https://svn.boost.org/trac10/ticket/9721) on json parser.`The Boost write_json method puts quotes around all values, not just strings.` So We strongly recommend developers to refer to [API-v2:JSON-RPC 2.0](/api_v2).

## API(v1) Usage

API URI: `/rpc`
HTTP Request to local default URL: `http://127.0.0.1:8820/rpc`

*please replace '$parameter' with your own parameter as below.*

if we use
```bash
./mvs-cli $command $param1 $param2 ...
```
that should be equal as below in RPC-CALL case:

Build Json, then POST to 'http://127.0.0.1:8820/rpc'
```json
{
    "method":"$command",
    "params":["$param1", "$param2", ...]
}
```
Obviously, you should use help command for all commands.
```bash
# see all commands
./mvs-cli help
# see help message of this command
./mvs-cli help $command
```
Check here for the instance of source codes: <https://github.com/ViewBTC/mvs-exchange-tools> (keep updating).

Some [Documentation For Server Setup](http://blog.mvs.live/metaverse-setup-guide-for-service/) in Chinese.


## API(v1) Call List
Compatibility after v0.7.3(API v2):
* ○  : keep same name, compatible in `result` if convert to json string.
* ×  : incompatible in `result`.
* ×× : obliterate.
* newname : rename/alias in API v2, and compatible in `result` if convert to json string.

| Commands | => | New Name | 
| ------- |  ------------ |------------ | 
| [changepasswd](#changepasswd)| => |  ○  |  
| [deleteaccount](#deleteaccount)| => | ○|  
| [importaccount](#importaccount)| => | ○ |  
| [deposit](#deposit)| => | ○ |  
| [exportaccountasfile](#exportaccountasfile)| => | dumpkeyfile |  
| [importaccountfromfile](#importaccountfromfile)| => | importkeyfile |  
| [getaccount](#getaccount)| => | ○ |  
| [getbalance](#getbalance)| => | ○ |  
| [getnewaccount](#getnewaccount)| => | ○|  
| [getnewaddress](#getnewaddress)| => | ○ |  
| [listaddresses](#listaddresses)| => | ○ |  
| [listbalances](#listbalances)| => | ○ |  
| [send](#send)| => | ○ |  
| [sendfrom](#sendfrom)| => | ○ |  
| [sendmore](#sendmore)| => | ○ |  
| [getwork](#getwork)| => | ○ |  
| [setminingaccount](#setminingaccount)| => | ○ |  
| [start](#start)| => | startmining |
| [stop](#stop)| => | stopmining |
| [stopall](#stopall)| => | shutdown |
| [submitwork](#submitwork)| => | ○ |  
| [fetch-header](#fetchheaderext)| => | getblockheader |  
| [getbestblockhash](#getbestblockhash)| => | getblockheader |  
| [getbestblockheader](#getbestblockheader)| => | getblockheader |  
| [getblock](#getblock)| => | ○ |  
| [getmemorypool](#getmemorypool)| => | ○ |  
| [getpeerinfo](#getpeerinfo)| => |  |  
| [getpublickey](#getpublickey)| => | ○ |  
| [gettransaction](#gettransaction)| => | gettx |  
| [fetch-tx](#listtxs)| => | gettx |  
| [listtxs](#listtxs)| => | ○ |  
| [createasset](#createasset)| => | ○ |  
| [deleteasset](#deleteasset)| => | deletelocalasset |  
| [getaccountasset](#getaccountasset)| => | ○ |  
| [getaddressasset](#getaddressasset)| => | ○ |  
| [listassets](#listassets)| => | ○ |  
| [issue](#issue)| => | ○ |  
| [issuefrom](#issuefrom)| => | ○ |  
| [sendasset](#sendasset)| => | ○ |  
| [sendassetfrom](#sendassetfrom)| => | ○ |  
| [createmultisigtx](#createmultisigtx)| => | ○ |  
| [deletemultisig](#deletemultisig)| => | ○ |  
| [getnewmultisig](#getnewmultisig)| => | ○ |  
| [listmultisig](#listmultisig)| => | ○ |  
| [signmultisigtx](#signmultisigtx)| => | ○ |  
| [fetch-balance](#fetch-balance)| => | getaddressetp |
| [fetch-height](#fetch-height)| => | getheight |
| [stopall](#stopall)| => | shutdown |  
| [stop](#stop)| => | stopmining |  
| [start](#start)| => | startmining |  
| [getasset](#getasset)| => | × |  
| [validateaddress](#validateaddress)| => | × |  
| [getmininginfo](#getmininginfo)| => | × |  
| [fetch-public-key](#fetch-public-key)| => | ×× |  
| [fetch-history](#fetch-public-key)| => | ×× |  
| [xfetchbalance](#xfetchbalance)| => | ×× |  
| [xfetchutxo](#xfetchutxo)| => | ×× |  
| [fetchheaderext](#fetchheaderext)| => | ×× |  

