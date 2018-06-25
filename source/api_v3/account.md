title: account
comments: false
---

## Description
***

## API Methods 
***

* ### `getnewaccount`
    Generate a new account from this wallet.
    * Parameters (optional)
    1. `-l` or `[--language]` Options are 'en', 'es', 'ja', 'zh_Hans', 'zh_Hant' and 'any', defaults to 'en'.
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
    1. `mnemonic` - the master private key of your account
    2. `default-address` - address of the account

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"3.0","method":"getnewaccount",
    "params":["test", "123456", {"language": "en"}],"id":7}'

    // Response
    {
        "jsonrpc": "3.0", 
        "id": 7, 
        "result": {
            "mnemonic": "actor slam shove essence person between lucky harsh myself hole tomorrow sausage buddy young kitten motor traffic rare wisdom month payment drill vanish oval", 
            "default-address": "MDtdyESeZB73RCYR1G4b7443ModzGwYWrF"
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
    curl -X POST --data '{"jsonrpc":"3.0","method":"getnewaddress",
    "params":["test", "123456", {"number": 2}],"id":8}'

    // Response
    {
        "jsonrpc": "3.0", 
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
    curl -X POST --data '{"jsonrpc":"3.0","method":"listaddresses",
    "params":["test", "123456"],"id":11}'

    // Response
    {
        "jsonrpc": "3.0", 
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
    1. `address-type` - address type
    2. `is-valid` - the address is valid or not
    3. `message` - message like "valid address"
    4. `test-net` - if the address is in test-net

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"3.0","method":"validateaddress",
    "params":["MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2"],"id":16}'

    // Response
    {
        "jsonrpc": "3.0", 
        "id": 16, 
        "result":
        {
            "address-type" : "p2kh(test-net)",
            "is-valid" : true,
            "message" : "valid address ",
            "test-net" : true
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
    3. `hd_index` - how many addresses generated.
    4. `address` - address list

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"3.0","method":"importaccount",
    "params":["mother ride despair impose degree truck pet scrub mind art brain galaxy sadness cover crater waste arrest invest hip crush loan brisk pave cheap",
    {"accountname":"test","password":"123456","hd_index":3,"language":"en"}],"id":9}'

    // Response
    {
        "jsonrpc": "3.0", 
        "id": 9, 
        "result": {
            "mnemonic": "mother ride despair impose degree truck pet scrub mind art brain galaxy sadness cover crater waste arrest invest hip crush loan brisk pave cheap", 
            "addresses": [
                "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV", 
                "MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2", 
                "MS9m8zpVPkDYAXhmeHmhE3TgJugP3zHtAL"
            ], 
            "name": "test", 
            "hd_index": 3
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
    curl -X POST --data '{"jsonrpc":"3.0","method":"importkeyfile",
    "params":["test", "123456", "~/.metaverse/mvs-test.json"],"id":10}'

    // Response
    {
        "jsonrpc": "3.0", 
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
    curl -X POST --data '{"jsonrpc":"3.0","method":"dumpkeyfile",
    "params":["test", "123456", "lastword", "~/.metaverse/"],"id":4}'

    // Response
    {
        "jsonrpc": "3.0", 
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
    curl -X POST --data '{"jsonrpc":"3.0","method":"changepasswd",
    "params":["test", "123456", {"password": "test123456"}],"id":1}'

    // Response
    {
        "jsonrpc": "3.0", 
        "id": 1, 
        "result":
        {
            "name": "test",
            "status": "password changed"
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
    curl -X POST --data '{"jsonrpc":"3.0","method":"deleteaccount",
    "params":["test", "123456", "lastword"],"id":2}'

    // Response
    {
        "jsonrpc": "3.0", 
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
    2. `mnemonic-key` - master private key
    3. `address-count` - addresses created
    4. `user-status` - 0:locked, 2: normal

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"3.0","method":"getaccount",
    "params":["test", "123456", "lastword"],"id":5}'

    // Response
    {
        "jsonrpc": "3.0", 
        "id": 5, 
        "result": {
            "user-status": "2", 
            "name": "test", 
            "mnemonic-key": "mother ride despair impose degree truck pet scrub mind art brain galaxy sadness cover crater waste arrest invest hip crush loan brisk pave cheap", 
            "address-count": "2"
        }
    }
    ```
***

