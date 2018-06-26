title: block
comments: false
---

## Description
***

## API Methods 
***

* ### `getblockheader`
    get best blockheader
    alias as **fetch-header/getbestblockhash/getbestblockheader**
    * Parameters (optional)
    1.  `-s [--hash]`          The Base16 block hash.
    2.  `-t [--height]`        The block height.
    * Returns
    `Object` - best block header

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"3.0","method":"getblockheader",
    "params":[],"id":26}'

    // Response
    {
        "jsonrpc": "3.0", 
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
    * Parameters (optional)
    1. `json`    use json format or not, default is true, that is '--json=true'
    2. `tx_json` use json format or not for txs, default is true, that is '--tx_json=true'
    * Parameters (positional)
    1. `HASH_OR_HEIGH`    block hash or block height.
    ```js
    params:[
        "HASH_OR_HEIGH"
    ]
     ```
    * Returns
    `Object` -
    1. `header` - block header
    2. `transactions` - transactions

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"3.0","method":"getblock",
        "params":[0],"id":27}'

    // Response
	{
	    "id" : 27,
	    "jsonrpc" : "3.0",
	    "result" :
	    {
            "bits" : "1",
            "hash" : "b81848ef9ae86e84c3da26564bc6ab3a79efc628239d11471ab5cd25c0684c2d",
            "merkle_tree_hash" : "2a845dfa63a7c20d40dbc4b15c3e970ef36332b367500fd89307053cb4c1a2c1",
            "mixhash" : "0",
            "nonce" : "0",
            "number" : 0,
            "previous_block_hash" : "0000000000000000000000000000000000000000000000000000000000000000",
            "time_stamp" : 1486796400,
            "transaction_count" : 1,
            "version" : 1
            "transactions" :
            [
                {
                    "hash" : "2a845dfa63a7c20d40dbc4b15c3e970ef36332b367500fd89307053cb4c1a2c1",
                    "inputs" :
                    [
                        {
                            "previous_output" :
                            {
                                "hash" : "0000000000000000000000000000000000000000000000000000000000000000",
                                "index" : 4294967295
                            },
                            "script" : "[ 36653634633230393862383462303461306439663631613630643562633866356638306633376531396633616439633339626665343139646234323262333363 ]",
                            "sequence" : 0
                        }
                    ],
                    "lock_time" : "0",
                    "outputs" :
                    [
                        {
                            "address" : "MGqHvbaH9wzdr6oUDFz4S1HptjoKQcjRve",
                            "attachment" :
                            {
                                "type" : "etp"
                            },
                            "index" : 0,
                            "locked_height_range" : 0,
                            "script" : "dup hash160 [ 61fde3bd4e6955c99b16de2d71e2a369888a1c0b ] equalverify checksig",
                            "value" : 5000000000000000
                        }
                    ],
                    "version" : "0"
                }
            ]
	    }
	}
    ```
