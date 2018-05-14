title: multisig
comments: false
---

## Description
***

## API Methods
***

* ### `getnewmultisig`
    getnewmultisig
    * Parameters (optional)
    1. `-d` or `[--description]` multisig record description.
    2. `-k` or `[--publickey]` cosigner public key used for multisig
    3. `-m` or `[--signaturenum]` Account multisig signature number.
    4. `-n` or `[--publickeynum]` Account multisig public key number.
    5. `-s` or `[--selfpublickey]` the public key belongs to this account.
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

    * Example
    ```js
    // Request
    curl -X POST --data '{
        "id":7,
        "jsonrpc":"2.0",
        "method":"getnewmultisig",
        "params":[
            "test",
            "123456",
            {
                "publickey": [
                    "03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02",
                    "03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e"
                ],
                "selfpublickey": "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9",
                "signaturenum": 2,
                "publickeynum": 3
            }
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" :
        {
            "address" : "39hh1NY9xyTKzawD8zFKXgXa7XBwqck6BR",
            "description" : "",
            "index" : 1,
            "m" : 2,
            "multisig-script" : "2 [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]  [ 03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e ]  [ 03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02 ] 3 checkmultisig",
            "n" : 3,
            "public-keys" :
            [
                "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9",
                "03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e",
                "03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02"
            ],
            "self-publickey" : "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9"
        }
    }
    ```

***

* ### `listmultisig`
    listmultisig
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
    `multisig` - multiple signature

    * Example
    ```js
    // Request
    curl -X POST --data '{
        "jsonrpc":"2.0",
        "method":"listmultisig",
        "id":48,
        "params":["test", "123456"]}' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 48,
        "jsonrpc" : "2.0",
        "result" :
        {
            "multisig" :
            [
                {
                    "address" : "39hh1NY9xyTKzawD8zFKXgXa7XBwqck6BR",
                    "description" : "",
                    "index" : 1,
                    "m" : 2,
                    "multisig-script" : "2 [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]  [ 03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e ]  [ 03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02 ] 3 checkmultisig",
                    "n" : 3,
                    "public-keys" :
                    [
                        "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9",
                        "03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e",
                        "03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02"
                    ],
                    "self-publickey" : "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9"
                }
            ]
        }
    }
    ```

***

* ### `deletemultisig`
    deletemultisig
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `ADDRESS` The multisig script corresponding address.
    ```js
    params:[
        "ACCOUNTNAME",
        "ACCOUNTAUTH",
        "ADDRESS"
    ]
     ```
    * Returns
    `Object` -

    * Example
    ```js
    // Request
    curl -X POST --data '{
        "jsonrpc":"2.0",
        "method":"deletemultisig",
        "id":46,
        "params":[
            "test",
            "123456",
            "39hh1NY9xyTKzawD8zFKXgXa7XBwqck6BR"
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 46,
        "jsonrpc" : "2.0",
        "result" :
        {
            "multisig" :
            [
                {
                    "address" : "39hh1NY9xyTKzawD8zFKXgXa7XBwqck6BR",
                    "description" : "",
                    "index" : 1,
                    "m" : 2,
                    "multisig-script" : "2 [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]  [ 03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e ]  [ 03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02 ] 3 checkmultisig",
                    "n" : 3,
                    "public-keys" :
                    [
                        "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9",
                        "03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e",
                        "03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02"
                    ],
                    "self-publickey" : "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9"
                }
            ]
        }
    }
    ```

***

* ### `createmultisigtx`
    createmultisigtx
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
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
    `Object` -
    1. `raw` - The Base16 transaction.

    * Example
    ```js
    // Request
    curl -X POST --data '{
        "jsonrpc":"2.0",
        "method":"createmultisigtx",
        "id":45,
        "params":[
            "test",
            "123456",
            "39hh1NY9xyTKzawD8zFKXgXa7XBwqck6BR",
            "MHaKHUFwAdcszvQarCmn1Rkq2uRoPQjZwm",
            3344
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 45,
        "jsonrpc" : "2.0",
        "result" :
        {
            "hex" : "02000000016453713104d144387553bcb0fa457f40d2dc5fb916bd9e2256835a4b6de48d4c00000000b500483045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e3014c69522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253aeffffffff02100d0000000000001976a9146a20e940e8d7be0a49c598e91fa79c8b36e5353588ac0100000000000000d0fb01000000000017a91457e1a19e5ee4c0065f8fd76b0351fa145e44435a87010000000000000000000000"
        }
    }
    ```

***

* ### `signmultisigtx`
    signmultisigtx
    * Parameters (optional)
    1. `-b` or `[--broadcast]` Broadcast the tx automatically if it is fullly signed, disabled by default.
    2. `-s` or `[--selfpublickey]` The private key of this public key will be used to sign.
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `TRANSACTION` The input Base16 transaction to sign.
    ```js
    params:[
        "ACCOUNTNAME",
        "ACCOUNTAUTH",
        "TRANSACTION"
    ]
     ```
    * Returns
    `Object` -
    1. `raw` - The Base16 transaction.

    * Example
    ```js
    // Request
    curl -X POST --data '{
        "jsonrpc":"2.0",
        "method": "signmultisigtx",
        "id":7,
        "params":[
            "testam",
            "testam",
            "--broadcast",
            "02000000016453713104d144387553bcb0fa457f40d2dc5fb916bd9e2256835a4b6de48d4c00000000b500483045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e3014c69522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253aeffffffff02100d0000000000001976a9146a20e940e8d7be0a49c598e91fa79c8b36e5353588ac0100000000000000d0fb01000000000017a91457e1a19e5ee4c0065f8fd76b0351fa145e44435a87010000000000000000000000"
        ]}' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" :
        {
            "hex" : "02000000016453713104d144387553bcb0fa457f40d2dc5fb916bd9e2256835a4b6de48d4c00000000fdfd0000483045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e3014730440220018b6a113d89de18b6c3c7090758cf9e4ca24e7762a2796b872bf6d2d1015b96022046b4518aa9451e617dff9467db7fe0c0d45811d0884faed51e343fec2c4579ff014c69522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253aeffffffff02100d0000000000001976a9146a20e940e8d7be0a49c598e91fa79c8b36e5353588ac0100000000000000d0fb01000000000017a91457e1a19e5ee4c0065f8fd76b0351fa145e44435a87010000000000000000000000"
        }
    }
    ```
