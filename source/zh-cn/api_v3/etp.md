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

    * Example
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"3.0",
        "method":"getbalance",
        "params":[
            "test1",
            "passwd1"
        ]
    }' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 25,
        "jsonrpc" : "3.0",
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
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"3.0",
        "method":"listbalances",
        "params":[
            "test1",
            "passwd1"
        ]
    }' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 25,
        "jsonrpc" : "3.0",
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
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"3.0",
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
        "jsonrpc" : "3.0",
        "result" :
        {
            "transaction" :
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
    curl -X POST --data '{
        "id":125,
        "jsonrpc":"3.0",
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
        "jsonrpc" : "3.0",
        "result" :
        {
            "transaction" :
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
    curl -X POST --data '{
        "id":125,
        "jsonrpc":"3.0",
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
        "jsonrpc" : "3.0",
        "result" :
        {
            "transaction" :
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
* #### `sendmore to one receiver`
    ```js
    //example of sending to only one receiver.
    // Request
    curl -X POST --data '{
        "id":125,
        "jsonrpc":"3.0",
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
        "jsonrpc" : "3.0",
        "result" :
        {
            "transaction" :
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
    }
    ```

* #### `sendmore to multiple receivers`
    ```js
    //example of sending to multiple receivers.
    // Request
    curl -X POST --data '{
        "id":125,
        "jsonrpc":"3.0",
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
        "jsonrpc" : "3.0",
        "result" :
        {
            "transaction" :
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
    }
    ```

***

