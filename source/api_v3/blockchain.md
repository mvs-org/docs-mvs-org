title: blockchain
comments: false
---

## Description
***

## API Methods 
***

* ### `shutdown`
    stop mvsd.
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH"
    ]
     ```
    * Returns
    `String` - sending SIGTERM to mvsd.

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"3.0","method":"shutdown",
    "params":["test", "123456"],"id":22}'

    // Response
    {
        "jsonrpc": "3.0", 
        "id": 22, 
        "result": "sending SIGTERM to mvsd."
    }
    ```

***

* ### `getinfo`
    getinfo
    * Returns
    `Object` -
    `database_version` - database version 
    `difficulty` - difficulty
    `hash_rate` - hash rate
    `height` - block height
    `is_mining` - is mining flag
    `asset_count` - network assets count
    `peers` - number of peers
    `protocol-version` - protocol version
    `testnet` - testnet flag
    `wallet_account_count` - wallet account count 
    `wallet_version` - wallet version

    * Example
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"3.0",
        "method":"getinfo",
        "params":[]
    }' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 25,
        "jsonrpc" : "3.0",
        "result" : 
        {
            "database_version" : "0.6.3",
            "difficulty" : "2109083",
            "hash_rate" : 0,
            "height" : 105506,
            "is_mining" : false,
            "asset_count" : 9,
            "peers" : 2,
            "protocol_version" : 70012,
            "testnet" : true,
            "wallet_account_count" : 2,
            "wallet_version" : "0.7.2"
        }
    }
    ```

***

* ### `getheight`
    Get last height. Alias as `fetch-height`.
    * Returns
    `Number` - the latest block height
    * Example
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"3.0",
        "method":"getheight",
        "params":[]
    }' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 25,
        "jsonrpc" : "3.0",
        "result" : 105506
    }
    ```
***

* ### `getpeerinfo`
    getpeerinfo
    * Returns
    `Object` -
    `peers` - peers info
    * Example
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"3.0",
        "method":"getpeerinfo",
        "params":[]
    }' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 25,
        "jsonrpc" : "3.0",
        "result" : 
        [
            "118.178.16.25:15251",
            "104.131.154.21:15251"
        ]
    }
    ```

***

* ### `getmininginfo`
    getmininginfo
    * Returns
    `Object` -
    `mining-info` - mining info
    * Example
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"3.0",
        "method":"getmininginfo",
        "params":[]
    }' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 25,
        "jsonrpc" : "3.0",
        "result" : 
        {
            "difficulty" : "2233275",
            "height" : "108374",
            "is_mining" : false,
            "rate" : "0"
        }
    }
    ```

***

* ### `startmining`
    start solo mining.
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH"
    ]
     ```
    * Returns
    `String` - solo mining started at ...

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"3.0","method":"startmining",
    "params":["test", "123456"],"id":20}'

    // Response
    {
        "jsonrpc": "3.0", 
        "id": 20, 
        "result": "solo mining started at MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2."
    }
    ```

***

* ### `stopmining`
    stop solo mining.
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH"
    ]
     ```
    * Returns
    `String` - 

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"3.0","method":"stopmining",
    "params":["test", "123456"],"id":21}'

    // Response
    {
        "jsonrpc": "3.0", 
        "id": 21, 
        "result": "mining stoped."
    }
    ```

***

* ### `getwork`
    getwork to get mining info
    * Parameters (positional)
    1. `ACCOUNTNAME` Mining Account name.
    2. `ACCOUNTAUTH` Mining Account password/authorization.
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH"
    ]
     ```
    * Returns
    `Array` -

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"3.0","method":"getwork",
    "params":["test", "123456"],"id":18}'

    // Response
    {
        "jsonrpc": "3.0", 
        "id": 18, 
        "result": [
            "0x3581eb99481009c9e42bb667a64658c37422b01c6282b0cbdcdfc821f84b4edb",
            "0xcdf42a47e552f9b4eb01d44a7b6a2b057fbfa1070f3148fd8e7f937a417ffdc1",
            "0x00000000000c53b59ac4c124c18bb4cf4b25a146809abce70efd33c1607921dc"
        ]
    }
    ```

***

* ### `addnode`
    This command is used to add/remove p2p node.
    * Parameters (optional)
    1. `-o` or `[--operation]` The operation `add`/`ban` to the target node address. default: `add`.
    * Parameters (positional)
    1. `NODEADDRESS` The target node address, e.g: 10.10.10.1:5251.
    ```js
    params:[
        "NODEADDRESS", 
    ]
     ```
    * Returns
    `String` - 

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"3.0","method":"addnode",
    "params":["10.10.20.1:5251"],"id":21}'

    // Response
    {
        "jsonrpc": "3.0", 
        "id": 21, 
        "result": "success"
    }
    ```

***

* ### `setminingaccount`
    setmining account when pool mining.
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `PAYMENT_ADDRESS` the payment address of this account.
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "PAYMENT_ADDRESS"
    ]
     ```
    * Returns
    `String` - Address [...] setted. 

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"3.0","method":"setminingaccount",
    "params":["test", "123456", "MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2"],"id":19}'

    // Response
    {
        "jsonrpc": "3.0", 
        "id": 19, 
        "result": "Address [tRL8yxhSd3AAxpRcbxmEasv89VZ7ZJgh3y] setted."
    }
    ```

***

* ### `submitwork`
    submitwork to submit mining result.
    * Parameters (positional)
    1. `NOUNCE` nounce. (without leading 0x)
    2. `HEADERHASH` header hash. (with leading 0x)
    3. `MIXHASH` mix hash. (with leading 0x)
    ```js
    params:[
        "NOUNCE", 
        "HEADERHASH", 
        "MIXHASH"
    ]
     ```
    * Returns
    `Boolean` - return submit success or not

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"3.0","method":"submitwork",
    "params":["510e97b19fd66cc1", "0x3581eb99481009c9e42bb667a64658c37422b01c6282b0cbdcdfc821f84b4edb", "0x84466639954022912678747341235003283994844539402926174863653111473524386000443"],"id":23}'

    // Response
    {
        "jsonrpc": "3.0", 
        "id": 23, 
        "result": true
    }
    ```

***

* ### `eth_getWork`
    eth_getWork to get mining info. 
    Note: this API is almost the same as eth_getWork in ethereum, but for the `URI` shall be set to `/rpc/v3`, not `/rpc/v3`.
    For details, please refer to: https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getwork

***

* ### `eth_submitWork`
    eth_submitWork to submit mining result.
    Note: this API is almost the same as eth_submitWork in ethereum, but for the `URI` shall be set to `/rpc/v3`, not `/rpc/v3`.
    For details, please refer to: https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_submitwork
***

* ### `getmemorypool`
    Returns all transactions in memory pool.
    * Returns
    `Array` - list of transactions

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"3.0","method":"getmemorypool","params":[],"id":28}'

    // Response
    {
        "jsonrpc": "3.0", 
        "id": 28, 
        "result": [
            {
                "inputs": [
                    {
                        "previous_output": {
                            "index": "2", 
                            "hash": "ccaa270fbcc55583cfcb911a35a4a4aa92f68c311ecdd62790c63f2c8119c4eb"
                        }, 
                        "script": "[ 3045022100c490ca97e4100a956c70da14b3a3d882a54fa7b3b103c55871ec7c71fbeb1f4702201c2ab0e68ff4cd7175145cb5fca3941179dfa1f53a99e9c4b8c32af55f55d64101 ] [ 0240bc01ddeed51ee13363348b1f992a0e34c9657a1bae91ee4927fb319bdbe8b8 ]", 
                        "sequence": "4294967295", 
                        "address": "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV"
                    }
                ], 
                "lock_time": "0", 
                "version": "2", 
                "hash": "ef0f1ba4e7e10f084aa4287d952699e832b77c4c87abbea3e1ba088604c4f745", 
                "outputs": [
                    {
                        "index": "0", 
                        "script": "dup hash160 [ 3007c09fdedeebcd243e23ff59ede328c2da5c9f ] equalverify checksig", 
                        "attachment": {
                            "type": "etp"
                        }, 
                        "value": "100000000000", 
                        "address": "MCH7xHbfVD8viUcZ3xgDdSJANhS7DQDJAi"
                    }, 
                    {
                        "index": "1", 
                        "script": "dup hash160 [ 2759a0422370c52ac7bc57f6b3a082877bf40400 ] equalverify checksig", 
                        "attachment": {
                            "type": "etp"
                        }, 
                        "value": "4999700299970000", 
                        "address": "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV"
                    }
                ]
            }
        ]
    }
    ```
