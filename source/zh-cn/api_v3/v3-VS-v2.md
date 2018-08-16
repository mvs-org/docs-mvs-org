title: API v3 VS v2
comments: false
---
This documentation lists differences between **API.v3** and **API.v2**. If you are interested in more basic usage of Metaverse, please refer to the [docs](../docs) instead.

Compatiblity for API v2, please refers to [API v2](/api_v2).
Compatiblity for API v1, please refers to [API v1](/api).

## Common
API v3 returns object itself as `result` field of response not a dictionary of `name : object`.

### transaction object
API v3 returns a transaction object while API v2 return a dictionary of `transaction : object`. 

Following commands are affected.

|  Method         | API v3                | API v2               | 
|  -------------- | --------------------- | ---------------------| 
| `burn`                | [v3](../api_v3/asset.html#burn) | [v2](../api_v2/asset.html#burn) |
| `decoderawtx`         | [v3](../api_v3/rawtx.html#decoderawtx) | [v2](../api_v2/rawtx.html#decoderawtx) |
| `deposit`             | [v3](../api_v3/etp.html#deposit) | [v2](../api_v2/etp.html#deposit) |
| `didchangeaddress`    | [v3](../api_v3/identity.html#didchangeaddress) | [v2](../api_v2/identity.html#didchangeaddress) |
| `didsend`             | [v3](../api_v3/etp.html#send) | [v2](../api_v2/identity.html#didsend) |
| `didsendfrom`         | [v3](../api_v3/etp.html#sendfrom) | [v2](../api_v2/identity.html#didsendfrom) |
| `didsendmore`         | [v3](../api_v3/etp.html#sendmore) | [v2](../api_v2/identity.html#didsendmore) |
| `didsendasset`        | [v3](../api_v3/asset.html#sendasset) | [v2](../api_v2/identity.html#didsendasset) |
| `didsendassetfrom`    | [v3](../api_v3/asset.html#sendassetfrom) | [v2](../api_v2/identity.html#didsendassetfrom) |
| `issue`               | [v3](../api_v3/asset.html#issue) | [v2](../api_v2/asset.html#issue) |
| `issuecert`           | [v3](../api_v3/asset.html#issuecert) | [v2](../api_v2/asset.html#issuecert) |
| `transfercert`        | [v3](../api_v3/asset.html#transfercert) | [v2](../api_v2/asset.html#transfercert) |
| `transfermit`         | [v3](../api_v3/mit.html#transfermit) | [v2](../api_v2/mit.html#transfermit) |
| `registerdid`         | [v3](../api_v3/identity.html#registerdid) | [v2](../api_v2/identity.html#registerdid) |
| `registermit`         | [v3](../api_v3/mit.html#registermit) | [v2](../api_v2/mit.html#registermit) |
| `secondaryissue`      | [v3](../api_v3/asset.html#secondaryissue) | [v2](../api_v2/asset.html#secondaryissue) |
| `send`                | [v3](../api_v3/etp.html#send) | [v2](../api_v2/etp.html#send) |
| `sendasset`           | [v3](../api_v3/asset.html#sendasset) | [v2](../api_v2/asset.html#sendasset) |
| `sendassetfrom`       | [v3](../api_v3/asset.html#sendassetfrom) | [v2](../api_v2/asset.html#sendassetfrom) |
| `sendfrom`            | [v3](../api_v3/etp.html#sendfrom) | [v2](../api_v2/etp.html#sendfrom) |
| `sendmore`            | [v3](../api_v3/etp.html#sendmore) | [v2](../api_v2/etp.html#sendmore) |

### asset object
API v3 returns a asset object while API v2 return a dictionary of `asset : object`. 

Following commands are affected.

|  Method         | API v3                | API v2               | 
|  -------------- | --------------------- | ---------------------| 
| `createasset`   | [v3](../api_v3/asset.html#createasset) | [v2](../api_v2/asset.html#createasset) |

### list object
API v3 returns a list of object while API v2 return a dictionary of `name : list of object`. 

Following commands are affected.

|  Method         | API v3                | API v2               | 
|  -------------- | --------------------- | ---------------------| 
| `listmultisig`    | [v3](../api_v3/multisig.html#listmultisig) | [v2](../api_v2/multisig.html#listmultisig) |
| `getaccountasset` | [v3](../api_v3/asset.html#getaccountasset) | [v2](../api_v2/asset.html#getaccountasset) | 
| `getaddressasset` | [v3](../api_v3/asset.html#getaddressasset) | [v2](../api_v2/asset.html#getaddressasset) |
| `getasset`        | [v3](../api_v3/asset.html#getasset) | [v2](../api_v2/asset.html#getasset) | 
| `listassets`      | [v3](../api_v3/asset.html#listassets) | [v2](../api_v2/asset.html#listassets) | 
| `getnewaddress`   | [v3](../api_v3/account.html#getnewaddress) | [v2](../api_v2/account.html#getnewaddress) |
| `listaddresses`   | [v3](../api_v3/account.html#listaddresses) | [v2](../api_v2/account.html#listaddresses) |
| `listbalances`    | [v3](../api_v3/etp.html#listbalances) | [v2](../api_v2/etp.html#listbalances) | 
| `listdids`        | [v3](../api_v3/identity.html#listdids) | [v2](../api_v2/identity.html#listdids) | 
| `listmits`        | [v3](../api_v3/mit.html#listmits) | [v2](../api_v2/mit.html#listmits) | 

### string object
API v3 returns a string object while API v2 return a dictionary of `name : string object`. 

Following commands are affected.

|  Method         | API v3                | API v2               | 
|  -------------- | --------------------- | ---------------------| 
| `createrawtx`    | [v3](../api_v3/rawtx.html#createrawtx) | [v2](../api_v2/rawtx.html#createrawtx) |
| `sendrawtx`    | [v3](../api_v3/rawtx.html#sendrawtx) | [v2](../api_v2/rawtx.html#sendrawtx) |

## Replace `-` with `_`
API v3 replaces `-` with `_` in the field name of response.

Following field names are affected.

|  Method         | API v3                | API v2               | 
|  -------------- | --------------------- | ---------------------| 
| `deletemultisig`    | [v3](../api_v3/multisig.html#deletemultisig) | [v2](../api_v2/multisig.html#deletemultisig) |
| `listmultisig`    | [v3](../api_v3/multisig.html#listmultisig) | [v2](../api_v2/multisig.html#listmultisig) |
| `getaccount`    | [v3](../api_v3/account.html#getaccount) | [v2](../api_v2/account.html#getaccount) |
| `getbalance`    | [v3](../api_v3/etp.html#getbalance) | [v2](../api_v2/etp.html#getbalance) |
| `getinfo`    | [v3](../api_v3/blockchain.html#getinfo) | [v2](../api_v2/blockchain.html#getinfo) |
| `getnewmultisig`    | [v3](../api_v3/multisig.html#getnewmultisig) | [v2](../api_v2/multisig.html#getnewmultisig) |
| `getpublickey`    | [v3](../api_v3/multisig.html#getpublickey) | [v2](../api_v2/multisig.html#getpublickey) |
| `validateaddress`    | [v3](../api_v3/account.html#validateaddress) | [v2](../api_v2/account.html#validateaddress) |

## Changes some fields
API v3 changes some fields of command.

### getaccount
[v3](../api_v3/account.html#getaccount)
```js
    {
        "address_count",
        "mnemonic",
        "name"
    }
```

[v2](../api_v2/account.html#getaccount)
```js
    {
        "address-count",
        "mnemonic-key",
        "name",
        "user-status"
    }
```

### getnewaccount
[v3](../api_v3/account.html#getnewaccount)
```js
    {
        "addresses",
        "mnemonic",
        "name"
    }
```

[v2](../api_v2/account.html#getnewaccount)
```js
    {
        "default-address",
        "mnemonic"
    }
```

### getblock
[v3](../api_v3/block.html#getblock)
```js
    {
        "bits",
        "hash",
        "merkle_tree_hash",
        "mixhash",
        "nonce",
        "number",
        "previous_block_hash",
        "timestamp",
        "transaction_count",
        "transactions",
        "version"
    }
```

[v2](../api_v2/block.html#getblock)
```js
    {
        "header",
        "txs"
    }
```

### deletelocalasset
[v3](../api_v3/asset.html#deletelocalasset)
```js
    {
        "status",
        "symbol"
    }
```

[v2](../api_v2/asset.html#deletelocalasset)
```js
    {
        "operate",
        "result",
        "symbol"
    }
```

### importaccount
[v3](../api_v3/account.html#importaccount)
```js
    {
        "addresses",
        "mnemonic",
        "name"
    }
```

[v2](../api_v2/account.html#importaccount)
```js
    {
        "addresses",
        "hd_index",
        "mnemonic",
        "name"
    }
```

### signrawtx
[v3](../api_v3/rawtx.html#signrawtx)
```js
    {
        "hash",
        "rawtx"
    }
```

[v2](../api_v2/rawtx.html#signrawtx)
```js
    {
        "hash",
        "hex"
    }
```

### signmultisigtx
[v3](../api_v3/rawtx.html#signmultisigtx)
```js
    {
        "hash",
        "rawtx"
    }
```

[v2](../api_v2/rawtx.html#signmultisigtx)
```js
    {
        "hex"
    }
```

## Change name of field

### API v3 replaces `time_stamp` with `timestamp`. 

Following commands are affected.

|  Method         | API v3                | API v2               | 
|  -------------- | --------------------- | ---------------------| 
| `getblock`    | [v3](../api_v3/block.html#getblock) | [v2](../api_v2/block.html#getblock) |
| `getblockheader`    | [v3](../api_v3/block.html#getblockheader) | [v2](../api_v2/block.html#getblockheader) |
| `getmit`    | [v3](../api_v3/mit.html#getmit) | [v2](../api_v2/mit.html#getmit) |