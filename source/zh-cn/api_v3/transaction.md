title: transaction
comments: false
---

## Description
***

## API Methods 
***

* ### `gettx`
    get transaction
    * Parameters (optional)
    1. `json`    use json format or not, default is true, that is '--json=true'
    * Parameters (positional)
    1. `HASH` The Base16 transaction hash of the transaction to get. If not specified the transaction hash is read from STDIN.
    ```js
    params:[
        "HASH"
    ]
     ```
    * Returns
    `Object` - get the transaction

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"gettx",
    "params":["18908d2035f40a9d4f1e07c1a3f16ace0882afbd31a7dfa3176843dd620abe9d"],"id":31}' http://127.0.0.1:8820/rpc/v3

    // Response
	{
	    "id" : 31,
	    "jsonrpc" : "2.0",
	    "result" :
	    {
	        "hash" : "18908d2035f40a9d4f1e07c1a3f16ace0882afbd31a7dfa3176843dd620abe9d",
	        "height" : 953885,
	        "inputs" :
	        [
	            {
	                "address" : "MPVYH9GQGZkJc4rZ4ZEx9bnV1mpa3M4whw",
	                "previous_output" :
	                {
	                    "hash" : "f8989c69d31fb89b5e12b3db77001c7b5efe5ff80b145c54c9796dc177b66fde",
	                    "index" : 1
	                },
	                "script" : "[ 3044022043f451073b3d4a9b6143b57528b948e65dc36b0b7cd858649cbe75b8ca75a0100220210d7e7c8228de201fd638018fe387aba5be5fa03a273c352a762e9afcc62f5201 ] [ 03983bb61d98bb5dad52704c7af2307206a5f32e281568951f5f61951e48fca4e0 ]",
	                "sequence" : 4294967295
	            },
	            {
	                "address" : "MPVYH9GQGZkJc4rZ4ZEx9bnV1mpa3M4whw",
	                "previous_output" :
	                {
	                    "hash" : "aab42e1405074db7ce6ed42cfdc5e82c955c8cd6c567b85da2cd134a34a37e49",
	                    "index" : 1
	                },
	                "script" : "[ 3045022100a9ccdb9b2b2d22cd178e9d7ef52b6ebcffeace08a0ea2f190ef0a972dc6df0eb022038478d7c32f8af6cc5dda18f3c56d2b0cf0c5bc700173f592e6ed2123dd3513101 ] [ 03983bb61d98bb5dad52704c7af2307206a5f32e281568951f5f61951e48fca4e0 ]",
	                "sequence" : 4294967295
	            }
	        ],
	        "lock_time" : "0",
	        "outputs" :
	        [
	            {
	                "address" : "MKqn6gE6UomFfX9HfYiapYr458Lt4wfLiH",
	                "attachment" :
	                {
	                    "type" : "etp"
	                },
	                "index" : 0,
	                "locked_height_range" : 0,
	                "script" : "dup hash160 [ 82fdc906c8859ee8e404be293f4c72178a389342 ] equalverify checksig",
	                "value" : 100013238
	            },
	            {
	                "address" : "MPVYH9GQGZkJc4rZ4ZEx9bnV1mpa3M4whw",
	                "attachment" :
	                {
	                    "type" : "etp"
	                },
	                "index" : 1,
	                "locked_height_range" : 0,
	                "script" : "dup hash160 [ ab0a6ee4f60b83219661ed326c9751a7119689b1 ] equalverify checksig",
	                "value" : 20839206
	            }
	        ],
	        "version" : "2"
	    }
	}

    ```

***

* ### `listtxs`
    List transactions details of this account.
    * Parameters (optional)
    1. `-a` or `[--address]` Address.
    2. `-e` or `[--height]` Get tx according height. eg: -e start-height:end-height will return tx between [start-height, end-height)
    3. `-i` or `[--index]` Page index.
    4. `-l` or `[--limit]` Transaction count per page.
    5. `-s` or `[--symbol]` Asset symbol.
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
    `Object` - return transactions

    * Example
    ```js
    // Request
    curl -X POST --data '{"jsonrpc":"2.0","method":"listtxs",
    "params":["chenhao", "chenhaopassword",{"height":"919599:920046"}],"id":31}' http://127.0.0.1:8820/rpc/v3

    // Response
	{
	    "id" : 31,
	    "jsonrpc" : "2.0",
	    "result" :
	    {
	        "current_page" : 1,
	        "total_page" : 1,
	        "transaction_count" : 5,
	        "transactions" :
	        [
	            {
	                "direction" : "send",
	                "hash" : "ab0171faab87b6d9c59594290f14c2d697c83282ad22d74f6570dbf111145d7f",
	                "height" : 920045,
	                "inputs" :
	                [
	                    {
	                        "address" : "MUWMPV8GdY7m32JeMCwsstVEj76G7TTy76",
	                        "script" : "[ 3044022046a59624186f1ad8c02511b49f2e55ec289228d2cb05398979dbf293385a0ebe02201ea44c39ab8d1d56faf70dce35b7f327b147ff31ad3370025024a9e5a4f2eef201 ] [ 02d7a8d34992289c0c6865386502e2e507cf6c5c18762b18d52ac3c968ecc8f663 ]"
	                    }
	                ],
	                "outputs" :
	                [
	                    {
	                        "address" : "MCHW3fxKYoCJWWU1g8z2kifb82t3BvAWNh",
	                        "attachment" :
	                        {
	                            "type" : "etp"
	                        },
	                        "etp_value" : 20000000000,
	                        "locked_height_range" : 0,
	                        "own" : false,
	                        "script" : "dup hash160 [ 301a31d2e18aec13e32967c6af011138e50f49df ] equalverify checksig"
	                    },
	                    {
	                        "address" : "MUWMPV8GdY7m32JeMCwsstVEj76G7TTy76",
	                        "attachment" :
	                        {
	                            "type" : "etp"
	                        },
	                        "etp_value" : 35099948644,
	                        "locked_height_range" : 0,
	                        "own" : true,
	                        "script" : "dup hash160 [ e20a6312ddf0715d7c1cbb00ab91d8cd7b44862c ] equalverify checksig"
	                    }
	                ],
	                "timestamp" : 1517645530
	            },
	            {
	                "direction" : "send",
	                "hash" : "c4220bcc529c1bf13f1e38967834550fc07082cc1e03991314a200e513807d6c",
	                "height" : 919624,
	                "inputs" :
	                [
	                    {
	                        "address" : "MUWMPV8GdY7m32JeMCwsstVEj76G7TTy76",
	                        "script" : "[ 3044022000ee885212184956575256a9c06c4f679523ba292a157fb998838bb18eefd19b022061e496d08f30fde7b33c909df96f9b3c42bc86251afa302774eaa6c3b02fc0ea01 ] [ 02d7a8d34992289c0c6865386502e2e507cf6c5c18762b18d52ac3c968ecc8f663 ]"
	                    }
	                ],
	                "outputs" :
	                [
	                    {
	                        "address" : "MMV59KXgVkuceP4BGc8T8thn93gRXbTFdV",
	                        "attachment" :
	                        {
	                            "type" : "etp"
	                        },
	                        "etp_value" : 15000000000,
	                        "locked_height_range" : 0,
	                        "own" : false,
	                        "script" : "dup hash160 [ 950387d28bd76529bbdd403925969817cdb392c5 ] equalverify checksig"
	                    },
	                    {
	                        "address" : "MUWMPV8GdY7m32JeMCwsstVEj76G7TTy76",
	                        "attachment" :
	                        {
	                            "type" : "etp"
	                        },
	                        "etp_value" : 55099958644,
	                        "locked_height_range" : 0,
	                        "own" : true,
	                        "script" : "dup hash160 [ e20a6312ddf0715d7c1cbb00ab91d8cd7b44862c ] equalverify checksig"
	                    }
	                ],
	                "timestamp" : 1517631170
	            },
	            {
	                "direction" : "send",
	                "hash" : "c7133738c4de94e6b4a36dd4f3f7962fca7a85b5c1ccd9760fc74054d04a4183",
	                "height" : 919618,
	                "inputs" :
	                [
	                    {
	                        "address" : "MUWMPV8GdY7m32JeMCwsstVEj76G7TTy76",
	                        "script" : "[ 304402206e44e2795021307a6f953fe60e365e197f52ed7ad758c4cf837fcb6782fe0fdb022019f0da6dd1ea432dee73fccddc19064fce6b0f37e8b3f9bcaf41dd0867e808ab01 ] [ 02d7a8d34992289c0c6865386502e2e507cf6c5c18762b18d52ac3c968ecc8f663 ]"
	                    }
	                ],
	                "outputs" :
	                [
	                    {
	                        "address" : "MVdZ8z77BSCsY7xEy5cRqLzRLXUXa3xq5h",
	                        "attachment" :
	                        {
	                            "type" : "etp"
	                        },
	                        "etp_value" : 70000000000,
	                        "locked_height_range" : 0,
	                        "own" : false,
	                        "script" : "dup hash160 [ ee5f3ba0e887433b0ad12680d135b65f48f9e1d8 ] equalverify checksig"
	                    },
	                    {
	                        "address" : "MUWMPV8GdY7m32JeMCwsstVEj76G7TTy76",
	                        "attachment" :
	                        {
	                            "type" : "etp"
	                        },
	                        "etp_value" : 70099968644,
	                        "locked_height_range" : 0,
	                        "own" : true,
	                        "script" : "dup hash160 [ e20a6312ddf0715d7c1cbb00ab91d8cd7b44862c ] equalverify checksig"
	                    }
	                ],
	                "timestamp" : 1517631009
	            },
	            {
	                "direction" : "send",
	                "hash" : "6a461a212182aadc723dab8f2486a25bf5213534ad0927ddc838f481c1d0bac7",
	                "height" : 919609,
	                "inputs" :
	                [
	                    {
	                        "address" : "MUWMPV8GdY7m32JeMCwsstVEj76G7TTy76",
	                        "script" : "[ 30440220170b12db7f3471416460eb9254dacaee76de06fee37e93806d36645d92f715e0022049f3252bf26333a4a8ee1fe75ad93c41244d312fec9a3d51dbacbf7ca805cee601 ] [ 02d7a8d34992289c0c6865386502e2e507cf6c5c18762b18d52ac3c968ecc8f663 ]"
	                    }
	                ],
	                "outputs" :
	                [
	                    {
	                        "address" : "MUhsQpKGUVvsf1BNsf4xThrN3iWncP5nzA",
	                        "attachment" :
	                        {
	                            "type" : "etp"
	                        },
	                        "etp_value" : 40000000000,
	                        "locked_height_range" : 0,
	                        "own" : false,
	                        "script" : "dup hash160 [ e43806444753a7804961ec7cdbfd8bafd25bb037 ] equalverify checksig"
	                    },
	                    {
	                        "address" : "MUWMPV8GdY7m32JeMCwsstVEj76G7TTy76",
	                        "attachment" :
	                        {
	                            "type" : "etp"
	                        },
	                        "etp_value" : 140099978644,
	                        "locked_height_range" : 0,
	                        "own" : true,
	                        "script" : "dup hash160 [ e20a6312ddf0715d7c1cbb00ab91d8cd7b44862c ] equalverify checksig"
	                    }
	                ],
	                "timestamp" : 1517630810
	            },
	            {
	                "direction" : "send",
	                "hash" : "aefffc1c52786d8ba278727448608e3325e91b6eef2d7b7f452c1184e42fd730",
	                "height" : 919599,
	                "inputs" :
	                [
	                    {
	                        "address" : "MUWMPV8GdY7m32JeMCwsstVEj76G7TTy76",
	                        "script" : "[ 30440220620b7afe9483a4c809e70786096c7cb62901b5308ac7afaf90d46808397fd8a4022014a5e180db28c78b4012d678ca5896385a47fea54cb64c31affc300af72735e601 ] [ 02d7a8d34992289c0c6865386502e2e507cf6c5c18762b18d52ac3c968ecc8f663 ]"
	                    }
	                ],
	                "outputs" :
	                [
	                    {
	                        "address" : "MDGr9HfS8ramoiXQ5jJUe6THTJypbqwtqL",
	                        "attachment" :
	                        {
	                            "type" : "etp"
	                        },
	                        "etp_value" : 30000000000,
	                        "locked_height_range" : 0,
	                        "own" : false,
	                        "script" : "dup hash160 [ 3af2ae30896bebafa32e338662b20e91061b2250 ] equalverify checksig"
	                    },
	                    {
	                        "address" : "MUWMPV8GdY7m32JeMCwsstVEj76G7TTy76",
	                        "attachment" :
	                        {
	                            "type" : "etp"
	                        },
	                        "etp_value" : 180099988644,
	                        "locked_height_range" : 0,
	                        "own" : true,
	                        "script" : "dup hash160 [ e20a6312ddf0715d7c1cbb00ab91d8cd7b44862c ] equalverify checksig"
	                    }
	                ],
	                "timestamp" : 1517630478
	            }
	        ]
	    }
	}

    ```
***

