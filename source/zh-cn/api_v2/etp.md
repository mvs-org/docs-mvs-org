title: etp
comments: false
---

## Description
***

## API Methods 
***

* ### `getbalance`
    Show total balance details of this account.
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
    `Object` - balance summaries
    1. `total-confirmed` - total confirmed(unspent) etp amount
    2. `total-received` - total received etp amount
    3. `total-unspent` - total unspent etp amount
    4. `total-available` - total available etp amount
    5. `total-frozen` - total frozen etp amount

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"getbalance",
    "params":["test", "123456"],"id":6}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 6, 
        "result": {
            "total-received": "5000000600000000", 
            "total-available": "5000000300000000", 
            "total-confirmed": "600000000", 
            "total-frozen": "300000000", 
            "total-unspent": "5000000600000000"
        }
    }
    ```

***

* ### `listbalances`
    List all balance details of each address of this account.
    * Parameters (optional)
    1. `-n` or `[--nozero]` List non-zero upsent records.
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
    `Array` - return balance of each address
    1. `confirmed` - the address confirmed(unspent) etp amount
    2. `received` - the address received etp amount
    3. `unspent` - the address unspent etp amount
    4. `available` - the address available etp amount
    5. `frozen` - the address frozen etp amount

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"listbalances",
    "params":["test", "123456"],"id":12}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 12, 
        "result": [
            {
                "unspent": "5000000600000000", 
                "received": "5000000600000000", 
                "confirmed": "5000000600000000", 
                "frozen": "300000000", 
                "available": "5000000300000000", 
                "address": "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV"
            }, 
            {
                "unspent": "0", 
                "received": "0", 
                "confirmed": "0", 
                "frozen": "0", 
                "available": "0", 
                "address": "MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2"
            }
        ]
    }
    ```

***

* ### `deposit`
    Deposit some etp, then get reward for frozen some etp.
    * Parameters (optional)
    1. `-a` or `[--address]` The deposit target address.
    2. `-d` or `[--deposit]` Deposits support [7, 30, 90, 182, 365] days. defaluts to 7 days
    3. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `AMOUNT` How many you will deposit.
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "AMOUNT"
    ]
     ```
    * Returns
    `Object` - deposit transaction to be send.

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"deposit",
    "params":["test", "123456", "100000000000"],"id":3}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 3, 
        "result": {
            "transaction": {
                "inputs": [
                    {
                        "previous_output": {
                            "index": "1", 
                            "hash": "95766456282830e9d527dae3875546b6602f3d6b394fd375c0c611e3a4323512"
                        }, 
                        "script": "[ 3045022100abc4ba4cd5cdf7aeff93b94e1f5810186a2ca4652cad1466b1069c97702b3ac80220395e12d2d1f29decef0c386531dfc391544c2ae7883c90ed3029c66d386895c501 ] [ 02733174564d4f6e721081f2caedb97612140c59de8ee2be43257924438b09d80b ]", 
                        "sequence": "4294967295", 
                        "address": "MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2"
                    }
                ], 
                "lock_time": "0", 
                "version": "2", 
                "hash": "02cc2fb73a35c5b1b1d15d76e34a674d39702973d2d0d94aa28c7aea8b45b0f3", 
                "outputs": [
                    {
                        "index": "0", 
                        "script": "[ 7062 ] numequalverify dup hash160 [ 2759a0422370c52ac7bc57f6b3a082877bf40400 ] equalverify checksig", 
                        "attachment": {
                            "type": "etp"
                        }, 
                        "value": "100000000000", 
                        "address": "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV"
                    }, 
                    {
                        "index": "1", 
                        "script": "dup hash160 [ 4aa9e07c613f9dde2aae258d5ff3bd7bbbf98348 ] equalverify checksig", 
                        "attachment": {
                            "type": "etp"
                        }, 
                        "value": "4999800299950000", 
                        "address": "MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2"
                    }
                ]
            }
        }
    }
    ```

***

* ### `send`
    send etp to a targert address, mychange goes to another existed address of this account.
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    2. `-m` or `[--memo]` The memo to descript transaction
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `TOADDRESS` Send to this address
    4. `AMOUNT` How many you will spend
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "TOADDRESS", 
        "AMOUNT"
    ]
     ```
    * Returns
    `Object` - return the transaction

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"send",
    "params":["test", "123456", "MCH7xHbfVD8viUcZ3xgDdSJANhS7DQDJAi", "100000000000"],"id":13}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 13, 
        "result": {
            "inputs": [
                {
                    "previous_output": {
                        "index": "2", 
                        "hash": "ccaa270fbcc55583cfcb911a35a4a4aa92f68c311ecdd62790c63f2c8119c4eb"
                    }, 
                    "script": "[ 3045022100c490ca97e4100a956c70da14b3a3d882a54fa7b3b103c55871ec7c71fbeb1f4702201c2ab0e68ff4cd7175145cb5fca3941179dfa1f53a99e9c4b8c32af55f55d64101 ] [ 0240bc01ddeed51ee13363348b1f992a0e34c9657a1bae91ee4927fb319bdbe8b8 ]", 
                    "sequence": "4294967295", 
                    "address": "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV"
                }
            ], 
            "lock_time": "0", 
            "version": "2", 
            "hash": "ef0f1ba4e7e10f084aa4287d952699e832b77c4c87abbea3e1ba088604c4f745", 
            "outputs": [
                {
                    "index": "0", 
                    "script": "dup hash160 [ 3007c09fdedeebcd243e23ff59ede328c2da5c9f ] equalverify checksig", 
                    "attachment": {
                        "type": "etp"
                    }, 
                    "value": "100000000000", 
                    "address": "MCH7xHbfVD8viUcZ3xgDdSJANhS7DQDJAi"
                }, 
                {
                    "index": "1", 
                    "script": "dup hash160 [ 2759a0422370c52ac7bc57f6b3a082877bf40400 ] equalverify checksig", 
                    "attachment": {
                        "type": "etp"
                    }, 
                    "value": "4999700299970000", 
                    "address": "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV"
                }
            ]
        }
    }
    ```

***

* ### `sendfrom`
    send etp from a specified address of this account to target address, mychange goes to from_address.
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    2. `-m` or `[--memo]` The memo to descript transaction
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `FROMADDRESS` Send from this address
    4. `TOADDRESS` Send to this address
    5. `AMOUNT` How many you will spend
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "FROMADDRESS", 
        "TOADDRESS", 
        "AMOUNT"
    ]
     ```
    * Returns
    `Object` - return the transaction

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"sendfrom",
    "params":["test", "123456", "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV", "MCH7xHbfVD8viUcZ3xgDdSJANhS7DQDJAi", "100000000000"],"id":14}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 14, 
        "result": {
            "inputs": [
                {
                    "previous_output": {
                        "index": "1", 
                        "hash": "730bc3cd92eb60168a7b30a29246d61ef7670e559c4f256a485e79286da4bba9"
                    }, 
                    "script": "[ 304402205a5b6edde3f00295b0132cca443c68f270205e66be1e4423f6529c1a53de226d022036ba0fe32697813a3e59008611b3a7e21402eaa1674d0a45a3c061c8b4c2f32301 ] [ 0240bc01ddeed51ee13363348b1f992a0e34c9657a1bae91ee4927fb319bdbe8b8 ]", 
                    "sequence": "4294967295", 
                    "address": "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV"
                }
            ], 
            "lock_time": "0", 
            "version": "2", 
            "hash": "c0097c2f729e6745e71f02aa534fd8f9c09f528c016fa6cd3e1501d6f70266d0", 
            "outputs": [
                {
                    "index": "0", 
                    "script": "dup hash160 [ 3007c09fdedeebcd243e23ff59ede328c2da5c9f ] equalverify checksig", 
                    "attachment": {
                        "type": "etp"
                    }, 
                    "value": "100000000000", 
                    "address": "MCH7xHbfVD8viUcZ3xgDdSJANhS7DQDJAi"
                }, 
                {
                    "index": "1", 
                    "script": "dup hash160 [ 2759a0422370c52ac7bc57f6b3a082877bf40400 ] equalverify checksig", 
                    "attachment": {
                        "type": "etp"
                    }, 
                    "value": "4999500299950000", 
                    "address": "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV"
                }
            ]
        }
    }
    ```

***

* ### `sendmore`
    send etp to multi target addresses, must specify mychange address.
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    2. `-m` or `[--mychange]` Mychange to this address
    3. `-r` or `[--receivers]` Send to [address:amount]
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
    curl -X POST --data '{"jsonrpc":"2.0","method":"sendmore",
    "params":["test", "123456", {"receivers": "MDqwRYEBqQXVxDQnUGpXJoTsH2RuxmXrrs:100000000000", "receivers": "MShZjQLzrYCtwTvNfjgcL2fWGH4GKVZXGT:100000000000"}],"id":15}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 15, 
        "result": {
            "inputs": [
                {
                    "previous_output": {
                        "index": "1", 
                        "hash": "ef065f9614e6dbc16f19d8237b75db6e8f5d46cd235dc78039b4be02f3fad736"
                    }, 
                    "script": "[ 3045022100d4ff3269bf374136054edeab0d75fb49e47ca21a81db231378edc97e50fc679102203f7c33579bdbd0db42c8b11034422d75c98427709b965bd310acd127b34bc83201 ] [ 0240bc01ddeed51ee13363348b1f992a0e34c9657a1bae91ee4927fb319bdbe8b8 ]", 
                    "sequence": "4294967295", 
                    "address": "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV"
                }
            ], 
            "lock_time": "0", 
            "version": "2", 
            "hash": "9057283e0996aac98af902fe3139e57435ac3f6bfe9351f226caa01b36007722", 
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
                    "script": "dup hash160 [ ce3903c855a170afafa524fbe67b32de63aa1ed6 ] equalverify checksig", 
                    "attachment": {
                        "type": "etp"
                    }, 
                    "value": "100000000000", 
                    "address": "MShZjQLzrYCtwTvNfjgcL2fWGH4GKVZXGT"
                }, 
                {
                    "index": "2", 
                    "script": "dup hash160 [ 2759a0422370c52ac7bc57f6b3a082877bf40400 ] equalverify checksig", 
                    "attachment": {
                        "type": "etp"
                    }, 
                    "value": "4999200299930000", 
                    "address": "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV"
                }
            ]
        }
    }
    ```

***

