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

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"createmultisigtx","params":["test", "123456", "MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2", "MBVDxEdhpyA1SvAnFhRxuUmsh5TsaURieV", "100000000000"],"id":45}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 45, 
        "error": {
            "message": "from address is not script address.", 
            "code": 4015
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
    curl -X POST --data '{"jsonrpc":"2.0","method":"deletemultisig","params":["test", "123456", "MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2"],"id":46}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 46, 
        "error": {
            "message": "MEhwjsxeqVwPzWFqxzAPcFqnh3HSdgUuS2 multisig record not found.", 
            "code": 5203
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
    curl -X POST --data '{"jsonrpc":"2.0","method":"getnewmultisig","params":["test", "123456"],"id":47}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 47, 
        "error": {
            "message": "the option '--publickeynum' is required but missing", 
            "code": 1021
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

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"listmultisig","params":["test", "123456"],"id":48}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 48, 
        "result": {
            "multisig": ""
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

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"signmultisigtx","params":["test", "123456", "TRANSACTION"],"id":49}'

    // Response
    {
        "jsonrpc": "2.0", 
        "id": 49, 
        "error": {
            "message": "the argument ('TRANSACTION') for option '--TRANSACTION' is invalid", 
            "code": 1021
        }
    }
    ```
