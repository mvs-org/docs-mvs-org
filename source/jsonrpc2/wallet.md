title: wallet
comments: false
---

## Description
***

## API Methods 
***

* ### `shutdown`
    stop mvsd.
    ##### Parameters (positional)
    1. `ADMINNAME` admin name.
    2. `ADMINAUTH` admin password/authorization.
    ```js
    params:[
        "ADMINNAME", 
        "ADMINAUTH"
    ]
     ```
    ##### Returns
    `String` - mvs server stoped.

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"stopall","params":["administrator", "administrator"],"id":22}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 22, 
        "result": "mvs server stoped."
    }
    ```

***

* ### `getinfo`

***

* ### `getpeerinfo`

***

* ### `getmininginfo`

***

* ### `startmining`
    start solo mining.
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
    `String` - 

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"start","params":["test", "123456"],"id":20}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 20, 
        "result": "solo mining started at MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2."
    }
    ```

***

* ### `stopmining`
    stop solo mining.
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
    `String` - 

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"stop","params":["test", "123456"],"id":21}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 21, 
        "result": "mining stoped."
    }
    ```

***

* ### `getwork`
    getwork to get mining info
    ##### Returns
    `Object` - 

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"getwork","params":[],"id":18}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 18, 
        "result": {
            "jsonrpc": "1.0", 
            "id": "1", 
            "result": [
                "0x3581eb99481009c9e42bb667a64658c37422b01c6282b0cbdcdfc821f84b4edb", 
                "0xcdf42a47e552f9b4eb01d44a7b6a2b057fbfa1070f3148fd8e7f937a417ffdc1", 
                "0x00000000000c53b59ac4c124c18bb4cf4b25a146809abce70efd33c1607921dc"
            ]
        }
    }
    ```

***

* ### `addnode`

***

* ### `setminingaccount`
    setmining account when pool mining.
    ##### Parameters (positional)
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
    ##### Returns
    `String` - 

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"setminingaccount","params":["test", "123456", "MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2"],"id":19}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 19, 
        "result": "setting address [MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2] successfully."
    }
    ```

***

* ### `submitwork`
    submitwork to submit mining result.
    ##### Parameters (positional)
    1. `NOUNCE` nounce.
    2. `HEADERHASH` header hash.
    3. `MIXHASH` mix hash.
    ```js
    params:[
        "NOUNCE", 
        "HEADERHASH", 
        "MIXHASH"
    ]
     ```
    ##### Returns
    `Boolean` - return submit success or not

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"submitwork","params":["510e97b19fd66cc1", "3581eb99481009c9e42bb667a64658c37422b01c6282b0cbdcdfc821f84b4edb", "84466639954022912678747341235003283994844539402926174863653111473524386000443"],"id":23}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 23, 
        "result": true
    }
    ```

***

* ### `getmemorypool`
    Returns all transactions in memory pool.
    ##### Returns
    `Array` - list of transactions

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"getmemorypool","params":[],"id":28}'

    // Response
    {
        "jsonrpc": "2.0", 
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
