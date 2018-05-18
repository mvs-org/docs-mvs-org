title: multisig
comments: false
---

## Description
***
多重签名使用流程：
1. 每一个参与者通过 `getpublickey` 获得某个地址的公钥，该公钥对应的私钥用于签名随后创建的多重签名交易，并把该公钥告知其他所有参与者；
2. 每一个参与者各自通过 `getnewmultisig` 使用自己的公钥创建签名约束条件相同（即相同的m，n以及公钥列表）的多重签名，得到相同的以3开头的多重签名地址：P2SH（Pay-to-Script-Hash）；
3. 某个参与者通过 `createmultisigtx` 使用多重签名地址发起一笔多重签名交易，该参与者的签名已包含在该命令输出交易的中；可以使用 `decoderawtx` 命令查看该交易详情；
4. m - 1 个参与者依次通过 `signmultisigtx` 对多重签名交易进行签名，每一个参与者通过链下的方式从前一个签名参与者获得已部分签名的交易；
5. 可以在 `signmultisigtx` 命令中使用 `--broadcast` 选项自动广播拥有足够多签名的多重签名交易，或通过 `sendrawtx` 广播拥有足够多签名的多重签名交易，推荐使用前者。

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

* ### `createmultisigtx`
    createmultisigtx
    * Parameters (optional)
    1. `-f` or `[--fee]` The fee of tx. default_value 0.0001 etp
    2. `-s` or `[--symbol]` asset name, not specify this option for etp tx
    3. `-t` or `[--type]`   Transaction type, defaults to 0. 0 -- transfer etp, 3 -- transfer asset
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
    `Object` - The Base16 transaction.

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
            "02000000016453713104d144387553bcb0fa457f40d2dc5fb916bd9e2256835a4b6de48d4c00000000b500483045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e3014c69522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253aeffffffff02100d0000000000001976a9146a20e940e8d7be0a49c598e91fa79c8b36e5353588ac0100000000000000d0fb01000000000017a91457e1a19e5ee4c0065f8fd76b0351fa145e44435a87010000000000000000000000"
        }
    }
    ```

    * Example 2, send asset
    ```bash
    mvs-cli createmultisigtx -s ALICE20180518T111709.ASSET -t 3 test 123456 34EHRzpwKmFno8zPi3YvXBgqwzZGbYhS3a MKow3n2psKMwLuzufxoJzPycTyEiUcFJSQ 333
    ```

    // Request
    ```js
    curl -X POST --data '{
        "jsonrpc":"2.0",
        "method":"createmultisigtx",
        "id":45,
        "params":[
            "test",
            "123456",
            "34EHRzpwKmFno8zPi3YvXBgqwzZGbYhS3a",
            "MKow3n2psKMwLuzufxoJzPycTyEiUcFJSQ",
            333,
            {
                "symbol":"ALICE20180518T111709.ASSET",
                "type":3
            }
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 45,
        "jsonrpc" : "2.0",
        "result" :
        {
            "02000000027228f5e854b565c2abc0c76d03be2b35aee4e6ee1d5df31bf586944b7a0230dc000000009300483045022100e483f215974cd4033887e48bb1a8db7dc5d7ed189078a8a1769efa643f7b8ea202205f4c803a979c910fcc23acfffebe0c7cb6c3e5354b8eaa0b5ba52159cdeda5ba014c47522102f611da5c3c78472855aad6af94b6e56521999f3884bc25165720349556b823062103d54aa74f5832252992cc61ce62bc91e66f2715720cb15256d1bf132fef1f777852aeffffffff1fef544624891be0b3b7e3374a6ebeba3b989b8609f1812e2333d1ffb756e7cc0000000092004730440220243819f923a1d2bea11c2da729a746886ab1d6deef980d8effc64e2acd472b580220042ff9c7e7df3c6911f0e52283b053b00452acb8be4bfc90aed9a98f24f83783014c47522102f611da5c3c78472855aad6af94b6e56521999f3884bc25165720349556b823062103d54aa74f5832252992cc61ce62bc91e66f2715720cb15256d1bf132fef1f777852aeffffffff0300000000000000001976a91482a46ca6e0ac21a3b41eff496a57a902ec47654788ac0100000002000000020000001a414c4943453230313830353138543131313730392e41535345544d010000000000003ec642480000000017a9141bda177776546d2766bcfac2fc7a87cae746de1e870100000000000000000000000000000017a9141bda177776546d2766bcfac2fc7a87cae746de1e870100000002000000020000001a414c4943453230313830353138543131313730392e41535345549b0200000000000000000000"
        }
    }
    ```

***

* ### `signmultisigtx`
    signmultisigtx
    * Parameters (optional)
    1. `-b` or `[--broadcast]` Broadcast the tx if it is fullly signed, disabled by default.
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
    `Object` - The Base16 transaction.

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
            "02000000016453713104d144387553bcb0fa457f40d2dc5fb916bd9e2256835a4b6de48d4c00000000fdfd0000483045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e3014730440220018b6a113d89de18b6c3c7090758cf9e4ca24e7762a2796b872bf6d2d1015b96022046b4518aa9451e617dff9467db7fe0c0d45811d0884faed51e343fec2c4579ff014c69522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253aeffffffff02100d0000000000001976a9146a20e940e8d7be0a49c598e91fa79c8b36e5353588ac0100000000000000d0fb01000000000017a91457e1a19e5ee4c0065f8fd76b0351fa145e44435a87010000000000000000000000"
        }
    }
    ```
