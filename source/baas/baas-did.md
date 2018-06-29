title: DID Micro Service
---

## Introduction
DID micro service provides API for exchanges to allow their customers to register DID and bind DID to customer's wallet.

Exchanges can implement the same feature according to this documemt.

Related MVS commands:
> getnewaddress  
> registerdid  
> didchangeaddress  
> getdid  
> getpublickey  
> getnewmultisig  
> sendrawtx  
> send  

For details of these command, please refer to [API Document](https://docs.mvs.org/zh-cn/api_v2/)。

## User Case
In the following user case, two actors are involed exchange and user `Alice`。

### User requests registering an DID
`Alice` request registering an DID named `Alias@Alice` on exchange's website or app.

### Exchange registers DID
Exchange generates a new address by `getnewaddress` and registers DID named `Alias@Alice` to it.

### User binds DID to user's wallet

1. Generate multi-signature address  
Exchange and `Alice` get public-key of an address of their account by `getpublickey`. Exchange and `Alice` swap the public-keys and generate multi-signature addresses by `getnewmultisig` with the public-keys and parameter `m:n` valued `1:2`.

2. Exchange transfers DID to the multi-signature address  
Exchange creates a transcation by `didchangeaddress` to transfer DID named `Alias@Alice` to the multi-signature address. Exchange broadcasts the transcation by `sendrawtx`.

3. User transfers DID from the multi-signature address to wallet  
`Alice` creates a transcation by `didchangeaddress` to transfer DID named `Alias@Alice` from the multi-signature address. `Alice` broadcasts the transcation by `sendrawtx`.

4. Confirmation  
`Alice` confirms the result by `getdid`.

## DID micro service
DID micro service provides API for exchanges to process the business logics above.

1. Exchange registers DID  
Exchange generates a new address by `getnewaddress` and registers DID to it. Exchange saves user's account ID, DID name and address by micro service api `savedid`.

2. Exchange generates a multi-signature address  
Exchange queries DID name and address with user's account ID by micro service api `querydid` when user requests binding DID to user's wallet. Exchange gets the public key of DID address by `getpublickey`. After exchange and user swaps their public-keys, exchange generates a multi-signature addresses by `getnewmultisig`.

4. Exchange tansfers DID to the multi-signature address  
Exchange creates a transcation by `didchangeaddress` to transfer DID to the multi-signature address. Exchange broadcasts the transcation by `sendrawtx`.

## Implementation

### User requests registering an DID
`Alice` request registering an DID named `Alias@Alice` on exchange's website or app.

### Exchange registers DID
1. Exchange generates a new address `MLTxV5JAu5sFhQmJYNRmPuu31CkNWrF5rj` by `getnewaddress`.  
    ```js
    // Request
    curl -X POST --data '{
        "jsonrpc":"2.0",
        "id":8, 
        "method":"getnewaddress",
        "params":[
            "Exchange", 
            "exchangepwd", 
            {
                "number": 1
            }
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 8,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "addresses" : 
            [
                "MLTxV5JAu5sFhQmJYNRmPuu31CkNWrF5rj"
            ]
        }
    }
    ```

2. Exchange sends `100000000` satoshi(`1 ETP`) to the new address as fee of registering DID.  
    ```js
    // Request
    curl -X POST --data '{
        "id":125,
        "jsonrpc":"2.0",
        "method":"send",
        "params":[
            "Exchange", 
            "exchangepwd", 
            "MLTxV5JAu5sFhQmJYNRmPuu31CkNWrF5rj",
            "100000000"
        ]
    }' 127.0.0.1:8820/rpc/v2

    // Response
    {
        // omit...
    }
    ```

3. Exchange registers DID named `Alias@Alice` to the new address by `registerdid`.  
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"registerdid",
        "params":[
            "Exchange", 
            "exchangepwd", 
            "MLTxV5JAu5sFhQmJYNRmPuu31CkNWrF5rj",
            "Alias@Alice"
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
                "hash" : "c350ab69320dc07f7157ae53f82b12c0a0fabafd0c9a381591de22cd24401b7f",
                "inputs" : 
                [
                    {
                        "address" : "MLTxV5JAu5sFhQmJYNRmPuu31CkNWrF5rj",
                        "previous_output" : 
                        {
                            "hash" : "9a3e19510089fdc14dd3f0a5e8d252b9271dddfbc41651936bac6c406b8ad15c",
                            "index" : 0
                        },
                        "script" : "[ 304402205f2b347ded297c384f4b28187d41abafd46f254fbac18f856d5e7337f8e83ef202206775b25a9f5820689dae59df0789e7fd5787a68238914e0ac70504d47e1ad0ba01 ] [ 031c7ac7f12a05ea4952289801fa52142aa421f11efe8ab7090fb823562156a321 ]",
                        "sequence" : 4294967295
                    }
                ],
                "lock_time" : "0",
                "outputs" : 
                [
                    {
                        "address" : "MLTxV5JAu5sFhQmJYNRmPuu31CkNWrF5rj",
                        "attachment" : 
                        {
                            "address" : "MLTxV5JAu5sFhQmJYNRmPuu31CkNWrF5rj",
                            "symbol" : "Alias@Alice",
                            "type" : "did-register"
                        },
                        "index" : 0,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 89d56e08bdbcfe40eb7f3b34fe21253669c828b1 ] equalverify checksig",
                        "value" : 0
                    },
                    {
                        "address" : "MGqHvbaH9wzdr6oUDFz4S1HptjoKQcjRve",
                        "attachment" : 
                        {
                            "type" : "etp"
                        },
                        "index" : 1,
                        "locked_height_range" : 0,
                        "script" : "dup hash160 [ 61fde3bd4e6955c99b16de2d71e2a369888a1c0b ] equalverify checksig",
                        "value" : 80000000
                    }
                ],
                "version" : "4"
            }
        }
    }
    ```

4. Exchange saves user's account ID, DID name and address by micro service api `savedid`.

### User transfers DID to wallet
1. Exchange queries DID `Alias@Alice` and address `MLTxV5JAu5sFhQmJYNRmPuu31CkNWrF5rj` with user's account ID by micro service api `querydid` when user requests binding DID to user's wallet.

2. Exchange gets the public-key `031c7ac7f12a05ea4952289801fa52142aa421f11efe8ab7090fb823562156a321` of address `MLTxV5JAu5sFhQmJYNRmPuu31CkNWrF5rj` by `getpublickey`. Exchange displays the public-key to `Alice` and `Alice` records it to generate a multi-signature address later.
    ```js
    // Request
    curl -X POST --data '{
        "jsonrpc":"2.0",
        "method":"getpublickey",
        "id":5,
        "params":[
            "Exchange", 
            "exchangepwd", 
            "MLTxV5JAu5sFhQmJYNRmPuu31CkNWrF5rj"
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 5,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "address" : "MLTxV5JAu5sFhQmJYNRmPuu31CkNWrF5rj",
            "public-key" : "031c7ac7f12a05ea4952289801fa52142aa421f11efe8ab7090fb823562156a321"
        }
    }
    ```

3. `Alice` gets the public-key `0344befcd59670651a6441c00ef26caa104bab8ff9e5ec3f6e9b65bac9194cad0a` of address that DID binds to  by `getpublickey`. `Alice` commits this public-key to exchange.
    ```js
    // Request
    curl -X POST --data '{
        "jsonrpc":"2.0",
        "method":"getpublickey",
        "id":5,
        "params":[
            "Alice", 
            "alicepwd", 
            "MSqhPipeAZ1Ua9GfNbBi65RPdT7x4iHvwF"
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 5,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "address" : "MSqhPipeAZ1Ua9GfNbBi65RPdT7x4iHvwF",
            "public-key" : "0344befcd59670651a6441c00ef26caa104bab8ff9e5ec3f6e9b65bac9194cad0a"
        }
    }
    ```

4. Generate multi-signature address  
Now, both exchange and `Alice` have enough information to generate multi-signature address. They generate the same multi-signature address by `getnewmultisig` with public-keys and parament `m:n` valued `1:2`.    
* Exchange generates a multi-signature address `35ZW2TFThaK96DzwRwrfq5SRH2u7zfKTCF`:  
    ```js
    curl -X POST --data '{
        "id":7,
        "jsonrpc":"2.0",
        "method":"getnewmultisig",
        "params":[
            "Exchange", 
            "exchangepwd", 
            {
                "publickey": [
                    "0344befcd59670651a6441c00ef26caa104bab8ff9e5ec3f6e9b65bac9194cad0a"
                ],
                "selfpublickey": "031c7ac7f12a05ea4952289801fa52142aa421f11efe8ab7090fb823562156a321",
                "signaturenum": 1,
                "publickeynum": 2
            }
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "address" : "35ZW2TFThaK96DzwRwrfq5SRH2u7zfKTCF",
            "description" : "",
            "index" : 1,
            "m" : 1,
            "multisig-script" : "1 [ 031c7ac7f12a05ea4952289801fa52142aa421f11efe8ab7090fb823562156a321 ]  [ 0344befcd59670651a6441c00ef26caa104bab8ff9e5ec3f6e9b65bac9194cad0a ] 2 checkmultisig",
            "n" : 2,
            "public-keys" : 
            [
                "031c7ac7f12a05ea4952289801fa52142aa421f11efe8ab7090fb823562156a321",
                "0344befcd59670651a6441c00ef26caa104bab8ff9e5ec3f6e9b65bac9194cad0a"
            ],
            "self-publickey" : "031c7ac7f12a05ea4952289801fa52142aa421f11efe8ab7090fb823562156a321"
        }
    }
    ```  
* `Alice` generates a multi-signature address `35ZW2TFThaK96DzwRwrfq5SRH2u7zfKTCF`:  
    ```js
    curl -X POST --data '{
        "id":7,
        "jsonrpc":"2.0",
        "method":"getnewmultisig",
        "params":[
            "Alice", 
            "alicepwd", 
            {
                "publickey": [
                    "031c7ac7f12a05ea4952289801fa52142aa421f11efe8ab7090fb823562156a321"
                ],
                "selfpublickey": "0344befcd59670651a6441c00ef26caa104bab8ff9e5ec3f6e9b65bac9194cad0a",
                "signaturenum": 1,
                "publickeynum": 2
            }
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 7,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "address" : "35ZW2TFThaK96DzwRwrfq5SRH2u7zfKTCF",
            "description" : "",
            "index" : 1,
            "m" : 1,
            "multisig-script" : "1 [ 031c7ac7f12a05ea4952289801fa52142aa421f11efe8ab7090fb823562156a321 ]  [ 0344befcd59670651a6441c00ef26caa104bab8ff9e5ec3f6e9b65bac9194cad0a ] 2 checkmultisig",
            "n" : 2,
            "public-keys" : 
            [
                "031c7ac7f12a05ea4952289801fa52142aa421f11efe8ab7090fb823562156a321",
                "0344befcd59670651a6441c00ef26caa104bab8ff9e5ec3f6e9b65bac9194cad0a"
            ],
            "self-publickey" : "0344befcd59670651a6441c00ef26caa104bab8ff9e5ec3f6e9b65bac9194cad0a"
        }
    }
    ```

5. Exchange transfers DID to the multi-signature address  
* Exchange sends `10000` satoshi(`0.0001 ETP`) to the multi-signature address as fee of transfering DID later.  
    ```js
    // Request
    curl -X POST --data '{
        "id":125,
        "jsonrpc":"2.0",
        "method":"send",
        "params":[
            "Exchange", 
            "exchangepwd", 
            "35ZW2TFThaK96DzwRwrfq5SRH2u7zfKTCF",
            "10000"
        ]
    }' 127.0.0.1:8820/rpc/v2

    // Response
    {
        // 略...
    }
    ```  
* Exchange creates a transcation by `didchangeaddress` to transfer DID `Alias@Alice` to the multi-signature address `35ZW2TFThaK96DzwRwrfq5SRH2u7zfKTCF`. Exchange broadcasts the transcation by `sendrawtx`.  
Exchange creates a transcation:  
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"didchangeaddress",
        "params":[
            "Exchange", 
            "exchangepwd", 
            "35ZW2TFThaK96DzwRwrfq5SRH2u7zfKTCF",
            "Alias@Alice"
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 25,
        "jsonrpc" : "2.0",
        "result" : "0400000002c3acf1058e8ae5341fed5b944fe86b83edecbadc5d386e6a968af6eff6378ae7000000009300483045022100c1cbb2235c057e3fac37d4884a3929009336978d5a1feba27acad3012d7e1f550220009a6385d42d28964ccc85c0416aa448933213875901c64695ac7e70b79f3c51014c475121031c7ac7f12a05ea4952289801fa52142aa421f11efe8ab7090fb823562156a321210344befcd59670651a6441c00ef26caa104bab8ff9e5ec3f6e9b65bac9194cad0a52aeffffffff7f1b4024cd22de9115389a0cfdbafaa0c0122bf853ae57717fc00d3269ab50c3000000006b483045022100f88ea6c345e1164e7bc2331ea11bf0bb795ad104b02b1da394d976751de378ba02203f02e841e27aae877ff1bcd22fd72737586539e3d40e3451661ac32ab686e7690121031c7ac7f12a05ea4952289801fa52142aa421f11efe8ab7090fb823562156a321ffffffff01000000000000000017a9142a74a23b4ed1bb90f575e73c0208106d37eb653a870100000004000000020000000b416c69617340416c6963652233355a573254465468614b3936447a775277726671355352483275377a664b54434600000000"
    }
    ```
* Exchange broadcasts the transcation:  
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"sendrawtx",
        "params":[
            "0400000002c3acf1058e8ae5341fed5b944fe86b83edecbadc5d386e6a968af6eff6378ae7000000009300483045022100c1cbb2235c057e3fac37d4884a3929009336978d5a1feba27acad3012d7e1f550220009a6385d42d28964ccc85c0416aa448933213875901c64695ac7e70b79f3c51014c475121031c7ac7f12a05ea4952289801fa52142aa421f11efe8ab7090fb823562156a321210344befcd59670651a6441c00ef26caa104bab8ff9e5ec3f6e9b65bac9194cad0a52aeffffffff7f1b4024cd22de9115389a0cfdbafaa0c0122bf853ae57717fc00d3269ab50c3000000006b483045022100f88ea6c345e1164e7bc2331ea11bf0bb795ad104b02b1da394d976751de378ba02203f02e841e27aae877ff1bcd22fd72737586539e3d40e3451661ac32ab686e7690121031c7ac7f12a05ea4952289801fa52142aa421f11efe8ab7090fb823562156a321ffffffff01000000000000000017a9142a74a23b4ed1bb90f575e73c0208106d37eb653a870100000004000000020000000b416c69617340416c6963652233355a573254465468614b3936447a775277726671355352483275377a664b54434600000000"
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 25,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "hash" : "a981e820071c852710c05bdb70ec2da0da0d877575947aedbcf3ff1d3b7f56c9"
        }
    }
    ```

6. `Alice` transfers DID from the multi-signature address   
`Alice` creates a transcation by `didchangeaddress` to transfer DID `Alias@Alice` from the multi-signature address `35ZW2TFThaK96DzwRwrfq5SRH2u7zfKTCF`. `Alice` broadcasts the transcation by `sendrawtx`.  
* `Alice` creates a transcation:  
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"didchangeaddress",
        "params":[
            "Alice", 
            "alicepwd", 
            "MSqhPipeAZ1Ua9GfNbBi65RPdT7x4iHvwF",
            "Alias@Alice"
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 25,
        "jsonrpc" : "2.0",
        "result" : "0400000002c9567f3b1dfff3bced7a947575870ddaa02dec70db5bc01027851c0720e881a9000000009300483045022100adb80306458db15f8e82108f92a3ecf9d0dd221f89386b1d006a09b88dba243c022007a5198bb84f203b6a91bc2fcc7fd5413cfc0e7982dabdc89feb2f3a5cf3405c014c475121031c7ac7f12a05ea4952289801fa52142aa421f11efe8ab7090fb823562156a321210344befcd59670651a6441c00ef26caa104bab8ff9e5ec3f6e9b65bac9194cad0a52aeffffffffb6a654253b99292f7ce585fc718c0e28dbe730c79dded3eb373f9b51ce9ddd0e000000006a47304402205beb823ab2395e8ceecd1595327f3d1f8fe9bec12e6d1e71df94acf29d168bf502204152096109155468fd6f501e5494ac947fba2e7f313ec2b398e6b3aec5eeb59701210344befcd59670651a6441c00ef26caa104bab8ff9e5ec3f6e9b65bac9194cad0affffffff0200000000000000001976a914cfc2bcbdc96854fe00dbe86db689fd1ea918bdd888ac0100000004000000020000000b416c69617340416c696365224d53716850697065415a3155613947664e6242693635525064543778346948767746f07be111000000001976a914cfc2bcbdc96854fe00dbe86db689fd1ea918bdd888ac010000000000000000000000"
    }
    ```  
* `Alice` broadcasts the transcation:  
    ```js
    // Request
    curl -X POST -d '{
        "id":25,
        "jsonrpc":"2.0",
        "method":"sendrawtx",
        "params":[
            "0400000002c9567f3b1dfff3bced7a947575870ddaa02dec70db5bc01027851c0720e881a9000000009300483045022100adb80306458db15f8e82108f92a3ecf9d0dd221f89386b1d006a09b88dba243c022007a5198bb84f203b6a91bc2fcc7fd5413cfc0e7982dabdc89feb2f3a5cf3405c014c475121031c7ac7f12a05ea4952289801fa52142aa421f11efe8ab7090fb823562156a321210344befcd59670651a6441c00ef26caa104bab8ff9e5ec3f6e9b65bac9194cad0a52aeffffffffb6a654253b99292f7ce585fc718c0e28dbe730c79dded3eb373f9b51ce9ddd0e000000006a47304402205beb823ab2395e8ceecd1595327f3d1f8fe9bec12e6d1e71df94acf29d168bf502204152096109155468fd6f501e5494ac947fba2e7f313ec2b398e6b3aec5eeb59701210344befcd59670651a6441c00ef26caa104bab8ff9e5ec3f6e9b65bac9194cad0affffffff0200000000000000001976a914cfc2bcbdc96854fe00dbe86db689fd1ea918bdd888ac0100000004000000020000000b416c69617340416c696365224d53716850697065415a3155613947664e6242693635525064543778346948767746f07be111000000001976a914cfc2bcbdc96854fe00dbe86db689fd1ea918bdd888ac010000000000000000000000"
        ]
    }' http://127.0.0.1:8820/rpc/v2

    // Response
    {
        "id" : 25,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "hash" : "efbd03e1e25fb7b5a4b153bda5f7fe34bc1a8028f751ee14c93d3a398fa71d8d"
        }
    }
    ```

7. Confirmation  
`Alice` confirms the result by `getdid`.
    ```js
    // Request
    curl -X POST --data '{
        "jsonrpc":"2.0",
        "method":"getdid",
        "id":42,
        "params":["Alias@Alice"]
    }'  http://127.0.0.1:8820/rpc/v2/

    // Response
    {
        "id" : 42,
        "jsonrpc" : "2.0",
        "result" : 
        {
            "addresses" : 
            [
                {
                    "address" : "MSqhPipeAZ1Ua9GfNbBi65RPdT7x4iHvwF",
                    "status" : "current"
                },
                {
                    "address" : "35ZW2TFThaK96DzwRwrfq5SRH2u7zfKTCF",
                    "status" : "history"
                },
                {
                    "address" : "MLTxV5JAu5sFhQmJYNRmPuu31CkNWrF5rj",
                    "status" : "history"
                }
            ],
            "did" : "Alias@Alice"
        }
    }
    ```
