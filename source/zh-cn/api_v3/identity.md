title: did
comments: false
---

## Description
***

## API Methods 
***
* ### `registerdid`
    registerdid
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 10 etp
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `ADDRESS` target address.
    4. `SYMBOL` register did symbol
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
        "jsonrpc":"3.0",
        "method":"registerdid",
        "params":[
            "test",
            "123456",
            "MN3UNt5FbUbpsYtW6UfhcieykUb8rXKP5g",
            "TESTDID"
        ]
    }' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 25,
        "jsonrpc" : "3.0",
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
                            "address" : "MN3UNt5FbUbpsYtW6UfhcieykUb8rXKP5g",
                            "symbol" : "TESTDID",
                            "type" : "did-register"
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
    curl -X POST --data '{"jsonrpc":"3.0","method":"listdids","id":42}'  http://127.0.0.1:8820/rpc/v3/
    // Response
    {
        "jsonrpc": "3.0", 
        "id": 42, 
        "result":
        [
            {
                "address" : "MN3UNt5FbUbpsYtW6UfhcieykUb8rXKP5g",
                "status" : "registered",
                "symbol" : "TESTDID"
            },
            {
                "address" : "35cY636TPTfFW8PxhqH3BNRL54g1T4mbR2",
                "status" : "registered",
                "symbol" : "MVS.TST"
            },
            {
                "address" : "M9kDHsDKJj9hM8FzSmDu4xCDbo2DFzUhzj",
                "status" : "registered",
                "symbol" : "YANG"
            }
        ]
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
    curl -X POST --data '{"jsonrpc":"3.0","method":"listdids",
    "params":["test", "123456"],"id":42}'  http://127.0.0.1:8820/rpc/v3/

    // Response
    {
        "jsonrpc": "3.0", 
        "id": 42, 
        "result":
        [
            {
                "address" : "MN3UNt5FbUbpsYtW6UfhcieykUb8rXKP5g",
                "status" : "registered",
                "symbol" : "TESTDID"
            },
            {
                "address" : "M9kDHsDKJj9hM8FzSmDu4xCDbo2DFzUhzj",
                "status" : "registered",
                "symbol" : "YANG"
            }
        ]
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
    curl -X POST --data '{"jsonrpc":"3.0","method":"didsend",
    "params":["test", "123456", "YANG", "100"],"id":7}'  http://127.0.0.1:8820/rpc/v3/

    // Response
    {
        "id" : 7,
        "jsonrpc" : "3.0",
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
                        "address" : "M9kDHsDKJj9hM8FzSmDu4xCDbo2DFzUhzj",
                        "attachment" : 
                        {
                            "from_did" : "",
                            "to_did" : "YANG",
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
* ### `didsendmore`
    didsendmore
    send etp to  multi-receivers(did/address).
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    2. `-m` or `[--mychange]` Mychange to this did/address
    3. `-r` or `[--receivers]` Send to [did/address:amount]
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
    `Object` - return the transaction

    * Example

    ```js
    // Request
    curl -X POST --data '{
        "id":125,
        "jsonrpc":"3.0",
        "method":"didsendmore",
        "params":[
            "test",
            "123456",
            {
                "receivers":[
                        "test1:10000",
                        "test2:10000",
                        "M95tQAUQ61acvpBWzpojseffTViWV5R9E7:10000"
                ],
                "mychange": "test3"
            }
        ]
    }' 127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 7,
        "jsonrpc" : "3.0",
        "result" : 
    {
            "transaction" :
            {
                "hash" : "91b16c8498766edfe6f36d0cbcdbb2eea43124ea67181bba85844034be1c2fb7",
                "inputs" :
                [
                    {
                        "address" : "MBu7Bk4udQsL232PqBSzo8nAJpKjLbNo6x",
                        "previous_output" :
                        {
                            "hash" : "3d382ca4b754194840c3289a75aa5d6522f443101a8652da2408c7117aeac688",
                            "index" : 0
                        },
                        "script" : "[ 3045022100aa48e560417bfad021b3159d962c66a86b29f4ceeb2ea37b53bbf21118e5869c0220179e731d1a6a96d4ae5b7a4dfee6b1f82e2fcac410f3d58169759d745fda27b401 ] [02e710be4f24f7ad525d532df1f92944c494d6a1d66fefb5c8e535febaac0d8422 ]",
                        "sequence" : 4294967295
                    }
                ],
                "lock_time" : "0",
                "outputs" :
                [
                    {
                        "address" : "MV2zNNfTPjNAU3WpT1nyEMzQUnCuL2CuHb",
                        "attachment" : 
                        {
                            "from_did" : "",
                            "to_did" : "test1",
                            "type" : "etp"
                        },
                        "index" : 0,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ e7d5bc64873376a28ef795aeed25d25403e0e06c ] equalverify checksig",
                        "value" : 10000
                    },
                    {
                        "address" : "MPeT7urwkXn79e4Ef1vAFjhb8m5ezuj4G9",
                        "attachment" : 
                        {
                            "from_did" : "",
                            "to_did" : "test2",
                            "type" : "etp"
                        },
                        "index" : 1,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ acb9dec4c28f2728862d38f0d091b000c894b11d ] equalverify checksig",
                        "value" : 10000
                    },
                    {
                        "address" : "M95tQAUQ61acvpBWzpojseffTViWV5R9E7",
                        "attachment" :
                        {
                                "type" : "etp"
                        },
                        "index" : 2,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 0cff7c3ea1fb0c7d7a964056970882e9a4b1b19a ] equalverify checksig",
                        "value" : 10000
                    },
                    {
                        "address" : "MLasJFxZQnA49XEvhTHmRKi2qstkj9ppjo",
                        "attachment" : 
                        {
                            "from_did" : "",
                            "to_did" : "test3",
                            "type" : "etp"
                        },
                        "index" : 3,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 8b24031888c2896cedb764012677868b5c64ef3b ] equalverify checksig",
                        "value" : 299960000
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
    curl -X POST --data '{"jsonrpc":"3.0","method":"didsendfrom",
    "params":["test", "123456", "TESTDID", "GUANG", "10000"],"id":7}'  http://127.0.0.1:8820/rpc/v3/

    // Response
    {
        "id" : 7,
        "jsonrpc" : "3.0",
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
                            "from_did" : "",
                            "to_did" : "GUANG",
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
                            "from_did" : "TESTDID",
                            "to_did" : "",
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
    curl -X POST --data '{"jsonrpc":"3.0","method":"didsendasset",
    "params":["test", "123456", "TESTDID", "MVS.AST", "99"],"id":7}'  http://127.0.0.1:8820/rpc/v3/

    // Response
    {
        "id" : 7,
        "jsonrpc" : "3.0",
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
                            "from_did" : "",
                            "quantity" : 99,
                            "symbol" : "MVS.AST",
                            "to_did" : "TESTDID",
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
                            "symbol" : "MVS.AST",
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
    curl -X POST --data '{"jsonrpc":"3.0","method":"didsendfrom",
    "params":["test", "123456", "TESTDID", "GUANG", "MVS.AST", "85"],"id":7}'  http://127.0.0.1:8820/rpc/v3/

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
                        "from_did" : "TESTDID",
                        "quantity" : 85,
                        "symbol" : "MVS.AST",
                        "to_did" : "GUANG",
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
                        "symbol" : "MVS.AST",
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

* ### `didchangeaddress`
    change did address,and the toaddress will pay the fee,to prove that you own this address to hold the did.
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `TOADDRESS` Target address
    4. `SYMBOL` Did symbol

    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "TOADDRESS", 
        "SYMBOL"
    ]
    ```
    * Returns
    `Object` - 

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"3.0","method":"didmodifyaddress",
    "params":["test", "123456",  "MFzPrUeNstFDTmnLdFYrD6PVtANS2281oP", "GUANG"],"id":7}'  http://127.0.0.1:8820/rpc/v3/

    // Response
    {
        "transaction" :
        {
            "hash" : "65b139a3f589a3c6b10845b7660212f44f73db0dc25ed341549bad8908547202",
            "inputs" :
            [
                {
                    "address" : "MKNCEEsdS7tzbGHAT8E6VEpaxTHd5nSuxA",
                    "previous_output" :
                    {
                        "hash" : "4eb928fd66b1f25eb04b16fe4d6ee787b4015dabf41b5891a85609c2ebad60b7",
                        "index" : 0
                    },
                    "script" : "[ 3045022100c01918d056fbe964bb90a5bfbec4e97052e596928afbb65b9b76ef16c8f3f062022035d43fd2a4d9e4998ba15ce31f026419ed3d20f560fb763ef32fc5dc761ca29101 ] [ 032c3803a8848f74b8ba96713d2222c6b4c43e526968c8461f83eb53bf935702e3 ]",
                    "sequence" : 4294967295
                },
                {
                    "address" : "MFzPrUeNstFDTmnLdFYrD6PVtANS2281oP",
                    "previous_output" :
                    {
                        "hash" : "67d5ec0b346f9cdf2b3ccfb40d9010635d41ac7bfb921c4cee29df71d34cd8aa",
                        "index" : 0
                    },
                    "script" : "[ 304402207fc66f31f97c2231b4bd05fee0cb0999b97487fb72f55c66533fbee224eeb5a3022056b8c7378543e88013d02c40a184db7d5624287750c0136d21c99421a5bb514801 ] [ 02b1d147fa3fbc815c6b2cdf1461fcede45c5fbf44cf4082d3ffe4faa452d36673 ]",
                    "sequence" : 4294967295
                }
            ],
            "lock_time" : "0",
            "outputs" :
            [
                {
                    "address" : "MFzPrUeNstFDTmnLdFYrD6PVtANS2281oP",
                    "attachment" : 
                    {
                        "address" : "MFzPrUeNstFDTmnLdFYrD6PVtANS2281oP",
                        "symbol" : "GUANG",
                        "type" : "did-transfer"
                    },
                    "index" : 0,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 58be74eccf7dc9a4edd067d63d75c5bae99c5913 ] equalverify checksig",
                    "value" : 0
                },
                {
                    "address" : "MFzPrUeNstFDTmnLdFYrD6PVtANS2281oP",
                    "attachment" :
                    {
                        "type" : "etp"
                    },
                    "index" : 1,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 58be74eccf7dc9a4edd067d63d75c5bae99c5913 ] equalverify checksig",
                    "value" : 299990000
                }
            ],
            "version" : "2"
        }
    }
    ```
***


* ### `getdid`
    list dids.
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
    curl -X POST --data '{"jsonrpc":"3.0","method":"getdid","params":[""],"id":42}'  http://127.0.0.1:8820/rpc/v3/

    // Response
    {
        "jsonrpc": "3.0", 
        "id": 42, 
        "result":
        [
            "Alice",
            "Bob",
            "Cindy",
            "Dale"
        ]   
    }
    ```
***

* ### `getdid`
    list history addresses of did.
    * Parameters (positional)
    1. `SYMDID/ADDRESS` Did symbol or address  .
    
    ```js
    params:[
        "SYMDID/ADDRESS"
    ]
    ```
    * Returns
    `Object` - addresses

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"3.0","method":"getdid","params":["MSvm4CPTvzhgktUXu7BKrHuFuUcZd7jqzK"],"id":42}'  http://127.0.0.1:8820/rpc/v3/

    // Response
    {
        "id" : 42,
        "jsonrpc" : "3.0",
        "result" : 
        {
            [
                {
                        "address" : "MSvm4CPTvzhgktUXu7BKrHuFuUcZd7jqzK",
                        "status" : "current"
                },
                {
                        "address" : "MB2gtNeGDVeqscVJF8DVNBsVTNdfAEJXU5",
                        "status" : "history"
                },
                {
                        "address" : "MSvm4CPTvzhgktUXu7BKrHuFuUcZd7jqzK",
                        "status" : "history"
                }
            ]
        }
    }
    ```
***