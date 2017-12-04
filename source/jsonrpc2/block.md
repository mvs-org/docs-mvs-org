title: block
comments: false
---

## Description
***

## API Methods 
***

* ### `getbestblockhash`
    get best blockhash
    ##### Returns
    `String` - best block hash

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"getbestblockhash","params":[],"id":25}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 25, 
        "result": "633b3268ede12736e81d151cc344bff8d26b7ade4d80a69db27c6c581a8e1d01"
    }
    ```
    ***
* ### `getbestblockheader`
    get best blockheader
    ##### Returns
    `Object` - best block header

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"getbestblockheader","params":[],"id":26}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 26, 
        "result": {
            "nonce": "7722496578557022359", 
            "hash": "fa26311f98371f83b737c07cc05d615e0c7b716188c64d24b6df23e17e01d691", 
            "bits": "1", 
            "previous_block_hash": "e1925937802ddd4cf4863ae4a1a33338877dccee1d3a0bbccc6d75b8c240675f", 
            "number": "1", 
            "transaction_count": "0", 
            "version": "1", 
            "mixhash": "47597797143417045886903555345346333109819709284889931755188005936950690907038", 
            "time_stamp": "1509096803", 
            "merkle_tree_hash": "f91fcae5d3223441175735e7adb318004a6e7400eb01b6f3df13fa4b1e3feab9"
        }
    }
    ```
    ***
* ### `getblock`
    Get sepcified block header from wallet.
    ##### Parameters (positional)
    1. `HASH` block hash.
    2. `JSON` use json format or not, default is false
    ```js
    params:[
        "HASH", 
        "JSON"
    ]
     ```
    ##### Returns
    `Object` - block detail

    ##### Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"getblock","params":["2e308fbcd08623f67c2057c19b53e82512388c354729eef86aba923dc9d162e6", "--json", "true"],"id":27}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 27, 
        "result": {
            "header": {
                "result": {
                    "nonce": "1187693506412349803", 
                    "hash": "2e308fbcd08623f67c2057c19b53e82512388c354729eef86aba923dc9d162e6", 
                    "bits": "1", 
                    "number": "2", 
                    "transaction_count": "1", 
                    "mixhash": "102715073292893923628290858396344150009889387711784906893245729235330861356261", 
                    "version": "1", 
                    "previous_block_hash": "9b5c9a2d71b40d61a28729ad290a82d059e303bb2a18ef3c5e4c541c786ea3bf", 
                    "time_stamp": "1509342591", 
                    "merkle_tree_hash": "1b101da51413938f75ccaa5608a9885a3ae2a5fb523caf3ca74bc284302dfc09"
                }
            }, 
            "txs": {
                "transactions": [
                    {
                        "inputs": [
                            {
                                "previous_output": {
                                    "index": "4294967295", 
                                    "hash": "0000000000000000000000000000000000000000000000000000000000000000"
                                }, 
                                "sequence": "0", 
                                "script": "[ 0102 ]"
                            }
                        ], 
                        "lock_time": "0", 
                        "version": "1", 
                        "hash": "1b101da51413938f75ccaa5608a9885a3ae2a5fb523caf3ca74bc284302dfc09", 
                        "outputs": [
                            {
                                "index": "0", 
                                "script": "dup hash160 [ 2759a0422370c52ac7bc57f6b3a082877bf40400 ] equalverify checksig", 
                                "attachment": {
                                    "type": "etp"
                                }, 
                                "value": "300000000", 
                                "address": "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV"
                            }
                        ]
                    }
                ]
            }
        }
    }
    ```
