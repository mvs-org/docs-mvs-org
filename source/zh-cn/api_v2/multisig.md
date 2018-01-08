title: multisig
comments: false
---

## Description
***

## API Methods 
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
    1. `hex` - The Base16 transaction.

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"createmultisigtx",
    "params":["test", "123456", "MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2", "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV", "100000000000"],"id":45}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 45, 
        "result":
        {
            "hex" : "02000000016164c4ccd70b57a9d7b956d63bf0d0c9bccb72cfaba49891fa9e833adacb65a4010000009300483045022100b78987209417d81ffad5d45719e8a78a5730b6b8e22b98c73b6ca927a001fe6b022004b48edf88370fa001ae9423561762cbdd489b619ab82fcab64852e08358c7b0014c4752210200e5782241ce24af725f2e823dfcc325101cec604e422566ba5ce4ca4bd5bc8c2103046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e52aeffffffff0264000000000000001976a91404a31ae84a152ca773728761b7260726d8aeff8c88ac0100000000000000b83701000000000017a91409594fe3a84e3de95831d2474ca3ca29d2f9053d87010000000000000000000000"
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
    curl -X POST --data '{"jsonrpc":"2.0","method":"deletemultisig",
    "params":["test", "123456", "32YSznH7h2iLBr6jCm1fvPk7MSXR93pmZ5"],"id":46}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 46, 
        "result":
        {
            "address" : "32YSznH7h2iLBr6jCm1fvPk7MSXR93pmZ5",
            "description" : "",
            "index" : "1",
            "m" : "2",
            "multisig-script" : "2 [ 0200e5782241ce24af725f2e823dfcc325101cec604e422566ba5ce4ca4bd5bc8c ]  [ 03046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e ] 2 checkmultisig",
            "n" : "2",
            "public-keys" : 
            [
                "0200e5782241ce24af725f2e823dfcc325101cec604e422566ba5ce4ca4bd5bc8c",
                "03046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e"
            ],
            "self-publickey" : "03046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e"
        }
    }
    ```
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
    curl -X POST --data '{"jsonrpc":"2.0","method":"getnewmultisig",
    "params":["test", "123456", {"publickey": "0200e5782241ce24af725f2e823dfcc325101cec604e422566ba5ce4ca4bd5bc8c", "selfpublickey": "03046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e", "signaturenum": 2, "publickeynum": 2],"id":7}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 47, 
        "result":
        {
            "address" : "32YSznH7h2iLBr6jCm1fvPk7MSXR93pmZ5",
            "description" : "",
            "index" : "1",
            "m" : "2",
            "multisig-script" : "2 [ 0200e5782241ce24af725f2e823dfcc325101cec604e422566ba5ce4ca4bd5bc8c ]  [ 03046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e ] 2 checkmultisig",
            "n" : "2",
            "public-keys" : 
            [
                "0200e5782241ce24af725f2e823dfcc325101cec604e422566ba5ce4ca4bd5bc8c",
                "03046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e"
            ],
            "self-publickey" : "03046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e"
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
    curl -X POST --data '{"jsonrpc":"2.0","method":"listmultisig",
    "params":["test", "123456"],"id":48}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 48, 
        "result":
        {
            "multisig" : 
            [
                {
                    "address" : "32YSznH7h2iLBr6jCm1fvPk7MSXR93pmZ5",
                    "description" : "",
                    "index" : "1",
                    "m" : "2",
                    "multisig-script" : "2 [ 0200e5782241ce24af725f2e823dfcc325101cec604e422566ba5ce4ca4bd5bc8c ]  [ 03046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e ] 2 checkmultisig",
                    "n" : "2",
                    "public-keys" : 
                    [
                        "0200e5782241ce24af725f2e823dfcc325101cec604e422566ba5ce4ca4bd5bc8c",
                        "03046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e"
                    ],
                    "self-publickey" : "03046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e"
                }
            ]
        }
    }
    ```
    ***
* ### `signmultisigtx`
    signmultisigtx
    * Parameters (optional)
    1. `-b` or `[--broadcast]` Broadcast the tx if it is fullly signed.
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
    1. `hex` - The Base16 transaction.

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"signmultisigtx",
    "params":["test", "123456",  "02000000016164c4ccd70b57a9d7b956d63bf0d0c9bccb72cfaba49891fa9e833adacb65a4010000009300483045022100b78987209417d81ffad5d45719e8a78a5730b6b8e22b98c73b6ca927a001fe6b022004b48edf88370fa001ae9423561762cbdd489b619ab82fcab64852e08358c7b0014c4752210200e5782241ce24af725f2e823dfcc325101cec604e422566ba5ce4ca4bd5bc8c2103046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e52aeffffffff0264000000000000001976a91404a31ae84a152ca773728761b7260726d8aeff8c88ac0100000000000000b83701000000000017a91409594fe3a84e3de95831d2474ca3ca29d2f9053d87010000000000000000000000"],"id":7}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 7, 
        "result":
        {
            "hex": "02000000016164c4ccd70b57a9d7b956d63bf0d0c9bccb72cfaba49891fa9e833adacb65a401000000db00473044022042ccd72c3ce0f7bc34d4507964d6442877165e9efd8c45ca1b3f2721331f48f102200e5c1402d2775e87d258aa60feac3d79b2ba377e6665104196ad9ca75dc1c30b01483045022100b78987209417d81ffad5d45719e8a78a5730b6b8e22b98c73b6ca927a001fe6b022004b48edf88370fa001ae9423561762cbdd489b619ab82fcab64852e08358c7b0014c4752210200e5782241ce24af725f2e823dfcc325101cec604e422566ba5ce4ca4bd5bc8c2103046e1c2777cfa064932a2f4c12f8dd307c1702c9cd77d14c48daf134627e355e52aeffffffff0264000000000000001976a91404a31ae84a152ca773728761b7260726d8aeff8c88ac0100000000000000b83701000000000017a91409594fe3a84e3de95831d2474ca3ca29d2f9053d87010000000000000000000000"
        }
    }
    ```
