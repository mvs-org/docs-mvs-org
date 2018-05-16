title: asset
comments: false
---

## Description
***

## API Methods
***

* ### `createasset`
    createasset
    * Parameters (optional)
    1. `-d` or `[--description]` The asset description.
    2. `-i` or `[--issuer]` The did symbol specified its issuer.
    3. `-n` or `[--decimalnumber]` The asset amount decimal number.
    4. `-r` or `[--rate]` The asset symbol/name.
    5. `-s` or `[--symbol]` The asset symbol/name. Global unique.
    6. `-v` or `[--volume]` The asset maximum supply volume.
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
    `Object` - the asset just created

    * Example
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"createasset",
        "params":[
            "test",
            "123456",
            {
                "description": "test asset",
                "issuer": "testdid01",
                "decimalnumber": 8,
                "symbol": "MVS.TST",
                "volume": 10000000,
                "rate": -1
            }
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 25,
        "jsonrpc" : "2.0",
        "result" :
        {
            "asset" :
            {
                "address" : "",
                "decimal_number" : 8,
                "description" : "test asset",
                "is_secondaryissue" : false,
                "issuer" : "testdid01",
                "maximum_supply" : 10000000,
                "secondaryissue_threshold" : 127,
                "status" : "unissued",
                "symbol" : "MVS.TST"
            }
        }
    }
    ```

***

* ### `deletelocalasset`
    deletelocalasset
    * Parameters (optional)
    1. `-s` or `[--symbol]` The asset symbol/name. Global unique.
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
    `operate` - delete operation
    `result` - success
    `symbol` - asset symbol

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"deletelocalasset",
    "params":["test", "123456", {"symbol": "MVS.TST2"}],"id":36}'

    // Response
    {
        "jsonrpc": "2.0",
        "id": 36,
        "result" :
        {
            "operate" : "delete",
            "result" : "success",
            "symbol" : "MVS.TST2"
        }
    }
    ```

***

* ### `issue`
    issue
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 10 etp
    2. `-m` or `[--model]` The asset attenuation model parameter
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `SYMBOL` issued asset symbol
    ```js
    params:[
        "ACCOUNTNAME",
        "ACCOUNTAUTH",
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
        "method":"issue",
        "params":[
            "test",
            "123456",
            "MVS.TST"
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
                "hash" : "60036d05751217dcb8966b72bf6a63b9698119852b8db207aae2a097f33e97f1",
                "inputs" :
                [
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "previous_output" :
                        {
                            "hash" : "f9a5b1b9b24596ae196644bf4c570a6dfae3a640eca9770894cbf1b15e3e929b",
                            "index" : 0
                        },
                        "script" : "[ 3044022054d56e8d58c35a5301b202637526c50b6a21ec15d957627735fd73efa6895d3102202f44387331d5f51b4a495d921c435bf3706dabc5ac627e4d8363716ef040fb3e01 ] [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]",
                        "sequence" : 4294967295
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "previous_output" :
                        {
                            "hash" : "8674c31635d01b553e82d43c40cd8d244305ffdd36d70f2cdc6c452c531a6dd3",
                            "index" : 0
                        },
                        "script" : "[ 30450221008214b82a6bf56130f267fb076e4279b45c5a59f4f5961a31161b154bead3334a022021c0718d8616cc12c750288ae2d0e09556219e7fe7e26ad4defa3930684b70da01 ] [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]",
                        "sequence" : 4294967295
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "previous_output" :
                        {
                            "hash" : "3741336e1183b2c0547d7a77f149c32025b3baa5794fa9d89e74289aafe0e237",
                            "index" : 0
                        },
                        "script" : "[ 30440220692ce6e3f045e378027358d2556d847d26fe4f3b9e9eaa8b0bee7de4929c11d302203f6c7cab72ca85974493f64eda13ccd01037db15e773188aa60f46d43197f26001 ] [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]",
                        "sequence" : 4294967295
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "previous_output" :
                        {
                            "hash" : "df120d742c43340141125e142890fd47cbbc49936e8c698efc466d171b7e5094",
                            "index" : 0
                        },
                        "script" : "[ 3045022100b4378e808d398ac69498c2e9c9eac39ab62fb5ca80508644b15f7bed8d78370002202294a44691a98726c70e652587639ee265a823566b36182097075598d64b976401 ] [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]",
                        "sequence" : 4294967295
                    }
                ],
                "lock_time" : "0",
                "outputs" :
                [
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "attachment" :
                        {
                            "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                            "decimal_number" : 8,
                            "description" : "test asset",
                            "issuer" : "testdid01",
                            "quantity" : 10000000,
                            "secondaryissue_threshold" : 127,
                            "symbol" : "MVS.TST",
                            "type" : "asset-issue"
                        },
                        "index" : 0,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 7f8c4bf15a7c4183ea69d853626be85e9336e09e ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "attachment" :
                        {
                            "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                            "cert" : "ISSUE",
                            "owner" : "testdid01",
                            "symbol" : "MVS.TST",
                            "type" : "asset-cert"
                        },
                        "index" : 1,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 7f8c4bf15a7c4183ea69d853626be85e9336e09e ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "attachment" :
                        {
                            "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                            "cert" : "DOMAIN",
                            "owner" : "testdid01",
                            "symbol" : "MVS",
                            "type" : "asset-cert"
                        },
                        "index" : 2,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 7f8c4bf15a7c4183ea69d853626be85e9336e09e ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "attachment" :
                        {
                            "type" : "etp"
                        },
                        "index" : 3,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 7f8c4bf15a7c4183ea69d853626be85e9336e09e ] equalverify checksig",
                        "value" : 200000000
                    }
                ],
                "version" : "3"
            }
        }
    }
    ```

***

* ### `getaccountasset`
    getaccountasset
    * Parameters (optional)
    1. `-c` or `[--cert]` If specified, then only get related asset cert. Default is not specified.
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `SYMBOL` Asset symbol.
    ```js
    params:[
        "ACCOUNTNAME",
        "ACCOUNTAUTH",
        "SYMBOL"
    ]
     ```
    * Returns
    `Object` - account assets

    * Example
    ```js
    // Request to get asset
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"getaccountasset",
        "params":[
            "test",
            "123456",
            "MVS.TST",
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 25,
        "jsonrpc" : "2.0",
        "result" :
        {
            "assets" :
            [
                {
                    "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                    "decimal_number" : 8,
                    "description" : "test asset",
                    "issuer" : "testdid01",
                    "locked_quantity" : 0,
                    "quantity" : 10000000,
                    "secondaryissue_threshold" : 127,
                    "status" : "unspent",
                    "symbol" : "MVS.TST"
                }
            ]
        }
    }
    ```

    ```js
    // Request to get cert
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"getaccountasset",
        "params":[
            "test",
            "123456",
            "MVS.TST",
            "--cert"
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 25,
        "jsonrpc" : "2.0",
        "result" :
        {
            "assetcerts" :
            [
                {
                    "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                    "cert" : "ISSUE",
                    "owner" : "testdid01",
                    "symbol" : "MVS.TST"
                }
            ]
        }
    }
    ```
***

* ### `getaddressasset`
    getaddressasset
    * Parameters (optional)
    1. `-c` or `[--cert]` If specified, then only get related asset cert. Default is not specified.
    * Parameters (positional)
    1. `ADDRESS` address
    ```js
    params:[
        "ADDRESS"
    ]
     ```
    * Returns
    `Object` - address assets

    * Example
    ```js
    // Request
    curl -X POST -d '{
        "id":38,
        "jsonrpc":"2.0",
        "method":"getaddressasset",
        "params":["MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m"]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 38,
        "jsonrpc" : "2.0",
        "result" :
        {
            "assets" :
            [
                {
                    "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                    "decimal_number" : 8,
                    "description" : "test asset",
                    "issuer" : "testdid01",
                    "locked_quantity" : 0,
                    "quantity" : 10000000,
                    "secondaryissue_threshold" : 127,
                    "status" : "unspent",
                    "symbol" : "MVS.TST"
                }
            ]
        }
    }
    ```

***

* ### `getasset`
    getasset by symbol
    * Parameters (optional)
    1. `-c` or `[--cert]` If specified, then only get related asset cert. Default is not specified.
    * Parameters (positional)
    1. `SYMBOL` Asset symbol.
    ```js
    params:[
        "SYMBOL"
    ]
     ```
    * Returns
    `Object` - assets with specified symbol

    * Example
    ```js
    // Request
    curl -X POST -d '{
        "id":38,
        "jsonrpc":"2.0",
        "method":"getasset",
        "params":[
            "MVS",
            "--cert"
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 38,
        "jsonrpc" : "2.0",
        "result" :
        {
            "assetcerts" :
            [
                {
                    "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                    "cert" : "DOMAIN",
                    "owner" : "testdid01",
                    "symbol" : "MVS"
                }
            ]
        }
    }
    ```

***

* ### `listassets`
    list assets details.
    * Parameters (optional)
    1. `-c` or `[--cert]` If specified, then only get related asset cert. Default is not specified.
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
    `Object` - assets

    * Example
    ```js
    // Request
    curl -X POST -d '{
        "id":38,
        "jsonrpc":"2.0",
        "method":"listassets",
        "params":[
            "test",
            "123456"
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 38,
        "jsonrpc" : "2.0",
        "result" :
        {
            "assets" :
            [
                {
                    "decimal_number" : 8,
                    "description" : "test asset",
                    "issuer" : "testdid01",
                    "locked_quantity" : 0,
                    "quantity" : 10000000,
                    "secondaryissue_threshold" : 127,
                    "status" : "unspent",
                    "symbol" : "MVS.TST"
                }
            ]
        }
    }
    ```
***

* ### `sendasset`
    sendasset
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `ADDRESS` Asset receiver.
    4. `SYMBOL` Asset symbol/name.
    5. `AMOUNT` Asset count.
    ```js
    params:[
        "ACCOUNTNAME",
        "ACCOUNTAUTH",
        "ADDRESS",
        "SYMBOL",
        "AMOUNT"
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
        "method":"sendasset",
        "params":[
            "test",
            "123456",
            "MTrW3QK8mjmTYSozdkLa7k9hyCExUBWYwP",
            "MVS.TST", "1000"]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" :
        {
            "transaction" :
            {
                "hash" : "a7990b9e597de5f6384cf2971deaa0105474d82a2868e598faa114219a2b96d0",
                "inputs" :
                [
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "previous_output" :
                        {
                            "hash" : "a8b3181cb9579427d126910283078edca5521c56ee6b8824a839de65fdea804b",
                            "index" : 0
                        },
                        "script" : "[ 3045022100be3bd72f61fc99050dd22c919f370b8b45887b38715b740e8ca1c2d2064cf918022053ee5275402ec9189dfeb11911e17528e1dae62f95282f8576ee05451359840601 ] [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]",
                        "sequence" : 4294967295
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "previous_output" :
                        {
                            "hash" : "60036d05751217dcb8966b72bf6a63b9698119852b8db207aae2a097f33e97f1",
                            "index" : 0
                        },
                        "script" : "[ 3044022050f36bc61437e69fc65b1539e3379d2240ac298e9ea304f164a59ea0cb49bb6f02205cb6b5d97c40f4031d93cec5e350089bb558f14a04be91573be304a68d5d24a501 ] [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]",
                        "sequence" : 4294967295
                    }
                ],
                "lock_time" : "0",
                "outputs" :
                [
                    {
                        "address" : "MTrW3QK8mjmTYSozdkLa7k9hyCExUBWYwP",
                        "attachment" :
                        {
                            "quantity" : 1000,
                            "symbol" : "MVS.TST",
                            "type" : "asset-transfer"
                        },
                        "index" : 0,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ dae1cde292d5b762c49ecdb18900e8e115df9695 ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "attachment" :
                        {
                            "type" : "etp"
                        },
                        "index" : 1,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 7f8c4bf15a7c4183ea69d853626be85e9336e09e ] equalverify checksig",
                        "value" : 299990000
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "attachment" :
                        {
                            "quantity" : 9999000,
                            "symbol" : "MVS.TST",
                            "type" : "asset-transfer"
                        },
                        "index" : 2,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 7f8c4bf15a7c4183ea69d853626be85e9336e09e ] equalverify checksig",
                        "value" : 0
                    }
                ],
                "version" : "2"
            }
        }
    }
    ```
***

* ### `sendassetfrom`
    sendassetfrom, should specify `from address`
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `FROMADDRESS` from address
    4. `TOADDRESS` target address
    5. `SYMBOL` asset symbol
    6. `AMOUNT` The asset amount shares
    ```js
    params:[
        "ACCOUNTNAME",
        "ACCOUNTAUTH",
        "FROMADDRESS",
        "TOADDRESS",
        "SYMBOL",
        "AMOUNT"
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
        "method":"sendassetfrom",
        "params":[
            "test",
            "123456",
            "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
            "MTrW3QK8mjmTYSozdkLa7k9hyCExUBWYwP",
            "MVS.TST", "1000"]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" :
        {
            "transaction" :
            {
                "hash" : "cc80c841c836833a3b76592ffeb9c4838c7025093ef13e2ef56f866155a6f6a5",
                "inputs" :
                [
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "previous_output" :
                        {
                            "hash" : "31582738df5a4fbc51769d066f6b9ae4af621058c87451ad863fadb6da62b71a",
                            "index" : 0
                        },
                        "script" : "[ 304402203d0cb466779ba3700b6b9e0dbcb2f68ecd5af744adfef6d0061d89b80e49842802205f0d40054bf1c498c87f7f786530b50eb1abf02a6b10c7282f6479e2c8aac9d501 ] [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]",
                        "sequence" : 4294967295
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "previous_output" :
                        {
                            "hash" : "a7990b9e597de5f6384cf2971deaa0105474d82a2868e598faa114219a2b96d0",
                            "index" : 2
                        },
                        "script" : "[ 30440220750d1b0e26174b41160db36e2f74d535a169b1231c2e6b944dbb12abe44bf3dd02207af6536378831fd27ac22abedfa142dc06736584abd281259822f25777493f4c01 ] [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]",
                        "sequence" : 4294967295
                    }
                ],
                "lock_time" : "0",
                "outputs" :
                [
                    {
                        "address" : "MTrW3QK8mjmTYSozdkLa7k9hyCExUBWYwP",
                        "attachment" :
                        {
                            "quantity" : 1000,
                            "symbol" : "MVS.TST",
                            "type" : "asset-transfer"
                        },
                        "index" : 0,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ dae1cde292d5b762c49ecdb18900e8e115df9695 ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "attachment" :
                        {
                            "type" : "etp"
                        },
                        "index" : 1,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 7f8c4bf15a7c4183ea69d853626be85e9336e09e ] equalverify checksig",
                        "value" : 299990000
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "attachment" :
                        {
                            "quantity" : 9998000,
                            "symbol" : "MVS.TST",
                            "type" : "asset-transfer"
                        },
                        "index" : 2,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 7f8c4bf15a7c4183ea69d853626be85e9336e09e ] equalverify checksig",
                        "value" : 0
                    }
                ],
                "version" : "2"
            }
        }
    }
    ```
***

* ### `secondaryissue`
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    2. `-m` or `[--model]` The asset attenuation model parameter
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `TODID` target did
    4. `SYMBOL` asset symbol
    5. `VOLUME` The asset amount shares
    ```js
    params:[
        "ACCOUNTNAME",
        "ACCOUNTAUTH",
        "TODID",
        "SYMBOL",
        "VOLUME"
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
        "method":"secondaryissue",
        "params":[
            "test",
            "123456",
            "testdid02",
            "MVS.TST",
            "300000"]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" :
        {
            "transaction" :
            {
                "hash" : "ffc81240ba9450536ae536c73371278cdfc6d93525e5cf90f6f70505cd4d3aa4",
                "inputs" :
                [
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "previous_output" :
                        {
                            "hash" : "60036d05751217dcb8966b72bf6a63b9698119852b8db207aae2a097f33e97f1",
                            "index" : 1
                        },
                        "script" : "[ 30440220546c550449497870675d6a3e147f710c19816561860d08b8f4d2d733f548773302202951b60405c8089b6543934225db7f6b9b65375ef0cfdf0680f488924c9c8f9801 ] [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]",
                        "sequence" : 4294967295
                    },
                    {
                        "address" : "MTrW3QK8mjmTYSozdkLa7k9hyCExUBWYwP",
                        "previous_output" :
                        {
                            "hash" : "a0202fb916487d2d8d3a28a26e3f1eeb1429b4f59c3ead992a003dff7081410c",
                            "index" : 1
                        },
                        "script" : "[ 3044022068f1ff4b5a92d97f2972cbce91e5c2b14f736064da84b6b7c8ee0e20cf779fc702207eede510ab696de35710d75d848209e84aef762f6a9ff94fc51150de2d311a2201 ] [ 0264f9e773328d677de10b4e4fdd4abd69a9cd08e37dd12cc6762a71917a578662 ]",
                        "sequence" : 4294967295
                    }
                ],
                "lock_time" : "0",
                "outputs" :
                [
                    {
                        "address" : "MTrW3QK8mjmTYSozdkLa7k9hyCExUBWYwP",
                        "attachment" :
                        {
                            "address" : "MTrW3QK8mjmTYSozdkLa7k9hyCExUBWYwP",
                            "decimal_number" : 8,
                            "description" : "test asset",
                            "issuer" : "testdid02",
                            "quantity" : 300000,
                            "secondaryissue_threshold" : 127,
                            "symbol" : "MVS.TST",
                            "type" : "asset-issue"
                        },
                        "index" : 0,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ dae1cde292d5b762c49ecdb18900e8e115df9695 ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "attachment" :
                        {
                            "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                            "cert" : "ISSUE",
                            "owner" : "testdid01",
                            "symbol" : "MVS.TST",
                            "type" : "asset-cert"
                        },
                        "index" : 1,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 7f8c4bf15a7c4183ea69d853626be85e9336e09e ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MTrW3QK8mjmTYSozdkLa7k9hyCExUBWYwP",
                        "attachment" :
                        {
                            "type" : "etp"
                        },
                        "index" : 2,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ dae1cde292d5b762c49ecdb18900e8e115df9695 ] equalverify checksig",
                        "value" : 103199990000
                    }
                ],
                "version" : "3"
            }
        }
    }
    ```

    ```js
    // Request with attenuation model
    curl -X POST --data '{
        "id":7,
        "jsonrpc":"2.0",
        "method":"secondaryissue",
        "params":[
            "test",
            "123456",
            "testdid02",
            "MVS.TST",
            "800000",
            {
                "model":"TYPE=1;LQ=60002;LP=6002;UN=3"
            }
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" :
        {
            "id" : 7,
            "jsonrpc" : "2.0",
            "result" :
            {
                "transaction" :
                {
                    "hash" : "a6671a3b74694f2d5da143153697d3d8cfda7f57aaa74fab0c83ef0ada2fc8de",
                    "inputs" :
                    [
                        {
                            "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                            "previous_output" :
                            {
                                "hash" : "ffc81240ba9450536ae536c73371278cdfc6d93525e5cf90f6f70505cd4d3aa4",
                                "index" : 1
                            },
                            "script" : "[ 3045022100c78829ab256e18b1a417bf80b6a7e1ed99f99b572e02b0f42a881de7b2ab2e7c022002ef7aa6c30f26a5096fda3e30ca17ebe57a2e5c1ccf06104c5e2bcde2f6d14901 ] [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]",
                            "sequence" : 4294967295
                        },
                        {
                            "address" : "MTrW3QK8mjmTYSozdkLa7k9hyCExUBWYwP",
                            "previous_output" :
                            {
                                "hash" : "ffc81240ba9450536ae536c73371278cdfc6d93525e5cf90f6f70505cd4d3aa4",
                                "index" : 2
                            },
                            "script" : "[ 3044022063b51643bc0b448c68dc5550215b6879dba865f5427fe2283bfaa831ebe30c0e022063f177655474c98ec7f78c85402c7e1a39540df7f7baa53d6dafe06997201dc701 ] [ 0264f9e773328d677de10b4e4fdd4abd69a9cd08e37dd12cc6762a71917a578662 ]",
                            "sequence" : 4294967295
                        }
                    ],
                    "lock_time" : "0",
                    "outputs" :
                    [
                        {
                            "address" : "MTrW3QK8mjmTYSozdkLa7k9hyCExUBWYwP",
                            "attachment" :
                            {
                                "address" : "MTrW3QK8mjmTYSozdkLa7k9hyCExUBWYwP",
                                "decimal_number" : 8,
                                "description" : "test asset",
                                "issuer" : "testdid02",
                                "quantity" : 800000,
                                "secondaryissue_threshold" : 127,
                                "symbol" : "MVS.TST",
                                "type" : "asset-issue"
                            },
                            "attenuation_model_param" : "TYPE=1;LQ=60002;LP=6002;UN=3",
                            "index" : 0,
                            "locked_height_range" : 0,
                            "script" : "[ 504e3d303b4c483d323030303b545950453d313b4c513d36303030323b4c503d363030323b554e3d33 ] [ 0000000000000000000000000000000000000000000000000000000000000000ffffffff ] checkattenuationverify dup hash160 [ dae1cde292d5b762c49ecdb18900e8e115df9695 ] equalverify checksig",
                            "value" : 0
                        },
                        {
                            "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                            "attachment" :
                            {
                                "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                                "cert" : "ISSUE",
                                "owner" : "testdid01",
                                "symbol" : "MVS.TST",
                                "type" : "asset-cert"
                            },
                            "index" : 1,
                            "locked_height_range" : 0,
                            "script" : "dup hash160 [ 7f8c4bf15a7c4183ea69d853626be85e9336e09e ] equalverify checksig",
                            "value" : 0
                        },
                        {
                            "address" : "MTrW3QK8mjmTYSozdkLa7k9hyCExUBWYwP",
                            "attachment" :
                            {
                                "type" : "etp"
                            },
                            "index" : 2,
                            "locked_height_range" : 0,
                            "script" : "dup hash160 [ dae1cde292d5b762c49ecdb18900e8e115df9695 ] equalverify checksig",
                            "value" : 103199980000
                        }
                    ],
                    "version" : "3"
                }
            }
        }
    ```

***

* ### `issuecert`
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `TODID` target did
    4. `SYMBOL` asset symbol
    5. `CERT` Asset cert type name. eg. NAMING
    ```js
    params:[
        "ACCOUNTNAME",
        "ACCOUNTAUTH",
        "TODID",
        "SYMBOL",
        "CERT"
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
        "method":"issuecert",
        "params":[
            "test",
            "123456",
            "testdid02",
            "MVS.NAMINGRIGHT",
            "NAMING"
            ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" :
        {
            "transaction" :
            {
                "hash" : "b56abab5be918ee63b5913002dd15387d675ce67fc13e273bc5593e0e444b9a9",
                "inputs" :
                [
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "previous_output" :
                        {
                            "hash" : "962d72e108c024ed9a5a2e4009e9d8e7dda6d52436921f371dde9fbe1b256eb9",
                            "index" : 0
                        },
                        "script" : "[ 3045022100bf7d56117349d3e8d99f4ec204f5a986ee02d4251bd0f17ea31ecf1c7e3459a602202f1a0a07eeb59a9010f00c3e0cd3f28c9e91b6f3b32d862323cc38413b8be2c801 ] [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]",
                        "sequence" : 4294967295
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "previous_output" :
                        {
                            "hash" : "60036d05751217dcb8966b72bf6a63b9698119852b8db207aae2a097f33e97f1",
                            "index" : 2
                        },
                        "script" : "[ 3045022100be9fd9b641871c97dd17bdaaedd05383a34aad99f6e863d71ee208981e93ea9802202ad2169c6fc6e553d518c3da4e4ea66ddd1b7a2ed73b4117cc8674293be68f4f01 ] [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]",
                        "sequence" : 4294967295
                    }
                ],
                "lock_time" : "0",
                "outputs" :
                [
                    {
                        "address" : "MTrW3QK8mjmTYSozdkLa7k9hyCExUBWYwP",
                        "attachment" :
                        {
                            "address" : "MTrW3QK8mjmTYSozdkLa7k9hyCExUBWYwP",
                            "cert" : "NAMING",
                            "owner" : "testdid02",
                            "symbol" : "MVS.NAMINGRIGHT",
                            "type" : "asset-cert"
                        },
                        "index" : 0,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ dae1cde292d5b762c49ecdb18900e8e115df9695 ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "attachment" :
                        {
                            "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                            "cert" : "DOMAIN",
                            "owner" : "testdid01",
                            "symbol" : "MVS",
                            "type" : "asset-cert"
                        },
                        "index" : 1,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 7f8c4bf15a7c4183ea69d853626be85e9336e09e ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "attachment" :
                        {
                            "type" : "etp"
                        },
                        "index" : 2,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 7f8c4bf15a7c4183ea69d853626be85e9336e09e ] equalverify checksig",
                        "value" : 299990000
                    }
                ],
                "version" : "3"
            }
        }
    }
    ```

***

* ### `transfercert`
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `TODID` target did
    4. `SYMBOL` asset symbol
    5. `CERT` Asset cert type name. eg. "ISSUE", "DOMAIN" or "NAMING"

    ```js
    params:[
        "ACCOUNTNAME",
        "ACCOUNTAUTH",
        "TODID",
        "SYMBOL",
        "CERT"
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
        "method":"transfercert",
        "params":[
            "test",
            "123456",
            "testdid01",
            "MVS.NAMINGRIGHT",
            "ISSUE"
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" :
        {
            "transaction" :
            {
                "hash" : "6339e14720d4b38025bb4c44a367eea547186788a9b09b6af255c59032149481",
                "inputs" :
                [
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "previous_output" :
                        {
                            "hash" : "2a26cafb20aef05af30c74a5e29da87ec229fceeaedbfaecba3cf8c94bf12388",
                            "index" : 0
                        },
                        "script" : "[ 30440220611aa6418141e2cfb1439e39b98c9a8597d2a37eb38f2a0da24d927aabf3de15022057776cf5e10f71e679301fe38014070a5ae5b66ef08465b8a76a1658eea62ee601 ] [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]",
                        "sequence" : 4294967295
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "previous_output" :
                        {
                            "hash" : "95ad43927b77d21567114db0511f459a6f2c3195e680df8875f444824942654d",
                            "index" : 0
                        },
                        "script" : "[ 3045022100e255df205a2cefb843dd830308bd7e5a0c3b4598671a0171e1dd05405d9443b702204086ff9b467397ed5fa5b8e400f6b9cb71b1317f00eec193063dc3d012197d8301 ] [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]",
                        "sequence" : 4294967295
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "previous_output" :
                        {
                            "hash" : "3726bb530ef6388b190c97f4fdb43a9274088928e8b1fabdf9419eb14769de80",
                            "index" : 1
                        },
                        "script" : "[ 3044022022f133daa5c47d723414e9d7b428a7b47525355dbf0d20b90cd2d7a6dd93304a02205fc31bf159567bea4daad0341c43d5e429b57fd5809defb1c793218a787a494c01 ] [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]",
                        "sequence" : 4294967295
                    }
                ],
                "lock_time" : "0",
                "outputs" :
                [
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "attachment" :
                        {
                            "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                            "cert" : "DOMAIN",
                            "owner" : "testdid02",
                            "symbol" : "MVS",
                            "type" : "asset-cert"
                        },
                        "index" : 0,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 830aa1718fc50ef867aa15bb8e4b3354a6b86bf1 ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MTrW3QK8mjmTYSozdkLa7k9hyCExUBWYwP",
                        "attachment" :
                        {
                            "address" : "MTrW3QK8mjmTYSozdkLa7k9hyCExUBWYwP",
                            "cert" : "NAMING",
                            "owner" : "testdid01",
                            "symbol" : "MVS.NAMINGRIGHT",
                            "type" : "asset-cert"
                        },
                        "index" : 1,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 830aa1718fc50ef867aa15bb8e4b3354a6b86bf1 ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "attachment" :
                        {
                            "type" : "etp"
                        },
                        "index" : 2,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 7f8c4bf15a7c4183ea69d853626be85e9336e09e ] equalverify checksig",
                        "value" : 299990000
                    }
                ],
                "version" : "2"
            }
        }
    }
    ```

***

* ### `burn`
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `SYMBOL` Asset symbol
    4. `AMOUNT` Asset integer bits
    ```js
    params:[
        "ACCOUNTNAME",
        "ACCOUNTAUTH",
        "SYMBOL",
        "AMOUNT"
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
        "method":"burn",
        "params":[
            "test",
            "123456",
            "MVS.NAMINGRIGHT",
            "60000000"
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" :
        {
            "transaction" :
            {
                "hash" : "107ab89c649e0489a2a0bebf2927a594d26d024393767eb2103633a6c35ccc42",
                "inputs" :
                [
                    {
                        "address" : "MLGuT4fp23SjyG2v5TW2PreQZTbXr7dyJe",
                        "previous_output" :
                        {
                            "hash" : "e5c1c9f069bb271298983f13ef9790d3cba2d92422dd3c5d4eff27b592c90e17",
                            "index" : 0
                        },
                        "script" : "[ 304402205722ed333a2f0412baa6a3ddd882afa69247567cd0480287dbd526dfd6b61b5a02201301b6974b1b9e1c95023e1a5a388fac98d277a67167465c90df8c773ea3eb7901 ] [ 02a6c7f2cbb0d0dff030f8082ce0f1b9f89ceb3340294fff2cb0a9ed78567cd37b ]",
                        "sequence" : 4294967295
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "previous_output" :
                        {
                            "hash" : "3726bb530ef6388b190c97f4fdb43a9274088928e8b1fabdf9419eb14769de80",
                            "index" : 0
                        },
                        "script" : "[ 304402207a1ed5f4eacbc6b168553ccd4190304397fe77bcdb3d22776f6fbf1442c449530220060c43d04e3a969133dc5ad8ea7efec19f85789da7d03ca7794568057582839301 ] [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]",
                        "sequence" : 4294967295
                    }
                ],
                "lock_time" : "0",
                "outputs" :
                [
                    {
                        "address" : "1111111111111111111114oLvT2",
                        "attachment" :
                        {
                            "quantity" : 60000000,
                            "symbol" : "MVS.NAMINGRIGHT",
                            "type" : "asset-transfer"
                        },
                        "index" : 0,
                        "locked_height_range" : 0,
                        "script" : "return",
                        "value" : 0
                    },
                    {
                        "address" : "MLGuT4fp23SjyG2v5TW2PreQZTbXr7dyJe",
                        "attachment" :
                        {
                            "type" : "etp"
                        },
                        "index" : 1,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 87be522ed3375aaf991b71fe72db89006c803e29 ] equalverify checksig",
                        "value" : 1300000000
                    },
                    {
                        "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
                        "attachment" :
                        {
                            "quantity" : 66600000000,
                            "symbol" : "MVS.NAMINGRIGHT",
                            "type" : "asset-transfer"
                        },
                        "index" : 2,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 7f8c4bf15a7c4183ea69d853626be85e9336e09e ] equalverify checksig",
                        "value" : 0
                    }
                ],
                "version" : "2"
            }
        }
    }
    ```
***