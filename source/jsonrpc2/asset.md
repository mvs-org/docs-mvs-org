title: asset
comments: false
---

## Description
***

## API Methods 
***

* ### `createasset`
    createasset
    ##### Parameters (optional)
    1. `-d` or `[--description]` The asset description.
    2. `-i` or `[--issuer]` The asset issuer.defaults to account name.
    3. `-n` or `[--decimalnumber]` The asset amount decimal number.
    4. `-s` or `[--symbol]` The asset symbol/name. Global unique.
    5. `-v` or `[--volume]` The asset maximum supply volume.
    ##### Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH"
    ]
     ```
    ##### Returns
    `Object` - 

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"createasset","params":["test", "123456"],"id":35}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 35, 
        "error": {
            "message": "the option '--symbol' is required but missing", 
            "code": 1021
        }
    }
    ```

***

* ### `deletelocalasset`
    deleteunissuedasset
    ##### Parameters (optional)
    1. `-s` or `[--symbol]` The asset symbol/name. Global unique.
    ##### Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH"
    ]
     ```
    ##### Returns
    `Object` - 

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"deleteunissuedasset","params":["test", "123456"],"id":36}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 36, 
        "error": {
            "message": "the option '--symbol' is required but missing", 
            "code": 1021
        }
    }
    ```

***

* ### `getaccountasset`
    getaccountasset
    ##### Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `SYMBOL` Asset symbol.
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "SYMBOL"
    ]
     ```
    ##### Returns
    `Object` - 

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"getaccountasset","params":["test", "123456", "ZGC"],"id":37}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 37, 
        "result": {
            "assets": ""
        }
    }
    ```

***

* ### `getaddressasset`
    getaddressasset
    ##### Parameters (positional)
    1. `ADDRESS` address
    ```js
    params:[
        "ADDRESS"
    ]
     ```
    ##### Returns
    `Object` - 

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"getaddressasset","params":["MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2"],"id":38}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 38, 
        "result": {
            "assets": ""
        }
    }
    ```

***

* ### `getnetasset`
    getasset
    ##### Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `SYMBOL` Asset symbol.
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "SYMBOL"
    ]
     ```
    ##### Returns
    `Object` - 

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"getasset","params":["test", "123456", "ZGC"],"id":39}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 39, 
        "result": {
            "assets": [
                {
                    "status": "issued", 
                    "description": "zgc", 
                    "symbol": "ZGC", 
                    "decimal_number": "0", 
                    "maximum_supply": "100000", 
                    "address": "MWUPQtCw2inJo1fmo8VnKGkedsgFZDkQf3", 
                    "issuer": "18390871195"
                }
            ]
        }
    }
    ```

***

* ### `issue`
    issue
    ##### Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 10 etp
    ##### Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `SYMBOL` issued asset symbol
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "SYMBOL"
    ]
     ```
    ##### Returns
    `Object` - 

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"issue","params":["test", "123456", "ZGC"],"id":40}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 40, 
        "error": {
            "message": "asset symbol is already exist in blockchain", 
            "code": 5009
        }
    }
    ```
***

* ### `issuefrom`
    issuefrom
    ##### Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 10 etp
    ##### Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `ADDRESS` target address
    4. `SYMBOL` issued asset symbol
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "ADDRESS", 
        "SYMBOL"
    ]
     ```
    ##### Returns
    `Object` - 

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"issuefrom","params":["test", "123456", "MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2", "ZGC"],"id":41}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 41, 
        "error": {
            "message": "asset symbol is already exist in blockchain", 
            "code": 5009
        }
    }
    ```
***

* ### `listassets`
    list assets details.
    ##### Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH"
    ]
     ```
    ##### Returns
    `Object` - 

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"listassets","params":["test", "123456"],"id":42}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 42, 
        "result": {
            "assets": ""
        }
    }
    ```
***

* ### `sendasset`
    sendasset
    ##### Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    ##### Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `ADDRESS` Asset receiver.
    4. `SYMBOL` Asset symbol/name.
    5. `AMOUNT` Asset count.
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "ADDRESS", 
        "SYMBOL", 
        "AMOUNT"
    ]
     ```
    ##### Returns
    `Object` - 

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"sendasset","params":["test", "123456", "MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2", "ZGC", "100000000000"],"id":43}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 43, 
        "error": {
            "message": "not enough etp in from address or you are't own from address!", 
            "code": 5302
        }
    }
    ```
***

* ### `sendassetfrom`
    sendassetfrom
    ##### Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    ##### Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `FROMADDRESS` from address
    4. `TOADDRESS` target address
    5. `SYMBOL` asset symbol
    6. `AMOUNT` The asset amount shares
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "FROMADDRESS", 
        "TOADDRESS", 
        "SYMBOL", 
        "AMOUNT"
    ]
     ```
    ##### Returns
    `Object` - 

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"sendassetfrom","params":["test", "123456", "MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2", "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV", "ZGC", "100000000000"],"id":44}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 44, 
        "error": {
            "message": "not enough etp in from address or you are't own from address!", 
            "code": 5302
        }
    }
    ```
***

