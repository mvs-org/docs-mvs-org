title: MIT
comments: false
---

## Description
***

## API Methods
***

* ### `registermit`
    registermit
    * Parameters (optional)
    1. `-h` or `[--help]` Get a description and instructions for this command.
    2. `-c` or `[--content]` The content of MIT, default is empty.
    3. `-m` or `[--mits]` List of symbol and content pair. Symbol and content are separated by a ':'.
    4. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp.
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `TODID`  Target DID.
    4. `SYMBOL` Identifier of MIT, optional, default is empty.
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

    * Example for single registry
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
                "hash" : "b7afabb163c0a671ff37d194fea6b3580f0e5e4e1cb16894bd4eb6c3fc3a745d",
                "inputs" : 
                [
                    {
                        "address" : "MTkdaNMWvpXDyBGTdmHovvnUosHfSW3B4V",
                        "previous_output" : 
                        {
                            "hash" : "f84990d724931639cf0ad4533053ec6d9777692af49d61395f335c13836f021d",
                            "index" : 1
                        },
                        "script" : "[ 304402204992131b1a5f0f0f4b68715ae9ee3af5c3c089d5d948444a9bd12a2cd0348d1302201496a25c2c572185bc05d20c337569299cf0b74742502806c47e064485aca0ce01 ] [ 0364aa7630296855d0f8bd6bd6fb36d06910c38d69daf7517d59b37d0c35cc0a8c ]",
                        "sequence" : 4294967295
                    }
                ],
                "lock_time" : "0",
                "outputs" : 
                [
                    {
                        "address" : "MTkdaNMWvpXDyBGTdmHovvnUosHfSW3B4V",
                        "attachment" : 
                        {
                            "address" : "MTkdaNMWvpXDyBGTdmHovvnUosHfSW3B4V",
                            "content" : "test MIT",
                            "from_did" : "test",
                            "status" : "registered",
                            "symbol" : "mit@test",
                            "to_did" : "test",
                            "type" : "mit"
                        },
                        "index" : 0,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ d9c598f28e989df623e613be9ead3bc8dfaee3f5 ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MTkdaNMWvpXDyBGTdmHovvnUosHfSW3B4V",
                        "attachment" : 
                        {
                            "type" : "etp"
                        },
                        "index" : 1,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ d9c598f28e989df623e613be9ead3bc8dfaee3f5 ] equalverify checksig",
                        "value" : 199990000
                    }
                ],
                "version" : "4"
            }
        }
    }
    ```
    * Example for batch registry
    ```js
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"registermit",
        "params":[
            "test",
            "123456",
            "test",
            {
                "content": "unified content of batch registerring mit.",
                "mits" :
                [
                    "BATCH_01@MIT",
                    "BATCH_02@MIT",
                    "BATCH_03@MIT:customized content."
                ]
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
                "hash" : "67c520b7f0b514986c645f35bf116607e6de4cddb3051d38a1ead1228a5009cf",
                "inputs" :
                [
                    {
                        "address" : "MTkdaNMWvpXDyBGTdmHovvnUosHfSW3B4V",
                        "previous_output" :
                        {
                            "hash" : "94018aff4d4c9c5732486d3108b85e15e59982b65d0ac8964582ed3a2ddfb7ac",
                            "index" : 2
                        },
                        "script" : "[ 304402201fd9b8068df744a02b6e4995c86827e24a126781b81a2598e93401fe3349ab9d02200cf4d3f4b262ca37b6aefef9b8ea9c1759f27cf44cc573688d579b06d7143cd701 ] [ 0351404c07aba6fe1fc78e4bc1a97a9b6f293b0909f1f4ea4eb0ef1b5bca4bf4af ]",
                        "sequence" : 4294967295
                    }
                ],
                "lock_time" : "0",
                "outputs" :
                [
                    {
                        "address" : "MTkdaNMWvpXDyBGTdmHovvnUosHfSW3B4V",
                        "attachment" :
                        {
                            "address" : "MTkdaNMWvpXDyBGTdmHovvnUosHfSW3B4V",
                            "content" : "unified content of batch registerring mit.",
                            "from_did" : "test",
                            "status" : "registered",
                            "symbol" : "BATCH_01@MIT",
                            "to_did" : "test",
                            "type" : "mit"
                        },
                        "index" : 0,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ b5eb75b67ccc47363ea623a3c73b2d23c9dd801a ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MTkdaNMWvpXDyBGTdmHovvnUosHfSW3B4V",
                        "attachment" :
                        {
                            "address" : "MTkdaNMWvpXDyBGTdmHovvnUosHfSW3B4V",
                            "content" : "unified content of batch registerring mit.",
                            "from_did" : "test",
                            "status" : "registered",
                            "symbol" : "BATCH_02@MIT",
                            "to_did" : "test",
                            "type" : "mit"
                        },
                        "index" : 1,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ b5eb75b67ccc47363ea623a3c73b2d23c9dd801a ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MTkdaNMWvpXDyBGTdmHovvnUosHfSW3B4V",
                        "attachment" :
                        {
                            "address" : "MTkdaNMWvpXDyBGTdmHovvnUosHfSW3B4V",
                            "content" : "customized content.",
                            "from_did" : "test",
                            "status" : "registered",
                            "symbol" : "BATCH_03@MIT",
                            "to_did" : "test",
                            "type" : "mit"
                        },
                        "index" : 2,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ b5eb75b67ccc47363ea623a3c73b2d23c9dd801a ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MTkdaNMWvpXDyBGTdmHovvnUosHfSW3B4V",
                        "attachment" :
                        {
                            "type" : "etp"
                        },
                        "index" : 3,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ b5eb75b67ccc47363ea623a3c73b2d23c9dd801a ] equalverify checksig",
                        "value" : 199980000
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
                "hash" : "d20d5835404557a2a6f4071969acab98c235ff4af0fe01c8c7eff850b0c2ee76",
                "inputs" : 
                [
                    {
                        "address" : "MTkdaNMWvpXDyBGTdmHovvnUosHfSW3B4V",
                        "previous_output" : 
                        {
                            "hash" : "b7afabb163c0a671ff37d194fea6b3580f0e5e4e1cb16894bd4eb6c3fc3a745d",
                            "index" : 1
                        },
                        "script" : "[ 30440220525817e37d8b9530838d071a24b82587421347159622fade31d0f5d973ed168502202f8c244aa2911ae4fd006bde66d9a9880a46acae256a744657127bacd971927f01 ] [ 0364aa7630296855d0f8bd6bd6fb36d06910c38d69daf7517d59b37d0c35cc0a8c ]",
                        "sequence" : 4294967295
                    },
                    {
                        "address" : "MTkdaNMWvpXDyBGTdmHovvnUosHfSW3B4V",
                        "previous_output" : 
                        {
                            "hash" : "b7afabb163c0a671ff37d194fea6b3580f0e5e4e1cb16894bd4eb6c3fc3a745d",
                            "index" : 0
                        },
                        "script" : "[ 30440220037abcd5f44fc46820bdab6d6928a33b092b2253e5d1856546a2fe843909ecf0022024835d7b9c1dd2d41e13dc70463adcc3b98047d1ecc86e491e5d6e7a38d7093201 ] [ 0364aa7630296855d0f8bd6bd6fb36d06910c38d69daf7517d59b37d0c35cc0a8c ]",
                        "sequence" : 4294967295
                    }
                ],
                "lock_time" : "0",
                "outputs" : 
                [
                    {
                        "address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
                        "attachment" : 
                        {
                            "address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
                            "from_did" : "",
                            "status" : "transfered",
                            "symbol" : "mit@test",
                            "to_did" : "Alice",
                            "type" : "mit"
                        },
                        "index" : 0,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 95c9a5e647870bbc535d83a3c394ef40d298aa46 ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MTkdaNMWvpXDyBGTdmHovvnUosHfSW3B4V",
                        "attachment" : 
                        {
                            "type" : "etp"
                        },
                        "index" : 1,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ d9c598f28e989df623e613be9ead3bc8dfaee3f5 ] equalverify checksig",
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
                    "address" : "MTkdaNMWvpXDyBGTdmHovvnUosHfSW3B4V",
                    "content" : "test MIT",
                    "height" : 13383,
                    "status" : "registered",
                    "symbol" : "mit@test",
                    "time_stamp" : 1528181287,
                    "to_did" : "test"
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
                    "address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
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
    2. `-c` or `[--current]` Show current status of MIT, default false.
    3. `-t` or `[--trace]` Tracing history, default false.
    4. `-i` or `[--index]` Page index, default 1.
    5. `-l` or `[--limit]` MIT count per page, default 100.
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
            "address" : "MTkdaNMWvpXDyBGTdmHovvnUosHfSW3B4V",
            "content" : "test MIT",
            "height" : 13383,
            "status" : "registered",
            "symbol" : "mit@test",
            "time_stamp" : 1528181287,
            "to_did" : "test"
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
                    "address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
                    "height" : 13824,
                    "status" : "transfered",
                    "symbol" : "mit@test",
                    "time_stamp" : 1528181361,
                    "to_did" : "Alice"
                },
                {
                    "address" : "MTkdaNMWvpXDyBGTdmHovvnUosHfSW3B4V",
                    "height" : 13383,
                    "status" : "registered",
                    "symbol" : "mit@test",
                    "time_stamp" : 1528181287,
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
                    "address" : "MMZAUmJke7f1FEY67dAHUYfmfh2wWC4vFL",
                    "height" : 13824,
                    "status" : "transfered",
                    "symbol" : "mit@test",
                    "time_stamp" : 1528181361,
                    "to_did" : "Alice"
                }
            ]
        }
    }
    ```
    