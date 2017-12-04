title: transaction
comments: false
---

## Description
***

## API Methods 
***

* ### `gettx`
    gettransaction
    * Parameters (positional)
    1. `HASH` The Base16 transaction hash of the transaction to get. If not specified the transaction hash is read from STDIN.
    ```js
    params:[
        "HASH"
    ]
     ```
    * Returns
    `Object` - get the transaction

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"gettransaction","params":["7cd20505a86400120c82be4f56d3c07a81007d51976dfc5e952296fce95afbad"],"id":31}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 31, 
        "result": {
            "inputs": [
                {
                    "previous_output": {
                        "index": "2", 
                        "hash": "9057283e0996aac98af902fe3139e57435ac3f6bfe9351f226caa01b36007722"
                    }, 
                    "script": "[ 304402202b0ea05973fd39a1f335bf951732520fbb65619893048ba3454c3b84c5a28ccf0220694e69f0d7aae622fe99fa3eac423dfb6b74d9fab9b0f9e3fe518a03db4ab93b01 ] [ 0240bc01ddeed51ee13363348b1f992a0e34c9657a1bae91ee4927fb319bdbe8b8 ]", 
                    "sequence": "4294967295", 
                    "address": "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV"
                }
            ], 
            "lock_time": "0", 
            "hash": "7cd20505a86400120c82be4f56d3c07a81007d51976dfc5e952296fce95afbad", 
            "outputs": [
                {
                    "index": "0", 
                    "script": "dup hash160 [ 4134d099f4b24b31c65ac2ca7ff9d561ecc0f7af ] equalverify checksig", 
                    "attachment": {
                        "type": "etp"
                    }, 
                    "value": "100000000000", 
                    "address": "MDqwRYEBqQXVxDQnUGpXJoTsH2RuxmXrrs"
                }, 
                {
                    "index": "1", 
                    "script": "dup hash160 [ 2759a0422370c52ac7bc57f6b3a082877bf40400 ] equalverify checksig", 
                    "attachment": {
                        "type": "etp"
                    }, 
                    "value": "4999100299920000", 
                    "address": "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV"
                }
            ], 
            "height": "0", 
            "version": "2"
        }
    }
    ```

***

* ### `listtxs`
    List transactions details of this account.
    * Parameters (optional)
    1. `-a` or `[--address]` Address.
    2. `-e` or `[--height]` Get tx according height. eg: -e start-height:end-height will return tx between [start-height, end-height)
    3. `-i` or `[--index]` Page index.
    4. `-l` or `[--limit]` Transaction count per page.
    5. `-s` or `[--symbol]` Asset symbol.
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
    `Object` - return transactions

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"listtxs","params":["test", "123456"],"id":32}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 32, 
        "result": {
            "current_page": "1", 
            "transaction_count": "3", 
            "total_page": "1", 
            "transactions": [
                {
                    "inputs": [
                        {
                            "script": "[ 0102 ]", 
                            "address": ""
                        }
                    ], 
                    "direction": "receive", 
                    "hash": "1b101da51413938f75ccaa5608a9885a3ae2a5fb523caf3ca74bc284302dfc09", 
                    "timestamp": "1509342591", 
                    "height": "2", 
                    "outputs": [
                        {
                            "etp-value": "300000000", 
                            "script": "dup hash160 [ 2759a0422370c52ac7bc57f6b3a082877bf40400 ] equalverify checksig", 
                            "own": "true", 
                            "attachment": {
                                "type": "etp"
                            }, 
                            "address": "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV"
                        }
                    ]
                }, 
                {
                    "inputs": [
                        {
                            "script": "[ 0101 ]", 
                            "address": ""
                        }
                    ], 
                    "direction": "receive", 
                    "hash": "12704aff83538708690c5e231b6d35cbb211a1bcab164d94da0357034089832d", 
                    "timestamp": "1509339103", 
                    "height": "1", 
                    "outputs": [
                        {
                            "etp-value": "300000000", 
                            "script": "dup hash160 [ 2759a0422370c52ac7bc57f6b3a082877bf40400 ] equalverify checksig", 
                            "own": "true", 
                            "attachment": {
                                "type": "etp"
                            }, 
                            "address": "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV"
                        }
                    ]
                }, 
                {
                    "inputs": [
                        {
                            "script": "[ 36653634633230393862383462303461306439663631613630643562633866356638306633376531396633616439633339626665343139646234323262333363 ]", 
                            "address": ""
                        }
                    ], 
                    "direction": "receive", 
                    "hash": "3aa85dd716bd94cab771a93ea8d0ae15df63f11ba01b298ac7091f07cc2da880", 
                    "timestamp": "1508986440", 
                    "height": "0", 
                    "outputs": [
                        {
                            "etp-value": "5000000000000000", 
                            "script": "dup hash160 [ 2759a0422370c52ac7bc57f6b3a082877bf40400 ] equalverify checksig", 
                            "own": "true", 
                            "attachment": {
                                "type": "etp"
                            }, 
                            "address": "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV"
                        }
                    ]
                }
            ]
        }
    }
    ```

***

* ### `fetch-history`


***

