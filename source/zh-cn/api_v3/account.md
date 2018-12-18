title: account
comments: false
---

## Description
***

## API Methods 
***

* ### `getnewaccount`
    Generate a new account from this wallet if account is specified.
    Generate a new address and private key if account is not specified.
    * Parameters (optional)
    1. `-l` or `[--language]` Options are 'en', 'es', 'ja', 'zh_Hans', 'zh_Hant' and 'any', defaults to 'en'.
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name, default "".
    2. `ACCOUNTAUTH` Account password/authorization, default "".
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH"
    ]
     ```
    * Returns
    `Object` - 
    1. `mnemonic` - the master private key of your account
    2. `default_address` - address of the account

    * Example: generate a new account
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"getnewaccount",
    "params":["test", "123456", {"language": "en"}],"id":7}' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "jsonrpc" : "2.0", 
        "id": 7, 
        "result": {
            "name": "test",
            "mnemonic": "actor slam shove essence person between lucky harsh myself hole tomorrow sausage buddy young kitten motor traffic rare wisdom month payment drill vanish oval", 
            "addresses": 
            [
                "MDtdyESeZB73RCYR1G4b7443ModzGwYWrF"
            ]
        }
    }
    ```
    
    * Example: generate a new address and private key.
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"getnewaccount",
    "params":[{"language": "en"}],"id":7}' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "address" : "MLycTCqV9BiQrfnRPxi6AFBLC7m1cG6btQ",
            "mnemonic" : "deal elite opinion exhaust shop usage habit hard muscle glimpse want matter brain shoot uncle insect corn glare depth asthma move input person pill",
            "private_key" : "76fb26353250f00529c51362411a517b4d005d72fe33e5ccea28eaab3b33f8ac",
            "public_key" : "03643ceeab22462641c5259bfcb7a7898b23b9fbbf5360eb35b3df86eba24522c9",
            "wif" : "L1CzdkB3f2gRS2NtZUe2fGubzGMYZAWPqbyXNiKC7c9w9Z6F6gHC"
        }
    }
    ```

***

* ### `getnewaddress`
    Generate new address for this account.
    * Parameters (optional)
    1. `-n` or `[--number]` The address count.
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
    `Array` - return a list of new address

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"getnewaddress",
    "params":["test", "123456", {"number": 2}],"id":8}' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "jsonrpc" : "2.0", 
        "id": 8, 
        "result": [
            "MM6VxRZ9b1GzbapkVCnWwqo3gbe5sDgf9G", 
            "MDuwgNWVp4rHGLcDRro7joees9Z75s9o9X"
        ]
    }
    ```

***

* ### `listaddresses`
    List available addresses of this account.
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
    `Array` - return the list of generated address

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"listaddresses",
    "params":["test", "123456"],"id":11}' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "jsonrpc" : "2.0", 
        "id": 11, 
        "result": [
            "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV", 
            "MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2"
        ]
    }
    ```
***

* ### `validateaddress`
    validate address
    * Parameters (positional)
    1. `ADDRESS` address
    ```js
    params:[
        "ADDRESS"
    ]
     ```
    * Returns
    `Object` -
    1. `address_type` - address type
    2. `is_valid` - the address is valid or not
    3. `message` - message like "valid address"
    4. `testnet` - if the address is in test-net

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"validateaddress",
    "params":["MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2"],"id":16}' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "jsonrpc" : "2.0", 
        "id": 16, 
        "result":
        {
            "address_type" : "p2kh(test-net)",
            "is_valid" : true,
            "message" : "valid address ",
            "testnet" : true
        }
    }
    ```
***

* ### `importaccount`
    importaccount
    * Parameters (optional)
    1. `-i` or `[--hd_index]` Teh HD index for the account.
    2. `-l` or `[--language]` The language identifier of the dictionary of the mnemonic. Options are 'en', 'es', 'ja', 'zh_Hans', 'zh_Hant' and 'any', defaults to 'any'.
    3. `-n` or `[--accountname]` Account name.
    4. `-p` or `[--password]` Account password.
    * Parameters (positional)
    1. `WORD` The set of words that that make up the mnemonic. If not specified the words are read from STDIN.
    ```js
    params:[
        "WORD"
    ]
     ```
    * Returns
    `Object` - 
    1. `name` - account name.
    2. `mnemonic` - master private key
    3. `addresses` - address list

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"importaccount",
    "params":["mother ride despair impose degree truck pet scrub mind art brain galaxy sadness cover crater waste arrest invest hip crush loan brisk pave cheap",
    {"accountname":"test","password":"123456","hd_index":3,"language":"en"}],"id":9}' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "jsonrpc" : "2.0", 
        "id": 9, 
        "result": {
            "mnemonic": "mother ride despair impose degree truck pet scrub mind art brain galaxy sadness cover crater waste arrest invest hip crush loan brisk pave cheap", 
            "addresses": [
                "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV", 
                "MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2", 
                "MS9m8zpVPkDYAXhmeHmhE3TgJugP3zHtAL"
            ], 
            "name": "test"
        }
    }
    ```

***

* ### `importkeyfile`
    import account from file
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization. This is also used to decrypt the keyfile.
    3. `FILE` key file path.
    4. `FILECONTENT` key file content. This will omit the `FILE` argument if specified.
    ```js
    params:[
        "ACCOUNTNAME",
        "ACCOUNTAUTH",
        "FILE",
        "FILECONTENT"
    ]
     ```
    * Returns
    `null` - 

    * Example
    ```js
    // import key file by file path
    curl -X POST --data '{"jsonrpc":"2.0","method":"importkeyfile",
    "params":["test", "123456", "~/.metaverse/mvs-test.json"],"id":10}' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "jsonrpc" : "2.0", 
        "id": 10, 
        "result": null
    }

    ```

***

* ### `dumpkeyfile`
    export account as file, file name is `mvs_keystore_$accountname.json`.
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization. This is also used to encrypt the keyfile.
    3. `LASTWORD` The last word of your master private-key phrase.
    4. `DESTINATION` account info storage file directory, **optional, default to ~/.metaverse/mvs-htmls/keys/**
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "LASTWORD", 
        "DESTINATION"
    ]
     ```
    * Returns
    `String` - 

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"dumpkeyfile",
    "params":["test", "123456", "lastword", "~/.metaverse/"],"id":4}' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "jsonrpc" : "2.0", 
        "id": 4, 
        "result": "~/.metaverse/mvs_keystore_test.json"
    }
    ```

***

* ### `changepasswd`
    changepasswd
    * Parameters (optional)
    1. `-p` or `[--password]` New password/authorization.
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
    1. `name` - account name
    2. `status` - operation status

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"changepasswd",
    "params":["test", "123456", {"password": "test123456"}],"id":1}' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "jsonrpc" : "2.0", 
        "id": 1, 
        "result":
        {
            "name": "test",
            "status": "changed successfully"
        }
    }
    ```
***

* ### `deleteaccount`
    deleteaccount
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `LASTWORD` The last word of your private-key phrase.
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "LASTWORD"
    ]
     ```
    * Returns
    `Object` -
    1. `name` - account name
    2. `status` - operation status

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"deleteaccount",
    "params":["test", "123456", "lastword"],"id":2}' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "jsonrpc" : "2.0", 
        "id": 2, 
        "result":
        {
            "name": "test",
            "status": "removed successfully"
        }
    }
    ```
***

* ### `getaccount`
    Show account details
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `LASTWORD` The last word of your master private-key phrase.
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "LASTWORD"
    ]
     ```
    * Returns
    `Object` - 
    1. `name` - account name
    2. `mnemonic` - master private key
    3. `address_count` - addresses created
    4. `user_status` - 0:locked, 2: normal

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"getaccount",
    "params":["test", "123456", "lastword"],"id":5}' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "jsonrpc" : "2.0", 
        "id": 5, 
        "result": {
            "name": "test", 
            "mnemonic": "mother ride despair impose degree truck pet scrub mind art brain galaxy sadness cover crater waste arrest invest hip crush loan brisk pave cheap", 
            "address_count": "2"
        }
    }
    ```
***

* ### `getpublickey`
    Show public key of address
    * Parameters (positional)
    1. `ACCOUNTNAME` Account name.
    2. `ACCOUNTAUTH` Account password/authorization.
    3. `ADDRESS` Address.
    ```js
    params:[
        "ACCOUNTNAME", 
        "ACCOUNTAUTH", 
        "ADDRESS"
    ]
     ```
    * Returns
    `Object` - string

    * Example
    ```js
    // Request
    curl -X POST --data '{
        "jsonrpc":"2.0",
        "method":"getpublickey",
        "id":5,
        "params":[
            "test", 
            "123456", 
            "MLTxV5JAu5sFhQmJYNRmPuu31CkNWrF5rj"
        ]
    }' http://127.0.0.1:8820/rpc/v3

    // Response
    {
        "id" : 5,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "address" : "MLTxV5JAu5sFhQmJYNRmPuu31CkNWrF5rj",
            "public_key" : "031c7ac7f12a05ea4952289801fa52142aa421f11efe8ab7090fb823562156a321"
        }
    }
    ```***