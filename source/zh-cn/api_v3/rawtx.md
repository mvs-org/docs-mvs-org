title: rawtx
comments: false
---

## Description
***

## API Methods
***

* ### `createrawtx`
    createrawtx
    * Parameters (positional)
    1. `-f` or `[--fee]`           Transaction fee. defaults to 10000 ETP bits
    2. `-i` or `[--message]`       Message/Information attached to this transaction
    3. `-m` or `[--mychange]`      Mychange to this did/address, includes etp and asset change
    4. `-n` or `[--symbol]`        asset name, do not specify this option for etp tx
    5. `-r` or `[--receivers]`     Send to [did/address:amount]. amount is asset number if symbol option is specified
    6. `-s` or `[--senders]`       Send from did/addresses
    7. `-t` or `[--type]`          Transaction type. 0 -- transfer etp, 3 -- transfer asset
    8. `-u` or `[--utxos]`         Use the specific UTXO as input. Format: "tx-hash:output-index"
    9. `-x` or `[--locktime]`      Locktime. defaults to 0

    * Returns
    `Object` -
    1. `rawtx` - The Base16 transaction.
    * Example
    ```js
    // Request
    curl http://127.0.0.1:8820/rpc/v3 -X POST --data '{"jsonrpc":"2.0","method":"createrawtx",
    "params":[{"type":"3", "senders":"tCrRWkDBZQTqp3AdZc39DSMJ8FremrTinj", "receivers":"t7M89JNHrVn3TwNDq2HTGbTMmCXCXQNhqr:100", "symbol":"RMB"}],"id":7}'

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" : "02000000011b1cb3fc24c24e13a71e11f26fd3bc8c69ff15e1269783e09b276a23b6bf1e180000000000ffffffff0264000000000000001976a91404a31ae84a152ca773728761b7260726d8aeff8c88ac01000000000000008c7be111000000001976a91441064be4875b7a3608a891173540e534d4b89b6f88ac010000000000000000000000"
    }
    ```

***

* ### `signrawtx`
    signrawtx
    * Parameters (positional)
    1. `-w` or `[--wif]`       The wif(s) or private key(s) to sign.
    * Parameters (positional)
    1. `ACCOUNTNAME`  Account name required, any word if wif is specified.
    2. `ACCOUNTAUTH`  Account password(authorization) required, any word if wif is specified.
    3. `TRANSACTION`  The input Base16 transaction to sign.
    ```js
    params: [
        "ACCOUNTNAME",
        "ACCOUNTAUTH",
        "TRANSACTION"
    ]
    ```
    * Returns
    `Object` -
    1. `hash` - transaction hash
    2. `rawtx` - The Base16 transaction.
    * Example
    ```js
    // Request
    curl http://127.0.0.1:8820/rpc/v3  -X POST --data '{"jsonrpc":"2.0","method":"signrawtx",
    "params":["test10", "123456", "02000000011b1cb3fc24c24e13a71e11f26fd3bc8c69ff15e1269783e09b276a23b6bf1e180000000000ffffffff0264000000000000001976a91404a31ae84a152ca773728761b7260726d8aeff8c88ac01000000000000008c7be111000000001976a91441064be4875b7a3608a891173540e534d4b89b6f88ac010000000000000000000000"],"id":7}'

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" :
        {
            "hash" : "cb1906fee17d72a4bc71cfdb5b0e0f66d7a5067fd941e74cd703367d384821ff",
            "rawtx" : "02000000011b1cb3fc24c24e13a71e11f26fd3bc8c69ff15e1269783e09b276a23b6bf1e18000000006b483045022100a59159cc8d3018899815e3189893c81b741166a7ee6e69cd5b04f989afe498e50220364a7b0a6ec0a0276e2019f372003b1fb88cb087791c368bb29bdff514ebb0ca012103046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355effffffff0264000000000000001976a91404a31ae84a152ca773728761b7260726d8aeff8c88ac01000000000000008c7be111000000001976a91441064be4875b7a3608a891173540e534d4b89b6f88ac010000000000000000000000"
        }
    }
    ```
}

***

* ### `decoderawtx`
    * Arguments (positional):
    1. `TRANSACTION` The input Base16 transaction to sign.
    ```js
    params: [
        "TRANSACTION"
    ]
    ```
    * Returns
    `Object` -
    1. `transaction` - transaction object
    * Example
    ```js
    // Request
    curl http://127.0.0.1:8820/rpc/v3  -X POST --data '{"jsonrpc":"2.0","method":"decoderawtx",
    "params":["02000000011b1cb3fc24c24e13a71e11f26fd3bc8c69ff15e1269783e09b276a23b6bf1e18000000006b483045022100a59159cc8d3018899815e3189893c81b741166a7ee6e69cd5b04f989afe498e50220364a7b0a6ec0a0276e2019f372003b1fb88cb087791c368bb29bdff514ebb0ca012103046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355effffffff0264000000000000001976a91404a31ae84a152ca773728761b7260726d8aeff8c88ac01000000000000008c7be111000000001976a91441064be4875b7a3608a891173540e534d4b89b6f88ac010000000000000000000000"],"id":7}'

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" :
        {
            "hash" : "cb1906fee17d72a4bc71cfdb5b0e0f66d7a5067fd941e74cd703367d384821ff",
            "inputs" :
            [
                {
                    "address" : "tCrRWkDBZQTqp3AdZc39DSMJ8FremrTinj",
                    "previous_output" :
                    {
                        "hash" : "181ebfb6236a279be0839726e115ff698cbcd36ff2111ea7134ec224fcb31c1b",
                        "index" : 0
                    },
                    "script" : "[ 3045022100a59159cc8d3018899815e3189893c81b741166a7ee6e69cd5b04f989afe498e50220364a7b0a6ec0a0276e2019f372003b1fb88cb087791c368bb29bdff514ebb0ca01 ] [ 03046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e ]",
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
                        "type" : "etp"
                    },
                    "index" : 0,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 04a31ae84a152ca773728761b7260726d8aeff8c ] equalverify checksig",
                    "value" : 100
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
                    "value" : 299989900
                }
            ],
            "version" : "2"
        }
    }
    ```
***

* ### `sendrawtx`
    * Arguments (positional):
    1. `TRANSACTION` The input Base16 transaction to broadcast.
    ```js
    params:[
        "TRANSACTION"
    ]
    ```
    * Returns
    `Object` -
    * Example
    ```js
    // Request
    curl http://127.0.0.1:8820/rpc/v3  -X POST --data '{"jsonrpc":"2.0","method":"sendrawtx",
    "params":["02000000016164c4ccd70b57a9d7b956d63bf0d0c9bccb72cfaba49891fa9e833adacb65a401000000db00473044022042ccd72c3ce0f7bc34d4507964d6442877165e9efd8c45ca1b3f2721331f48f102200e5c1402d2775e87d258aa60feac3d79b2ba377e6665104196ad9ca75dc1c30b01483045022100b78987209417d81ffad5d45719e8a78a5730b6b8e22b98c73b6ca927a001fe6b022004b48edf88370fa001ae9423561762cbdd489b619ab82fcab64852e08358c7b0014c4752210200e5782241ce24af725f2e823dfcc325101cec604e422566ba5ce4ca4bd5bc8c2103046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e52aeffffffff0264000000000000001976a91404a31ae84a152ca773728761b7260726d8aeff8c88ac0100000000000000b83701000000000017a91409594fe3a84e3de95831d2474ca3ca29d2f9053d87010000000000000000000000"],"id":7}'

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" : "aedd4bdf49a688cdfd23c056848149568a198f8088ac5e15fc38418dc429ae2a"
    }
    ```

***

