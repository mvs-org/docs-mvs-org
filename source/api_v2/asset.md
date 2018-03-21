title: asset
comments: false
---

## Description
***

## API Methods 
***

* ### `createasset`
    createasset
    * Parameters (optional)
    1. `-d` or `[--description]` The asset description.
    2. `-i` or `[--issuer]` The asset issuer.defaults to account name.
    3. `-n` or `[--decimalnumber]` The asset amount decimal number.
    4. `-s` or `[--symbol]` The asset symbol/name. Global unique.
    5. `-v` or `[--volume]` The asset maximum supply volume.
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
    `Object` - the asset just created

    * Example
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"createasset",
        "params":[
            "test",
            "123456",
            {
                "description": "test asset",
                "issuer": "test",
                "decimalnumber": 8,
                "symbol": "MVS.TST",
                "volume": 10000000
            }
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 25,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "asset" : 
            {
                "address" : "",
                "decimal_number" : 8,
                "description" : "test asset",
                "issuer" : "test",
                "maximum-supply" : 10000000,
                "symbol" : "MVS.TST"
            }
        }
    }
    ```

***

* ### `deletelocalasset`
    deletelocalasset
    * Parameters (optional)
    1. `-s` or `[--symbol]` The asset symbol/name. Global unique.
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
    `Object` - 
    `operate` - delete operation
    `result` - success
    `symbol` - asset symbol

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"deletelocalasset",
    "params":["test", "123456", {"symbol": "MVS.TST2"}],"id":36}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 36, 
        "result" : 
        {
            "operate" : "delete",
            "result" : "success",
            "symbol" : "MVS.TST2"
        }
    }
    ```

***

* ### `getaccountasset`
    getaccountasset
    * Parameters (positional)
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
    * Returns
    `Object` - account assets

    * Example
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"getaccountasset",
        "params":[
            "test",
            "123456",
            "MVS.TST"
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 25,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "assets" : 
            [
                {
                    "address" : "",
                    "decimal_number" : "8",
                    "quantity" : "10000000",
                    "status" : "unissued",
                    "symbol" : "MVS.TST"
                }
            ]
        }
    }
    ```

***

* ### `getaddressasset`
    getaddressasset
    * Parameters (positional)
    1. `ADDRESS` address
    ```js
    params:[
        "ADDRESS"
    ]
     ```
    * Returns
    `Object` - address assets

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"getaddressasset",
    "params":["tSwYiwb8vRVqLQLqZNP5UVVqns5Ysgxpfo"],"id":38}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 38, 
        "result" : 
        {
            "assets" : 
            [
                {
                    "address" : "tSwYiwb8vRVqLQLqZNP5UVVqns5Ysgxpfo",
                    "decimal_number" : 0,
                    "quantity" : 10000,
                    "status" : "unspent",
                    "symbol" : "RMB"
                }
            ]
        }
    }
    ```

***

* ### `getasset`
    getasset by symbol
    * Parameters (positional)
    1. `SYMBOL` Asset symbol.
    ```js
    params:[
        "SYMBOL"
    ]
     ```
    * Returns
    `Object` - assets with specified symbol

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"getasset",
    "params":["ZGC"],"id":39}'

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
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 10 etp
    * Parameters (positional)
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
    * Returns
    `Object` - transaction

    * Example
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"issue",
        "params":[
            "test",
            "123456",
            "MVS.TST"
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
                "hash" : "ff59128f6c62eea21762492621d6ea4f75d8491f1ef5486c3375c365b04be658",
                "inputs" : 
                [
                    {
                        "address" : "tRL8yxhSd3AAxpRcbxmEasv89VZ7ZJgh3y",
                        "previous_output" : 
                        {
                            "hash" : "58b90268f383e271f5c5bd50b78fc51fc7be0c714cd9a1c29e325fb5aefa0b8c",
                            "index" : 1
                        },
                        "script" : "[ 3045022100fc9854ba2373c34989ff47fac2f88a4d96b6323618cee5501cc2a3d1590cfc58022051045d567267f358918a247516bb2e012a16e7f64b4cc2d83290fb94610a6f8401 ] [ 03b122b19d00981a2181ebabe58f1aae7d9ee245bf87a551e56ca5aea7f9b0ddfd ]",
                        "sequence" : 4294967295
                    },
                    {
                        "address" : "tRL8yxhSd3AAxpRcbxmEasv89VZ7ZJgh3y",
                        "previous_output" : 
                        {
                            "hash" : "58b90268f383e271f5c5bd50b78fc51fc7be0c714cd9a1c29e325fb5aefa0b8c",
                            "index" : 0
                        },
                        "script" : "[ 3044022024bb7a11329d005aa22cdda2ac5d8c03524edc43cc1b408d398be5f544be0c3202206ac2e9a9366cba4ada83b23e12de0dc361f20a9ce666d4a96ee24306a04b964901 ] [ 03b122b19d00981a2181ebabe58f1aae7d9ee245bf87a551e56ca5aea7f9b0ddfd ] [ 0a ]",
                        "sequence" : 4294967295
                    },
                    {
                        "address" : "tKc8dxEEj9cWr4Ys2oUbgQxGtRgUEg9e5q",
                        "previous_output" : 
                        {
                            "hash" : "c383686f3d281d41c336a4271ac93ecc3689441190e2d6b31ec71a60372a65d1",
                            "index" : 1
                        },
                        "script" : "[ 304402205dda658acad5490cb3441a0b08b556916993cf5f76e32648826e6bc7fe4d807d02202d932ef64cbe8a46219a560670f651b62e5505a04da9433cbdc9ff720fcd269801 ] [ 03d0340a186b0022569d304c992e7b315fa1f2f2bcdeacc4d4f598ff0e15ad49b8 ]",
                        "sequence" : 4294967295
                    }
                ],
                "lock_time" : "0",
                "outputs" : 
                [
                    {
                        "address" : "tRL8yxhSd3AAxpRcbxmEasv89VZ7ZJgh3y",
                        "attachment" : 
                        {
                            "address" : "tRL8yxhSd3AAxpRcbxmEasv89VZ7ZJgh3y",
                            "decimal_number" : 8,
                            "description" : "test asset",
                            "issuer" : "test",
                            "quantity" : 10000000,
                            "symbol" : "MVS.TST",
                            "type" : "asset-issue"
                        },
                        "index" : 0,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ c9e5a7523f9f51858ad923995de69be769a2ed7d ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "tRL8yxhSd3AAxpRcbxmEasv89VZ7ZJgh3y",
                        "attachment" : 
                        {
                            "type" : "etp"
                        },
                        "index" : 1,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ c9e5a7523f9f51858ad923995de69be769a2ed7d ] equalverify checksig",
                        "value" : 1000606696
                    }
                ],
                "version" : "2"
            }
        }
    }
    ```
***

* ### `issuefrom`
    issuefrom, should specify `from address` to give fee of tx
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 10 etp
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `ADDRESS` from address
    4. `SYMBOL` issued asset symbol
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
    curl -X POST --data '{"jsonrpc":"2.0","method":"issuefrom",
    "params":["test10", "123456", "tCrRWkDBZQTqp3AdZc39DSMJ8FremrTinj", "MVS.TST2"],"id":7}'

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "transaction" : 
            {
                "hash" : "4219f08b24b90e18418f36ba2bb7339bbfc184ae7b09c1e2ca195c7518c78720",
                "inputs" : 
                [
                    {
                        "address" : "tCrRWkDBZQTqp3AdZc39DSMJ8FremrTinj",
                        "previous_output" : 
                        {
                            "hash" : "384843e993d2ae63bf63e2cc840a32299b31598557946dad9c1f6401501fb56",
                            "index" : 0
                        },
                        "script" : "[ 304402204bbd0368e3289e5d8333d80db7d1523faea01ad644c7c0ef69a7a1f6c8c07ac9022070312ed6fd866e34e1bac6201c0b41a18b3d580246bea7ead1eabfb784993de401 ] [ 03046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e ]",
                        "sequence" : 4294967295
                    },
                    {
                        "address" : "tCrRWkDBZQTqp3AdZc39DSMJ8FremrTinj",
                        "previous_output" : 
                        {
                            "hash" : "f48a6f6d43da5f6002bf6faef7ae367dfe25510214c8a56b71447fef24ab9b3d",
                            "index" : 0
                        },
                        "script" : "[ 3044022044e32d459c2fe9e7408a82297f3601fd582433b9f4b1f431558706edf14a19bb02201803234d297d253d1270e5f439ded116ace21783d0c4b31654e87be04130fce501 ] [ 03046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e ]",
                        "sequence" : 4294967295
                    }
                ],
                "lock_time" : "0",
                "outputs" : 
                [
                    {
                        "address" : "tCrRWkDBZQTqp3AdZc39DSMJ8FremrTinj",
                        "attachment" : 
                        {
                            "address" : "tCrRWkDBZQTqp3AdZc39DSMJ8FremrTinj",
                            "decimal_number" : 0,
                            "description" : "",
                            "issuer" : "test10",
                            "quantity" : 10000,
                            "symbol" : "MVS.TST2",
                            "type" : "asset-issue"
                        },
                        "index" : 0,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 41064be4875b7a3608a891173540e534d4b89b6f ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "tCrRWkDBZQTqp3AdZc39DSMJ8FremrTinj",
                        "attachment" : 
                        {
                            "type" : "etp"
                        },
                        "index" : 1,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 41064be4875b7a3608a891173540e534d4b89b6f ] equalverify checksig",
                        "value" : 200000000
                    }
                ],
                "version" : "2"
            }
        }
    }
    ```
***

* ### `listassets`
    list assets details.
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
    `Object` - assets

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"listassets",
    "params":["test", "123456"],"id":42}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 42, 
        "result":
         {
            "assets" :
             [
                    {
                        "quantity" : 10000,
                        "status" : "unspent",
                        "symbol" : "MVS.TST2"
                    },
                    {
                        "decimal_number" : 0,
                        "quantity" : 10000,
                        "status" : "unspent",
                        "symbol" : "MVS.TST"
                    }
            ]
        }
    }
    ```
***

* ### `sendasset`
    sendasset
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    * Parameters (positional)
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
    * Returns
    `Object` - 

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"sendasset",
    "params":["test10", "123456", "t7M89JNHrVn3TwNDq2HTGbTMmCXCXQNhqr", "MVS.TST", "100"],"id":7}'

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "transaction" : 
            {
                "hash" : "2ec00c7a534dc7b72e8441d856c1f0070d73d0d90db04f8138e64d9a6d23b89e",
                "inputs" : 
                [
                    {
                        "address" : "tCrRWkDBZQTqp3AdZc39DSMJ8FremrTinj",
                        "previous_output" : 
                        {
                            "hash" : "9466607420578d34c33234d2d367c400e7fe37e98fb3f1f43542d300d8288bde",
                            "index" : 0
                        },
                        "script" : "[ 304402201ab761c2bc368c8d401b375baea8ef39591aaa682c341d06bda752fdefe5e45402204708c91ebf4170f831d70a98916866801968d7c9709d67ca11fba6ae165af7fc01 ] [ 03046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e ]",
                        "sequence" : 4294967295
                    },
                    {
                        "address" : "tSwYiwb8vRVqLQLqZNP5UVVqns5Ysgxpfo",
                        "previous_output" : 
                        {
                            "hash" : "1305724ae8ac32382a0730a8c5f2a85abc0d8ffa9a6bdd6eba6ae4c19459e16b",
                            "index" : 0
                        },
                        "script" : "[ 3044022047b0d3da54e128b8ccfcc2780e5dfefb0114c22dfd2032a6069c5521e3343bc702207f2ad6d1fbc6974d2c6a8cf1b9763a30469a4afdc02bbf99700136513ce107a601 ] [ 02c5d70394b6943c6d48ca396bc3a2389753b8f0de18099a0b37bef3e0e84c09c4 ]",
                        "sequence" : 4294967295
                    }
                ],
                "lock_time" : "0",
                "outputs" : 
                [
                    {
                        "address" : "t7M89JNHrVn3TwNDq2HTGbTMmCXCXQNhqr",
                        "attachment" : 
                        {
                            "quantity" : 100,
                            "symbol" : "MVS.TST",
                            "type" : "asset-transfer"
                        },
                        "index" : 0,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 04a31ae84a152ca773728761b7260726d8aeff8c ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "tCrRWkDBZQTqp3AdZc39DSMJ8FremrTinj",
                        "attachment" : 
                        {
                            "type" : "etp"
                        },
                        "index" : 1,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 41064be4875b7a3608a891173540e534d4b89b6f ] equalverify checksig",
                        "value" : 299990000
                    },
                    {
                        "address" : "tCrRWkDBZQTqp3AdZc39DSMJ8FremrTinj",
                        "attachment" : 
                        {
                            "quantity" : 9900,
                            "symbol" : "MVS.TST",
                            "type" : "asset-transfer"
                        },
                        "index" : 2,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 41064be4875b7a3608a891173540e534d4b89b6f ] equalverify checksig",
                        "value" : 0
                    }
                ],
                "version" : "2"
            }
        }
    }
    ```
***

* ### `sendassetfrom`
    sendassetfrom, should specify `from address`
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    * Parameters (positional)
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
    * Returns
    `Object` - 

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"sendassetfrom",
    "params":["test10", "123456", "tCrRWkDBZQTqp3AdZc39DSMJ8FremrTinj", "t7M89JNHrVn3TwNDq2HTGbTMmCXCXQNhqr", "MVS.TST", "100"],"id":7}'

    // Response
    {
        "transaction" : 
        {
            "hash" : "bddbf4f8cfa3a916ae4bc66bbbfb0d2f84c8b676558c496e7844dfb7430c29e4",
            "inputs" : 
            [
                {
                    "address" : "tCrRWkDBZQTqp3AdZc39DSMJ8FremrTinj",
                    "previous_output" : 
                    {
                        "hash" : "76b755cde40cda540a87036a48ad388a752ce45d89ed5424f6bb4e246cffd5ea",
                        "index" : 0
                    },
                    "script" : "[ 3045022100a82486f9a1719009eab51062cfca0f6f85635ad53a1d63994ac6a130a474b1780220266410c6d271207951be14bedc19a285c56d046b5825e74745f238a243ba069001 ] [ 03046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e ]",
                    "sequence" : 4294967295
                },
                {
                    "address" : "tCrRWkDBZQTqp3AdZc39DSMJ8FremrTinj",
                    "previous_output" : 
                    {
                        "hash" : "2ec00c7a534dc7b72e8441d856c1f0070d73d0d90db04f8138e64d9a6d23b89e",
                        "index" : 2
                    },
                    "script" : "[ 3045022100b8e5d9f35bf657f9c167d058917b2f1bca2635d9415f23def5e8c07960e82dcd02202bf0d1a81f6b0e70306c10fd7f616733705cc250e1368f521a33d5e65b678ea201 ] [ 03046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e ]",
                    "sequence" : 4294967295
                }
            ],
            "lock_time" : "0",
            "outputs" : 
            [
                {
                    "address" : "t7M89JNHrVn3TwNDq2HTGbTMmCXCXQNhqr",
                    "attachment" : 
                    {
                        "quantity" : 100,
                        "symbol" : "MVS.TST",
                        "type" : "asset-transfer"
                    },
                    "index" : 0,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 04a31ae84a152ca773728761b7260726d8aeff8c ] equalverify checksig",
                    "value" : 0
                },
                {
                    "address" : "tCrRWkDBZQTqp3AdZc39DSMJ8FremrTinj",
                    "attachment" : 
                    {
                        "type" : "etp"
                    },
                    "index" : 1,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 41064be4875b7a3608a891173540e534d4b89b6f ] equalverify checksig",
                    "value" : 299990000
                },
                {
                    "address" : "tCrRWkDBZQTqp3AdZc39DSMJ8FremrTinj",
                    "attachment" : 
                    {
                        "quantity" : 9800,
                        "symbol" : "MVS.TST",
                        "type" : "asset-transfer"
                    },
                    "index" : 2,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 41064be4875b7a3608a891173540e534d4b89b6f ] equalverify checksig",
                    "value" : 0
                }
            ],
            "version" : "2"
        }
    }
    ```
***

SuperNova Functions :

* ### `secondaryissue`
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    4. `ADDRESS` target address
    5. `SYMBOL` asset symbol
    6. `VOLUME` The asset amount shares
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "ADDRESS", 
        "SYMBOL", 
        "VOLUME"
    ]
     ```
    * Returns
    `Object` - 

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"secondaryissue",
    "params":["chenhao06", "chenhao06", "tPZov98rEnfQYWEaLiFiCr8Zqzbjapwty3", "TEST.SECONDARYISSUE", "100"],"id":7}'

    // Response
	{
		"transaction" :
		{
			"hash" : "c5a9fcbac56a4c495bc208a448501dae70489fac74e743eaf092a18d5878fa68",
			"inputs" :
			[
				{
					"address" : "tPZov98rEnfQYWEaLiFiCr8Zqzbjapwty3",
					"previous_output" :
					{
						"hash" : "91ac0fbde21a4fc51fae823d8f5ecd85709c7a5919781f6c377008c672f79ae7",
						"index" : 1
					},
					"script" : "[ 30440220424a095e24fe909ff977907f3c013306d590676e8d4d5dade1f4cf7270e8d691022051e69e178322d5462b0720942180bcf010bdc9f0e6967f200f3b436848be99ed01 ] [ 033c78797d7d28c3ab53e4f2094c4479e808737c4e5724a8c6320580304f987c67 ]",
					"sequence" : 4294967295
				},
				{
					"address" : "tPZov98rEnfQYWEaLiFiCr8Zqzbjapwty3",
					"previous_output" :
					{
						"hash" : "91ac0fbde21a4fc51fae823d8f5ecd85709c7a5919781f6c377008c672f79ae7",
						"index" : 0
					},
					"script" : "[ 3045022100aa1af0f7a1766fb2331a11cddc9ebb68dc807bf58f152ffe415d4b829ca3e93a02201c544b79de37cc02d850865b6ae344a8b6f6ed07d34ee6026669ed8c68ee565001 ] [ 033c78797d7d28c3ab53e4f2094c4479e808737c4e5724a8c6320580304f987c67 ]",
					"sequence" : 4294967295
				}
			],
			"lock_time" : "0",
			"outputs" :
			[
				{
					"address" : "tPZov98rEnfQYWEaLiFiCr8Zqzbjapwty3",
					"attachment" :
					{
						"address" : "tPZov98rEnfQYWEaLiFiCr8Zqzbjapwty3",
						"decimal_number" : 4,
						"description" : "testnet token",
						"issuer" : "chenhao06",
						"quantity" : 100,
						"secondaryissue_threshold" : 51,
						"symbol" : "TEST.SENDARYISSUE",
						"type" : "asset-issue"
					},
					"index" : 0,
					"locked_height_range" : 0,
					"script" : "dup hash160 [ b68b4f63bc9d98d061ca49bd6c2f47c256466af6 ] equalverify checksig",
					"value" : 0
				},
				{
					"address" : "tPZov98rEnfQYWEaLiFiCr8Zqzbjapwty3",
					"attachment" :
					{
						"type" : "etp"
					},
					"index" : 1,
					"locked_height_range" : 0,
					"script" : "dup hash160 [ b68b4f63bc9d98d061ca49bd6c2f47c256466af6 ] equalverify checksig",
					"value" : 8999990000
				},
				{
					"address" : "tPZov98rEnfQYWEaLiFiCr8Zqzbjapwty3",
					"attachment" :
					{
						"quantity" : 100,
						"symbol" : "TEST.SENDARYISSUE",
						"type" : "asset-transfer"
					},
					"index" : 2,
					"locked_height_range" : 0,
					"script" : "dup hash160 [ b68b4f63bc9d98d061ca49bd6c2f47c256466af6 ] equalverify checksig",
					"value" : 0
				}
			],
			"version" : "3"
		}
	}
    ```
***

