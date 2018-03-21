title: did
comments: false
---

## Description
***

## API Methods 
***

* ### `createdid`
    createdid
    * Parameters (optional)
    1. `-d` or `[--description]` The did description.
    2. `-i` or `[--issuer]` The did issuer.defaults to account name.
    3. `-s` or `[--symbol]` The did symbol/name. Global unique.defaults to account name.
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
    `Object` - the did just created

    * Example
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"createdid",
        "params":[
            "test",
            "123456",
            {
                "description": "test did",
                "issuer": "test",
                "symbol": "testdid",
            }
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 25,
        "jsonrpc" : "2.0",
        "result" : 
        {
             "did" :
            {
                "description" : "test did",
                "issuer" : "test",
                "symbol" : "TESTDID"
            }
        }
    }
    ```

***
* ### `issuedid`
    issuedid
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 10 etp
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `ADDRESS` target address.
    4. `SYMBOL` issued did symbol
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "ADDRESS", 
        "SYMBOL"
    ]
     ```
    * Returns
    `Object` - transaction

    * Example
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"issuedid",
        "params":[
            "test",
            "123456",
            "MN3UNt5FbUbpsYtW6UfhcieykUb8rXKP5g",
            "TESTDID"
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 25,
        "jsonrpc" : "2.0",
        "result" : 
        {
           "transaction" :
        {
                "hash" : "ed1394b9d6bb2798b3c449035334911a6357da10f833e2b9fe573b9dbad185b4",
                "inputs" :
                [
                        {
                                "address" : "MTfMLxFcYF2vLn3n1U1mCyjQgUES8Z4p49",
                                "previous_output" :
                                {
                                        "hash" : "f8df1cea4d765072ce09f87ef33aac3fc51de38c1308cc97060fd248f325466d",
                                        "index" : 0
                                },
                                "script" : "[ 304402202445059f1bea17a3f636fb4f51f4daee93c4c946cd8ddf5ef1bd143241df51000220144da3861858c1577f5235448db66720381de4d66fb997bb386ab4bdc8c9e10001 ] [ 024f353908de1c6f02436424de7f335477a4c2dde5891403c9df06b6de0661503d ]",
                                "sequence" : 4294967295
                        }
                ],
                "lock_time" : "0",
                "outputs" :
                [
                        {
                                "address" : "MTfMLxFcYF2vLn3n1U1mCyjQgUES8Z4p49",
                                "attachment" :
                                {
                                        "address" : "MTfMLxFcYF2vLn3n1U1mCyjQgUES8Z4p49",
                                        "description" : "test did",
                                        "issuer" : "test",
                                        "symbol" : "TESTDID",
                                        "type" : "did-issue"
                                },
                                "index" : 0,
                                "locked_height_range" : 0,
                                "script" : "dup hash160 [ d8c5f7eb3c0a3f83a66b161baf74ffa330e4acac ] equalverify checksig",
                                "value" : 0
                        },
                        {
                                "address" : "MTfMLxFcYF2vLn3n1U1mCyjQgUES8Z4p49",
                                "attachment" :
                                {
                                        "type" : "etp"
                                },
                                "index" : 1,
                                "locked_height_range" : 0,
                                "script" : "dup hash160 [ d8c5f7eb3c0a3f83a66b161baf74ffa330e4acac ] equalverify checksig",
                                "value" : 15299990000
                        }
                ],
                "version" : "2"
        }
    }
    ```
***

* ### `listdids`
    list dids details of blockchain.
    * Parameters (positional)

    ```js
    params:[
    ]
     ```
    * Returns
    `Object` - dids

    * Example
    ```js
     // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"listdids","id":42}'
    // Response
    {
        "jsonrpc": "2.0", 
        "id": 42, 
        "result":
         {
            "dids" :
            [
                {
                        "address" : "MN3UNt5FbUbpsYtW6UfhcieykUb8rXKP5g",
                        "description" : "",
                        "issuer" : "yangguanglu",
                        "status" : "issued",
                        "symbol" : "LU"
                },
                {
                        "address" : "MN3UNt5FbUbpsYtW6UfhcieykUb8rXKP5g",
                        "description" : "",
                        "issuer" : "yangguanglu",
                        "status" : "issued",
                        "symbol" : "MVS.TST"
                },
                {
                        "address" : "MN3UNt5FbUbpsYtW6UfhcieykUb8rXKP5g",
                        "description" : "",
                        "issuer" : "yangguanglu",
                        "status" : "issued",
                        "symbol" : "GUANG"
                }
            ]
        }
    }
    ```

***

* ### `listdids`
    list dids details of account.
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
    `Object` - dids

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"listdids",
    "params":["test", "123456"],"id":42}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 42, 
        "result":
         {
             "dids" :
            [
                {
                        "address" : "",
                        "description" : "test did",
                        "issuer" : "test",
                        "status" : "unissued",
                        "symbol" : "TESTDID"
                },
                {
                        "address" : "",
                        "description" : "",
                        "issuer" : "test",
                        "status" : "unissued",
                        "symbol" : "YANG"
                }
            ]
        }
    }
    ```
***

* ### `didsend`
    didsend
    send etp to a did (or address)
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `DID/ADDRESS` Did receiver,address is also OK.
    4. `AMOUNT` Asset count.
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "DID/ADDRESS", 
        "AMOUNT"
    ]
     ```
    * Returns
    `Object` - 

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"didsend",
    "params":["test", "123456", "yang", "100"],"id":7}'

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "transaction" :
            {
                "hash" : "1635ced4e1ca2eff77de775238c9a1b24ba399661424742fe5be10a2b018e169",
                "inputs" :
                [
                        {
                                "address" : "MTfMLxFcYF2vLn3n1U1mCyjQgUES8Z4p49",
                                "previous_output" :
                                {
                                        "hash" : "ed1394b9d6bb2798b3c449035334911a6357da10f833e2b9fe573b9dbad185b4",
                                        "index" : 1
                                },
                                "script" : "[ 3045022100a4476eb7745a25c28d0a43a0ef21a080ac3e0db7b27aa8dc3327455ac631551f02201d4f34afefe138823318fa9ba3257539d4d779663d7df14ea72336a8441a6f9301 ] [ 024f353908de1c6f02436424de7f335477a4c2dde5891403c9df06b6de0661503d ]",
                                "sequence" : 4294967295
                        }
                ],
                "lock_time" : "0",
                "outputs" :
                [
                        {
                                "address" : "MN3UNt5FbUbpsYtW6UfhcieykUb8rXKP5g",
                                "attachment" :
                                {
                                        "type" : "etp"
                                },
                                "index" : 0,
                                "locked_height_range" : 0,
                                "script" : "dup hash160 [ 9b243c66c9d4789ba056ef65573d4141e5ede73a ] equalverify checksig",
                                "value" : 100
                        },
                        {
                                "address" : "MTfMLxFcYF2vLn3n1U1mCyjQgUES8Z4p49",
                                "attachment" :
                                {
                                        "type" : "etp"
                                },
                                "index" : 1,
                                "locked_height_range" : 0,
                                "script" : "dup hash160 [ d8c5f7eb3c0a3f83a66b161baf74ffa330e4acac ] equalverify checksig",
                                "value" : 15299979900
                        }
                ],
                "version" : "2"
            }
        }
    }
    ```
***

* ### `didsendfrom`
    didsendfrom, send etp form a did or address
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `FROMDID/FROMADDRESS` from did or address
    4. `TODID/TOADDRESS` target did or address
    5. `AMOUNT` The etp amount shares
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "FROMDID/FROMADDRESS", 
        "TODID/TOADDRESS", 
        "AMOUNT"
    ]
     ```
    * Returns
    `Object` - 

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"didsendfrom",
    "params":["test", "123456", "testdid", "guang", "10000"],"id":7}'

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" : 
        {
             "transaction" :
            {
                "hash" : "554586c33edc5b264192d2ab596d78dd9a16acebfef8704edcc04627f966553c",
                "inputs" :
                [
                        {
                                "address" : "MTfMLxFcYF2vLn3n1U1mCyjQgUES8Z4p49",
                                "previous_output" :
                                {
                                        "hash" : "1635ced4e1ca2eff77de775238c9a1b24ba399661424742fe5be10a2b018e169",
                                        "index" : 1
                                },
                                "script" : "[ 304402203c96b9713b6319597b7f32f46fe7b907c339c99ae836a4988c866ca3b18c5fa702200458171e27d98a34fa8e861d7f67eed15bdebfbd880fa947e87d297a7478a62001 ] [ 024f353908de1c6f02436424de7f335477a4c2dde5891403c9df06b6de0661503d ]",
                                "sequence" : 4294967295
                        }
                ],
                "lock_time" : "0",
                "outputs" :
                [
                        {
                                "address" : "MN3UNt5FbUbpsYtW6UfhcieykUb8rXKP5g",
                                "attachment" :
                                {
                                        "type" : "etp"
                                },
                                "index" : 0,
                                "locked_height_range" : 0,
                                "script" : "dup hash160 [ 9b243c66c9d4789ba056ef65573d4141e5ede73a ] equalverify checksig",
                                "value" : 10000
                        },
                        {
                                "address" : "MTfMLxFcYF2vLn3n1U1mCyjQgUES8Z4p49",
                                "attachment" :
                                {
                                        "type" : "etp"
                                },
                                "index" : 1,
                                "locked_height_range" : 0,
                                "script" : "dup hash160 [ d8c5f7eb3c0a3f83a66b161baf74ffa330e4acac ] equalverify checksig",
                                "value" : 15299959900
                        }
                ],
                "version" : "2"
            }
        }
    }
     ```
***

* ### `didsendasset`
    didsend
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `DID/ADDRESS` Did receiver,address is also OK.
    4. `SYMBOL` Asset symbol/name.
    5. `AMOUNT` Asset count.
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "DID/ADDRESS", 
        "SYMBOL", 
        "AMOUNT"
    ]
     ```
    * Returns
    `Object` - 

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"didsendasset",
    "params":["yangguanglu", "123456", "testdid", "zgc", "99"],"id":7}'

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" : 
        {
             "transaction" :
            {
                "hash" : "6a437614381ffc15d03702b69e7c5640c25abb0f26c8d578036db74f137a4444",
                "inputs" :
                [
                        {
                                "address" : "MLGn2wS5CMGFfhLk5s2uM1nSCnKgiEywCY",
                                "previous_output" :
                                {
                                        "hash" : "e876c839689559dcd981dd7018eb58de591a8273eb464b27800d0aaed3d7495a",
                                        "index" : 2
                                },
                                "script" : "[ 304502210095d51cb41cb2f554e72078db4a55304b1980375231e78a9ecb7bd3e1cf1a76be022027d9b7452188bf202d86279aced07dbcf04f1507e9c363df264e970f9fe98a3801 ] [ 033f28a39b2baebbde3714c099060d13a1d968951e2bb9c7e498281ee31defa0ac ]",
                                "sequence" : 4294967295
                        },
                        {
                                "address" : "MLGn2wS5CMGFfhLk5s2uM1nSCnKgiEywCY",
                                "previous_output" :
                                {
                                        "hash" : "e876c839689559dcd981dd7018eb58de591a8273eb464b27800d0aaed3d7495a",
                                        "index" : 1
                                },
                                "script" : "[ 30440220525ca69da875d100413d97c088ddfdb73b4332e3bebbcba679fe4774f6dba11802200448bb447febba8bd57c2e54dc829132561a1cae8fedb15be443f27fc9467f6201 ] [ 033f28a39b2baebbde3714c099060d13a1d968951e2bb9c7e498281ee31defa0ac ]",
                                "sequence" : 4294967295
                        }
                ],
                "lock_time" : "0",
                "outputs" :
                [
                        {
                                "address" : "MTfMLxFcYF2vLn3n1U1mCyjQgUES8Z4p49",
                                "attachment" :
                                {
                                        "quantity" : 99,
                                        "symbol" : "ZGC",
                                        "type" : "asset-transfer"
                                },
                                "index" : 0,
                                "locked_height_range" : 0,
                                "script" : "dup hash160 [ d8c5f7eb3c0a3f83a66b161baf74ffa330e4acac ] equalverify checksig",
                                "value" : 0
                        },
                        {
                                "address" : "MLGn2wS5CMGFfhLk5s2uM1nSCnKgiEywCY",
                                "attachment" :
                                {
                                        "type" : "etp"
                                },
                                "index" : 1,
                                "locked_height_range" : 0,
                                "script" : "dup hash160 [ 87b82168ff5a87fa9240b878538304a8ecba0940 ] equalverify checksig",
                                "value" : 199960000
                        },
                        {
                                "address" : "MLGn2wS5CMGFfhLk5s2uM1nSCnKgiEywCY",
                                "attachment" :
                                {
                                        "quantity" : 8800,
                                        "symbol" : "ZGC",
                                        "type" : "asset-transfer"
                                },
                                "index" : 2,
                                "locked_height_range" : 0,
                                "script" : "dup hash160 [ 87b82168ff5a87fa9240b878538304a8ecba0940 ] equalverify checksig",
                                "value" : 0
                        }
                ],
                "version" : "2"
            }
        }
    }
    ```
***

* ### `didsendassetfrom`
    didsendfrom, should specify `from address`
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `FROMDID/FROMADDRESS` from did or address
    4. `TODID/TOADDRESS` target did or address
    5. `SYMBOL` asset symbol
    6. `AMOUNT` The asset amount shares
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "FROMDID/FROMADDRESS", 
        "TODID/TOADDRESS", 
        "SYMBOL", 
        "AMOUNT"
    ]
     ```
    * Returns
    `Object` - 

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"didsendfrom",
    "params":["test", "123456", "testdid", "guang", "zgc", "85"],"id":7}'

    // Response
    {
        "transaction" :
        {
                "hash" : "ef4d8db0835271899eb2532f0ac38011345b0608606406c6664cfc0d033150a5",
                "inputs" :
                [
                        {
                                "address" : "MTfMLxFcYF2vLn3n1U1mCyjQgUES8Z4p49",
                                "previous_output" :
                                {
                                        "hash" : "554586c33edc5b264192d2ab596d78dd9a16acebfef8704edcc04627f966553c",
                                        "index" : 1
                                },
                                "script" : "[ 3044022028f3edf0b82d567ce851919703a4c8b4dbd447f0e24e13dcc32d7b57de1a280a02202c24fb4820709c59d2658ef71b89a95c86a1301be1d8f4536e470fc76a3d78bc01 ] [ 024f353908de1c6f02436424de7f335477a4c2dde5891403c9df06b6de0661503d ]",
                                "sequence" : 4294967295
                        },
                        {
                                "address" : "MTfMLxFcYF2vLn3n1U1mCyjQgUES8Z4p49",
                                "previous_output" :
                                {
                                        "hash" : "6a437614381ffc15d03702b69e7c5640c25abb0f26c8d578036db74f137a4444",
                                        "index" : 0
                                },
                                "script" : "[ 304402203c07ce8c2f12c7aa6e23318963d385960d2521cd582d5375cc05bf84abf4f9ae0220145ecbfa75dd96108b04dcaebaad136b88dfdb8f3f797f5dd24f62f01182e56e01 ] [ 024f353908de1c6f02436424de7f335477a4c2dde5891403c9df06b6de0661503d ]",
                                "sequence" : 4294967295
                        }
                ],
                "lock_time" : "0",
                "outputs" :
                [
                        {
                                "address" : "MN3UNt5FbUbpsYtW6UfhcieykUb8rXKP5g",
                                "attachment" :
                                {
                                        "quantity" : 85,
                                        "symbol" : "ZGC",
                                        "type" : "asset-transfer"
                                },
                                "index" : 0,
                                "locked_height_range" : 0,
                                "script" : "dup hash160 [ 9b243c66c9d4789ba056ef65573d4141e5ede73a ] equalverify checksig",
                                "value" : 0
                        },
                        {
                                "address" : "MTfMLxFcYF2vLn3n1U1mCyjQgUES8Z4p49",
                                "attachment" :
                                {
                                        "type" : "etp"
                                },
                                "index" : 1,
                                "locked_height_range" : 0,
                                "script" : "dup hash160 [ d8c5f7eb3c0a3f83a66b161baf74ffa330e4acac ] equalverify checksig",
                                "value" : 15299949900
                        },
                        {
                                "address" : "MTfMLxFcYF2vLn3n1U1mCyjQgUES8Z4p49",
                                "attachment" :
                                {
                                        "quantity" : 14,
                                        "symbol" : "ZGC",
                                        "type" : "asset-transfer"
                                },
                                "index" : 2,
                                "locked_height_range" : 0,
                                "script" : "dup hash160 [ d8c5f7eb3c0a3f83a66b161baf74ffa330e4acac ] equalverify checksig",
                                "value" : 0
                        }
                ],
                "version" : "2"
        }
    }
    ```
***
