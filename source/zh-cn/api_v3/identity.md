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
    1. `-f` or `[--fee]` The fee of tx. Defaults to 1 etp
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `ADDRESS` target address.
    4. `SYMBOL` did symbol, supports alphabets/numbers/(“@”, “.”, “_”, “-“), case-sensitive, maximum length is 64.
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
        "jsonrpc" : "2.0",
        "result" : 
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
    ```
***

* ### `listdids` of blockchain
    list dids details of blockchain.
    * Parameters (optional)
    1. `-i` or `[--index]` Page index. Default is 1. 
    1. `-l` or `[--limit]` DID count per page.Default is 100. 
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
    curl -X POST --data '{"jsonrpc":"2.0","method":"listdids","id":42}'  http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "jsonrpc" : "2.0", 
        "id": 42, 
        "result":
        [
            "current_page" : 1,
            "dids" :
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
            ],
            "total_count" : 3,
            "total_page" : 1
        ]
    }
    ```

***

* ### `listdids` of account
    list dids details of account.
    * Parameters (optional)
    1. `-i` or `[--index]` Page index. Default is 1. 
    1. `-l` or `[--limit]` DID count per page.Default is 100. 
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
    "params":["test", "123456"],"id":42}'  http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "jsonrpc" : "2.0", 
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
    curl -X POST --data '{"jsonrpc":"2.0","method":"didchangeaddress",
    "params":["test", "123456",  "MFzPrUeNstFDTmnLdFYrD6PVtANS2281oP", "GUANG"],"id":7}' http://127.0.0.1:8820/rpc/v3

    // Response
    {        
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" : 
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


* ### `getdid` with no param
    list dids.
    * Parameters (positional)

    ```js
    params:[
    ]
    ```
    * Returns
    `Object` - did symbols

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"getdid","params":[""],"id":42}' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "jsonrpc" : "2.0", 
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

* ### `getdid` with param
    list history addresses of did.
    * Parameters (positional)
    1. `SYMDID/ADDRESS` Did symbol or address  .
    
    ```js
    params:[
        "SYMDID/ADDRESS"
    ]
    ```
    * Returns
    `Object` - dids

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"getdid","params":["MSvm4CPTvzhgktUXu7BKrHuFuUcZd7jqzK"],"id":42}' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 42,
        "jsonrpc" : "2.0",
        "result" : 
        [
            {
                    "address" : "MSvm4CPTvzhgktUXu7BKrHuFuUcZd7jqzK",
                    "status" : "current",
                    "symbol" : "Alice"
            }
        ]
    }
    ```
***
