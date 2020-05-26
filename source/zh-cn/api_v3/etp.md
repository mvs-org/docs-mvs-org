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
    1. `total_confirmed` - total confirmed(unspent) etp amount
    2. `total_received` - total received etp amount
    3. `total_unspent` - total unspent etp amount
    4. `total_available` - total available etp amount
    5. `total_frozen` - total frozen etp amount

    ```
    total_unspent = total_available + total_frozen
    ```

    * Example
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"getbalance",
        "params":[
            "test1",
            "passwd1"
        ]
    }' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 25,
        "jsonrpc" : "2.0",
        "result" :
        {
            "total_available" : 2000606696,
            "total_confirmed" : 2000606696,
            "total_frozen" : 0,
            "total_received" : 49291956690,
            "total_unspent" : 2000606696
        }
    }
    ```

***

* ### `getaddressetp`
    Show balance details of this address.
    * Parameters (optional)
    1. `-d` or `--deposited`  If specified, then only get deposited etp. Default is not specified.
    2. `-r` or `--range`      Pick utxo whose value is between this range [begin:end).
    3. `-u` or `--utxo`       If specified, list all utxos. Default is not specified.
    * Parameters (positional)
    1. `ADDRESS` Address.
    ```js
    params:[
        "ADDRESS"
    ]
     ```
    * Returns
    `Object` - balance of the address
    1. `address` - address
    2. `available` - available etp amount
    3. `confirmed` - confirmed(unspent) etp amount
    4. `frozen` - frozen etp amount
    5. `received` - received etp amount
    6. `unspent` - unspent etp amount

    ```
    unspent = available + frozen
    ```

    * Example
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"getaddressetp",
        "params":[
            "MJNo92g6DavpaCZbYjrH45iQ8eAKnLqmms"
        ]
    }' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 25,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "address" : "MJNo92g6DavpaCZbYjrH45iQ8eAKnLqmms",
            "available" : 4629959994,
            "confirmed" : 4629959994,
            "frozen" : 0,
            "received" : 11969909981,
            "unspent" : 4629959994
        }
    }
    ```

    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"getaddressetp",
        "params":[
            "MGb4a2vtRHY6kkEH486hHrGsziGhTcSiyn",
            "-r",
            "0:11",
            "--utxo"
        ]
    }' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 25,
        "jsonrpc" : "2.0",
        "result" : 
        [
            {
                "available" : 10,
                "balance" : 10,
                "frozen" : 0,
                "utxo_block" : 175052,
                "utxo_hash" : "6d324a1cadd7beb5cbeefaa494ca2bf9e084a8f5e99bbc894aff1492a373d3f3",
                "utxo_index" : 0
            },
            {
                "available" : 10,
                "balance" : 10,
                "frozen" : 0,
                "utxo_block" : 175052,
                "utxo_hash" : "cc34f673fdeda95a31e343060742afcd2189a9c719f1d4a2bc19b9d48922df28",
                "utxo_index" : 0
            }
        ]
    }
    ```
***

* ### `listbalances`
    List all balance details of each address of this account.
    * Parameters (optional)
    1. `-d` or `[--deposited]` List deposited ETPs, default is false.
    2. `-g` or `[--greater_equal]` Greater than ETP bits.
    3. `-l` or `[--lesser_equal]` Lesser than ETP bits.
    4. `-n` or `[--nozero]` List non-zero upsent records.
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
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"listbalances",
        "params":[
            "test1",
            "passwd1"
        ]
    }' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 25,
        "jsonrpc" : "2.0",
        "result" :
        [
            {
                "address" : "tRL8yxhSd3AAxpRcbxmEasv89VZ7ZJgh3y",
                "available" : 100646696,
                "confirmed" : 100646696,
                "frozen" : 0,
                "received" : 47391996691,
                "unspent" : 100646696
            },
            {
                "address" : "tKc8dxEEj9cWr4Ys2oUbgQxGtRgUEg9e5q",
                "available" : 1899960000,
                "confirmed" : 1899960000,
                "frozen" : 0,
                "received" : 1899960000,
                "unspent" : 1899960000
            }
        ]
    }
    ```

    ```js
    // Request for list deposited balances
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"listbalances",
        "params":[
            "test1",
            "passwd1",
            "--deposited"
        ]
    }' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 25,
        "jsonrpc" : "2.0",
        "result" : 
        [
            {
                "address" : "MV1VWVC7NiJ6BmZPXooiamZcp51SxMUFv3",
                "bonus_balance" : 117944,
                "deposited_balance" : 123000000,
                "deposited_height" : 25200,
                "expiration_height" : 28429,
                "tx_hash" : "bb51854e90fab434e37815e60ba6c7d3c335edfac97b41d6c2f6748fbc841d3c"
            }
        ]
    }
    ```
***

* ### `deposit`
    Deposit some etp, then get reward for frozen some etp. **(Forbidden after 0.9.0)**
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
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"deposit",
        "params":[
            "test11",
            "passwd1",
            10000,
            {
                "address": "tRL8yxhSd3AAxpRcbxmEasv89VZ7ZJgh3y",
                "deposit": 7
            }
        ]
    }' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 25,
        "jsonrpc" : "2.0",
        "result" :
        {
            "hash" : "256d6699d7c5dcc4be0bc34c3cc9b4d9fb7c8c63f57d98ec46449adc0a336f09",
            "inputs" :
            [
                {
                    "address" : "tRL8yxhSd3AAxpRcbxmEasv89VZ7ZJgh3y",
                    "previous_output" :
                    {
                        "hash" : "8e2dc008d39e1fd7ccea9c19fd2f72cc5d2c2d5d667de4cb86b5b86b7410848c",
                        "index" : 0
                    },
                    "script" : "[ 304402205eb1bb5ad9056c06db024bff142edca874dbaa6bcc88b74f22c290e078cf23b702200cf9201bca3c6055653a10e10bbe4d5c27b68f258e30a1d87591ceabcb86aa4401 ] [ 03b122b19d00981a2181ebabe58f1aae7d9ee245bf87a551e56ca5aea7f9b0ddfd ] [ 14 ]",
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
                        "type" : "etp"
                    },
                    "index" : 0,
                    "locked_height_range" : 10,
                    "script" : "[ 0a ] numequalverify dup hash160 [ c9e5a7523f9f51858ad923995de69be769a2ed7d ] equalverify checksig",
                    "value" : 10000
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
                    "value" : 99980000
                }
            ],
            "version" : "2"
        }
    }
    ```

***

* ### `send`
    `send`, alias `didsend` 
    * Parameters (optional)
    1. `-f` or `[--fee]`    The fee of tx. default_value 0.0001 etp
    2. `-c` or `[--change]` Change to this did/address
    3. `-m` or `[--memo]`   Attached memo for this transaction
    4. `-e` or `[--exclude]` Exclude utxo whose value is between this range [begin:end).
    5. `-x` or `[--locktime]` Locktime. defaults to 0
    * Parameters (positional)
    1. `ACCOUNTNAME`    Account name.
    2. `ACCOUNTAUTH`    Account password/authorization.
    3. `TO`             Send to this did/address
    4. `AMOUNT`         How many you will spend
    ```js
    params:[
        "ACCOUNTNAME",
        "ACCOUNTAUTH",
        "TO",
        "AMOUNT"
    ]
     ```
    * Returns
    `Object` - return the transaction

    * Example
    ```js
    // Request
    curl -X POST --data '{
        "id":125,
        "jsonrpc":"2.0",
        "method":"send",
        "params":[
            "test1",
            "passwd1",
            "tTmxWoQ3PohHaPdndAGD89o9AhLcJ7L9TJ",
            "10000"
        ]
    }' 127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 125,
        "jsonrpc" : "2.0",
        "result" :
        {
            "hash" : "a40ab699fbb769f571c27995208f8a2e1c6e26095e119d6c59dc43dd7cefd3a8",
            "inputs" :
            [
                {
                    "address" : "tRL8yxhSd3AAxpRcbxmEasv89VZ7ZJgh3y",
                    "previous_output" :
                    {
                        "hash" : "e6a464f8b505c57d67e0079138618241a80fe7f633a83b628f20e197d4fb3183",
                        "index" : 1
                    },
                    "script" : "[ 3045022100fdbd7c785d665516fc7066a845b7fcc9bae2a25545982b414036da148d28dc210220186ebcc78fdab96d579896ef8e990ebc0bae93241b42e6b1226cb4f904778ea401 ] [ 03b122b19d00981a2181ebabe58f1aae7d9ee245bf87a551e56ca5aea7f9b0ddfd ]",
                    "sequence" : 4294967295
                }
            ],
            "lock_time" : "0",
            "outputs" :
            [
                {
                    "address" : "tTmxWoQ3PohHaPdndAGD89o9AhLcJ7L9TJ",
                    "attachment" :
                    {
                        "type" : "etp"
                    },
                    "index" : 0,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ e4b7fb501e2a43b670b3854b042ea24934942b2f ] equalverify checksig",
                    "value" : 10000
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
                    "value" : 356695
                }
            ],
            "version" : "2"
        }
    }
    ```

***

* ### `sendfrom`
    `sendfrom`, alias `didsendfrom`.
    * Parameters (optional)
    1. `-f` or `[--fee]`    The fee of tx. default_value 0.0001 etp
    2. `-c` or `[--change]` Change to this did/address
    3. `-m` or `[--memo]`   Attached memo for this transaction
    4. `-e` or `[--exclude]` Exclude utxo whose value is between this range [begin:end).
    5. `-x` or `[--locktime]` Locktime. defaults to 0

    * Parameters (positional)
    1. `ACCOUNTNAME`    Account name.
    2. `ACCOUNTAUTH`    Account password/authorization.
    3. `FROM`           Send from this did/address
    4. `TO`             Send to this did/address
    5. `AMOUNT`         How many you will spend
    ```js
    params:[
        "ACCOUNTNAME",
        "ACCOUNTAUTH",
        "FROM",
        "TO",
        "AMOUNT"
    ]
     ```
    * Returns
    `Object` - return the transaction

    * Example
    ```js
    // Request
    curl -X POST --data '{
        "id":125,
        "jsonrpc":"2.0",
        "method":"sendfrom",
        "params":[
            "test1",
            "passwd1",
            "tRL8yxhSd3AAxpRcbxmEasv89VZ7ZJgh3y",
            "tTko1LmJMM4Y492xYWiacJ9pokxoG8FFjZ",
            "10000"
        ]
    }' 127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 125,
        "jsonrpc" : "2.0",
        "result" :
        {
            "hash" : "e6a464f8b505c57d67e0079138618241a80fe7f633a83b628f20e197d4fb3183",
            "inputs" :
            [
                {
                    "address" : "tRL8yxhSd3AAxpRcbxmEasv89VZ7ZJgh3y",
                    "previous_output" :
                    {
                        "hash" : "30bff29ce81dac72ca8e91a4e278bcab6a713889f1c6593e37daf21736da4fa8",
                        "index" : 1
                    },
                    "script" : "[ 3045022100999a1b328128732c763e449f4fa167807c8c7b8607504c4f572246fab2debbf902203d76137cc87a9a688b266ec0b05912eabe4f089471ab22dfef0e247633e4d44501 ] [ 03b122b19d00981a2181ebabe58f1aae7d9ee245bf87a551e56ca5aea7f9b0ddfd ]",
                    "sequence" : 4294967295
                }
            ],
            "lock_time" : "0",
            "outputs" :
            [
                {
                    "address" : "tTko1LmJMM4Y492xYWiacJ9pokxoG8FFjZ",
                    "attachment" :
                    {
                        "type" : "etp"
                    },
                    "index" : 0,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ e47fa100e48b4080dbe122ff402d5350cabe06fd ] equalverify checksig",
                    "value" : 10000
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
                    "value" : 376695
                }
            ],
            "version" : "2"
        }
    }
    ```

***

* ### `sendmore`
    send etp to multi target addresses, change is required, alias `didsendmore`.
    * Parameters (optional)
    1. `-f` or `[--fee]`        The fee of tx. default_value 0.0001 etp
    2. `-m` or `[--mychange]`   Change to this did/address
    3. `-i` or `[--memo]`       The memo to descript transaction
    4. `-r` or `[--receivers]`  Send to [did/address:amount]
    5. '-s' or `[--from]`       Send from this did/address

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
* #### `sendmore to one receiver`
    ```js
    //example of sending to only one receiver.
    // Request
    curl -X POST --data '{
        "id":125,
        "jsonrpc":"2.0",
        "method":"sendmore",
        "params":[
            "test1",
            "passwd1",
            {
                "receivers":"tTmxWoQ3PohHaPdndAGD89o9AhLcJ7L9TJ:10000",
                "mychange": "tRL8yxhSd3AAxpRcbxmEasv89VZ7ZJgh3y"
            }
        ]
    }' 127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 125,
        "jsonrpc" : "2.0",
        "result" :
        {
            "hash" : "0f37cbe6f0c31548655d7ebda6d576ffd9f3facddfaf4a3be0126ef613f25155",
            "inputs" :
            [
                {
                    "address" : "tRL8yxhSd3AAxpRcbxmEasv89VZ7ZJgh3y",
                    "previous_output" :
                    {
                        "hash" : "a40ab699fbb769f571c27995208f8a2e1c6e26095e119d6c59dc43dd7cefd3a8",
                        "index" : 1
                    },
                    "script" : "[ 3045022100e234a13e5d8e8b39774f8065c6994c0974b7f619cfaf8b77a7a9493fc8f93b3d022010c7c592ba1d37688b989d8ed1baa0b5a19b7a9ab2f65228ffe5b94b03e7557e01 ] [ 03b122b19d00981a2181ebabe58f1aae7d9ee245bf87a551e56ca5aea7f9b0ddfd ]",
                    "sequence" : 4294967295
                }
            ],
            "lock_time" : "0",
            "outputs" :
            [
                {
                    "address" : "tTmxWoQ3PohHaPdndAGD89o9AhLcJ7L9TJ",
                    "attachment" :
                    {
                        "type" : "etp"
                    },
                    "index" : 0,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ e4b7fb501e2a43b670b3854b042ea24934942b2f ] equalverify checksig",
                    "value" : 10000
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
                    "value" : 336695
                }
            ],
            "version" : "2"
        }
    }
    ```

* #### `sendmore to multiple receivers`
    ```js
    //example of sending to multiple receivers.
    // Request
    curl -X POST --data '{
        "id":125,
        "jsonrpc":"2.0",
        "method":"sendmore",
        "params":[
            "test1",
            "passwd1",
            {
                "receivers":[
                    "tTmxWoQ3PohHaPdndAGD89o9AhLcJ7L9TJ:10000",
                    "tEjJGzM6LB5zsK6aX8urD9RF5pAAJyrodC:10000"
                ],
                "mychange": "tRL8yxhSd3AAxpRcbxmEasv89VZ7ZJgh3y"
            }
        ]
    }' 127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 125,
        "jsonrpc" : "2.0",
        "result" :
        {
            "hash" : "8294ae20bbcc00f07ff20d5e2e01653b55592528705b4a40d3f88f856590cf62",
            "inputs" :
            [
                {
                    "address" : "tRL8yxhSd3AAxpRcbxmEasv89VZ7ZJgh3y",
                    "previous_output" :
                    {
                        "hash" : "0f37cbe6f0c31548655d7ebda6d576ffd9f3facddfaf4a3be0126ef613f25155",
                        "index" : 1
                    },
                    "script" : "[ 304402200a6540d1f9eea2682e326a8da6a733f0d49dda718a126e28edc6e1283a1d172d02207c7b31a8e317756920647b0ab5fc8fe3723ecefd11b70bec533f3a03ee67635801 ] [ 03b122b19d00981a2181ebabe58f1aae7d9ee245bf87a551e56ca5aea7f9b0ddfd ]",
                    "sequence" : 4294967295
                }
            ],
            "lock_time" : "0",
            "outputs" :
            [
                {
                    "address" : "tTmxWoQ3PohHaPdndAGD89o9AhLcJ7L9TJ",
                    "attachment" :
                    {
                        "type" : "etp"
                    },
                    "index" : 0,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ e4b7fb501e2a43b670b3854b042ea24934942b2f ] equalverify checksig",
                    "value" : 10000
                },
                {
                    "address" : "tEjJGzM6LB5zsK6aX8urD9RF5pAAJyrodC",
                    "attachment" :
                    {
                        "type" : "etp"
                    },
                    "index" : 1,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 559d9851e62cfe1c05174958ca493aab96523fae ] equalverify checksig",
                    "value" : 10000
                },
                {
                    "address" : "tRL8yxhSd3AAxpRcbxmEasv89VZ7ZJgh3y",
                    "attachment" :
                    {
                        "type" : "etp"
                    },
                    "index" : 2,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ c9e5a7523f9f51858ad923995de69be769a2ed7d ] equalverify checksig",
                    "value" : 306695
                }
            ],
            "version" : "2"
        }
    }
    ```

***

* ### `lock`
    lock etp to a target did.
    * Parameters (optional)
    1. `-c` or `[--change]`        Change to this did/address
    2. `-f` or `[--fee]`           Transaction fee. defaults to 0.0001 etp
    3. `-m` or `[--memo]`          Attached memo for this transaction
    4. `-s` or `[--from]`          Send from this did/address

    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `TO_`         Lock to this did.
    4. `AMOUNT`      ETP integer bits.
    5. `SEQUENCE`    Lock sequence value, max value is 1048575 for block height unit
    ```js
    params:[
        "ACCOUNTNAME",
        "ACCOUNTAUTH",
        "TO_",
        "AMOUNT",
        "SEQUENCE"
    ]
     ```
    * Returns
    `Object` - return the transaction

    * Example
    ```js
    // Request
    curl -X POST --data '{"id":114, "jsonrpc":"2.0", "method":"lock", "params":["test1", "passwd1", "MNMybr6Ux3ddYNNXCtW2zMPN85LXTbiori", "12345678", "1000"]}' 127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 114,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "hash" : "b30f53f157fb4859cb29b15800c88c742bdb3753be698a34527a3fa80e3775f0",
            "inputs" : 
            [
                {
                    "address" : "MNMybr6Ux3ddYNNXCtW2zMPN85LXTbiori",
                    "previous_output" : 
                    {
                        "hash" : "14c412c9d03208c4c7b700c6d28c73c3b72e7d6cbbe4054726befd5a49ec42a7",
                        "index" : 0
                    },
                    "script" : "[ 30440220356c8bbbfa77e9b8c63d4aca466cde70f80e1119c816f6c7c8b77a19f0ffa0bd022003ef227f103bf93cd644efaf8d6395b30bf879e8dd67db746134f87f2c923dad01 ] [ 03977ccd611e644e2446988aaf546c3d2e72425d5b513a863a8fd398f124c7e001 ]",
                    "sequence" : 4294967295
                }
            ],
            "lock_time" : "0",
            "outputs" : 
            [
                {
                    "address" : "MNMybr6Ux3ddYNNXCtW2zMPN85LXTbiori",
                    "attachment" : 
                    {
                        "type" : "etp"
                    },
                    "index" : 0,
                    "locked_height_range" : 0,
                    "script" : "[ e803 ] checksequenceverify drop dup hash160 [ 9ea41e2b2eed4f0d2f16ab1aca6124ab49c89e4d ] equalverify checksig",
                    "value" : 12345678
                },
                {
                    "address" : "MNMybr6Ux3ddYNNXCtW2zMPN85LXTbiori",
                    "attachment" : 
                    {
                        "type" : "etp"
                    },
                    "index" : 1,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 9ea41e2b2eed4f0d2f16ab1aca6124ab49c89e4d ] equalverify checksig",
                    "value" : 287644322
                }
            ],
            "version" : "4"
        }
    }
    ```

***

* ### `getlocked`
    get locked balance of target did/address.
    * Parameters (optional)
    1. `-e` or `[--expiration]` expiration height, should be still locked at this height.
    2. `-k` or `[--stake]`      If specified, then sum effective locked values for DPoS stake.
    3. `-r` or `[--range]`      Pick locked value between this range [begin:end).

    * Parameters (positional)
    1. `ADDRESS` did/address.

    * Returns
    `Array`

    * Example
    ```js
    // Request
    curl -X POST --data '{"id":114, "jsonrpc":"2.0", "method":"getlocked", "params":["MNMybr6Ux3ddYNNXCtW2zMPN85LXTbiori"]}' 127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 114,
        "jsonrpc" : "2.0",
        "result" : 
        [
            {
                "address" : "MNMybr6Ux3ddYNNXCtW2zMPN85LXTbiori",
                "expiration_height" : 1101,
                "lock_at_height" : 101,
                "locked_balance" : 12345678,
                "locked_height" : 1000
            }
        ]
    }
    ```

***

