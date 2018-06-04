title: MIT
comments: false
---

## Description
***

## API Methods
***

* ### `registermit`
    createasset
    * Parameters (optional)
    1. `-h` or `[--help]` Get a description and instructions for this command.
    2. `-c` or `[--content]` The content of MIT, default is empty.
    3. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp.
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `TODID`  Target DID.
    4. `SYMBOL` Identifier of MIT.
    ```js
    params:[
        "ACCOUNTNAME",
        "ACCOUNTAUTH",
        "TODID",
        "SYMBOL",
    ]
     ```
    * Returns
    `Object` - 

    * Example
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"registermit",
        "params":[
            "test",
            "123456",
            "test",
            "mit@test",
            {
                "content": "test MIT"
            }
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
                "hash" : "715d4b774e87f7578ae37753fda93ee8b52b69a45271887f7b57a3841a7d0322",
                "inputs" : 
                [
                    {
                        "address" : "MP3ysdsU5MmgKC4HKfYGNsEmmYvBy6VCGU",
                        "previous_output" : 
                        {
                            "hash" : "a022ff3e6396e46675f80a5c02db34938f11f683f94efe8f958e0d704e8d08f1",
                            "index" : 1
                        },
                        "script" : "[ 30450221009522a0881239c0d0a0a94b28cc46a0e7c647c703b187cd636175aa6c54a797c30220513bc75a537aab9650acc527bfa04cc012e0cd16aba2d060d2031fa217dd503001 ] [ 032adeedfb355887d6736b7e288d8bb00c2400428b81e2ae73f71d6da9009ac82a ]",
                        "sequence" : 4294967295
                    }
                ],
                "lock_time" : "0",
                "outputs" : 
                [
                    {
                        "address" : "MP3ysdsU5MmgKC4HKfYGNsEmmYvBy6VCGU",
                        "attachment" : 
                        {
                            "address" : "MP3ysdsU5MmgKC4HKfYGNsEmmYvBy6VCGU",
                            "content" : "test MIT",
                            "from_did" : "test",
                            "status" : "registered",
                            "symbol" : "mit@test",
                            "to_did" : "test",
                            "type" : "mit"
                        },
                        "index" : 0,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ a634fbcac2d24a9b47b5a5c36070ead458ea2591 ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MP3ysdsU5MmgKC4HKfYGNsEmmYvBy6VCGU",
                        "attachment" : 
                        {
                            "type" : "etp"
                        },
                        "index" : 1,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ a634fbcac2d24a9b47b5a5c36070ead458ea2591 ] equalverify checksig",
                        "value" : 199990000
                    }
                ],
                "version" : "4"
            }
        }
    }
    ```

***

* ### `transfermit`
    transfermit
    * Parameters (optional)
    1. `-h` or `[--help]` Get a description and instructions for this command.
    2. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp.
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `TODID`  Target DID.
    4. `SYMBOL` Identifier of MIT.
    ```js
    params:[
        "ACCOUNTNAME",
        "ACCOUNTAUTH",
        "TODID",
        "SYMBOL",
    ]
     ```
    * Returns
    `Object` - 

    * Example
    ```js
    // Request
    curl -X POST -d '{
        "id":26,
        "jsonrpc":"2.0",
        "method":"transfermit",
        "params":[
            "test",
            "123456",
            "Alice",
            "mit@test"
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 26,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "transaction" : 
            {
                "hash" : "ad33313d6782e8d441d0fbfe963a2b2fed98d81a1d102a4bfdac9524b8cb93f9",
                "inputs" : 
                [
                    {
                        "address" : "MP3ysdsU5MmgKC4HKfYGNsEmmYvBy6VCGU",
                        "previous_output" : 
                        {
                            "hash" : "715d4b774e87f7578ae37753fda93ee8b52b69a45271887f7b57a3841a7d0322",
                            "index" : 1
                        },
                        "script" : "[ 3045022100b54829d80ce44f5b23a9626850dd9862ff0cc7b05cf67aef3ee6b1896c22fc3f02200c607f7918928c525955d70f38bca70079bd41d381c2df520d85ffe83c56635c01 ] [ 032adeedfb355887d6736b7e288d8bb00c2400428b81e2ae73f71d6da9009ac82a ]",
                        "sequence" : 4294967295
                    },
                    {
                        "address" : "MP3ysdsU5MmgKC4HKfYGNsEmmYvBy6VCGU",
                        "previous_output" : 
                        {
                            "hash" : "715d4b774e87f7578ae37753fda93ee8b52b69a45271887f7b57a3841a7d0322",
                            "index" : 0
                        },
                        "script" : "[ 3045022100ac8777d1089ef231389adf23588d9ee493db47557c18d117ca4293bf77e7f493022036bc1af1fac56fa719186514d647488fdbe9e09c29004afc89d24c9cbe2b4e2e01 ] [ 032adeedfb355887d6736b7e288d8bb00c2400428b81e2ae73f71d6da9009ac82a ]",
                        "sequence" : 4294967295
                    }
                ],
                "lock_time" : "0",
                "outputs" : 
                [
                    {
                        "address" : "MUipcgtbBZVCn1n45SaCfK62YBrvkjWe7J",
                        "attachment" : 
                        {
                            "address" : "MUipcgtbBZVCn1n45SaCfK62YBrvkjWe7J",
                            "from_did" : "test",
                            "status" : "transfered",
                            "symbol" : "mit@test",
                            "to_did" : "Alice",
                            "type" : "mit"
                        },
                        "index" : 0,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ e4661b6687395fda26767695c7217fd5b2c4707f ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MP3ysdsU5MmgKC4HKfYGNsEmmYvBy6VCGU",
                        "attachment" : 
                        {
                            "type" : "etp"
                        },
                        "index" : 1,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ a634fbcac2d24a9b47b5a5c36070ead458ea2591 ] equalverify checksig",
                        "value" : 199980000
                    }
                ],
                "version" : "4"
            }
        }
    }
    ```

***

* ### `listmits`
    listmits
    * Parameters (optional)
    1. `-h` or `[--help]` Get a description and instructions for this command.
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

    * Example one
    ```js
    // Request
    curl -X POST -d '{
        "id":26,
        "jsonrpc":"2.0",
        "method":"listmits"
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 26,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "mits" : 
            [
                {
                    "address" : "MUipcgtbBZVCn1n45SaCfK62YBrvkjWe7J",
                    "content" : "Alice's MIT",
                    "status" : "registered",
                    "symbol" : "Alice@MIT"
                },
                {
                    "address" : "MP3ysdsU5MmgKC4HKfYGNsEmmYvBy6VCGU",
                    "content" : "test MIT",
                    "status" : "registered",
                    "symbol" : "mit@test"
                }
            ]
        }
    }
    ```

    * Example two
    ```js
    // Request
    curl -X POST -d '{
        "id":26,
        "jsonrpc":"2.0",
        "method":"listmits",
        "params":[
            "Alice",
            "passwd1"
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 26,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "mits" : 
            [
                {
                    "address" : "MUipcgtbBZVCn1n45SaCfK62YBrvkjWe7J",
                    "content" : "test MIT",
                    "status" : "transfered",
                    "symbol" : "mit@test"
                }
            ]
        }
    }
    ```

***

* ### `getmit`
    getmit
    * Parameters (optional)
    1. `-h` or `[--help]` Get a description and instructions for this command.
    2. `-t` or `[--trace]` Tracing history.
    3. `-i` or `[--index]` Page index.
    4. `-l` or `[--limit]` MIT count per page.
    * Parameters (positional)
    1. `SYMBOL` MIT identifier.
    ```js
    params:[
        "SYMBOL"
    ]
     ```
    * Returns
    `Object` - 

    * Example one
    ```js
    // Request
    curl -X POST -d '{
        "id":26,
        "jsonrpc":"2.0",
        "method":"getmit"
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 26,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "mits" : 
            [
                "Alice@MIT",
                "mit@test"
            ]
        }
    }
    ```

    * Example two
    ```js
    // Request
    curl -X POST -d '{
        "id":26,
        "jsonrpc":"2.0",
        "method":"getmit",
        "params":[
            "mit@test"
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 26,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "address" : "MP3ysdsU5MmgKC4HKfYGNsEmmYvBy6VCGU",
            "content" : "test MIT",
            "status" : "registered",
            "symbol" : "mit@test"
        }
    }
    ```

    * Example three
    ```js
    // Request
    curl -X POST -d '{
        "id":26,
        "jsonrpc":"2.0",
        "method":"getmit",
        "params":[
            "mit@test",
            "--trace"
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 26,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "mits" : 
            [
                {
                    "address" : "MUipcgtbBZVCn1n45SaCfK62YBrvkjWe7J",
                    "from_did" : "test",
                    "height" : 12581,
                    "status" : "transfered",
                    "symbol" : "mit@test",
                    "time_stamp" : 1528101995,
                    "to_did" : "Alice"
                },
                {
                    "address" : "MP3ysdsU5MmgKC4HKfYGNsEmmYvBy6VCGU",
                    "from_did" : "test",
                    "height" : 12109,
                    "status" : "registered",
                    "symbol" : "mit@test",
                    "time_stamp" : 1528101796,
                    "to_did" : "test"
                }
            ]
        }
    }
    ```

    * Example four
    ```js
    // Request
    curl -X POST -d '{
        "id":26,
        "jsonrpc":"2.0",
        "method":"getmit",
        "params":[
            "mit@test",
            "--trace",
            {
                "limit": 1,
                "index": 1
            }
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 26,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "mits" : 
            [
                {
                    "address" : "MUipcgtbBZVCn1n45SaCfK62YBrvkjWe7J",
                    "from_did" : "test",
                    "height" : 12581,
                    "status" : "transfered",
                    "symbol" : "mit@test",
                    "time_stamp" : 1528101995,
                    "to_did" : "Alice"
                }
            ]
        }
    }
    ```