title: Transaction updation in MPC1
---

# MPC1 交易更新说明
以下示例数据均来自[测试网](https://explorer-testnet.mvs.org)。

## PoS 块
一个合法的 `PoS` 块的 `block_version` 为 2，块头中包含 `blocksig` 字段（该字段是矿工对整个块的签名），且至少包含一个 `coinbase` 交易与 `coinstake` 交易。
* `coinbase` 交易：与 `PoW` 块的 `coinbase` 结构完全一样，其`outputs`包含挖矿奖励。   
* `coinstake` 交易：其 `inputs` 为可以作为 `PoS` 权益证明的 `UTXO`，其 `outputs` 第一个为空 `output`，该空 `output` 以标识该交易为 `coinstake` 交易。  

示例：
测试网块高 [`1019574`](https://explorer-testnet.mvs.org/blk/1019574) 的 `PoS` 块构成如下所示：
```
{
    "bits" : "2760509629",
    "blocksig" : "38869496671253c154656992695dddabfdc565f5a94c288fc1924969a9fcba07531d86a879b37d85a43f8bdf5318ee2f9b471477c7983e44ea5e2fcad2a0eb2f",
    "hash" : "590fe4d061df5c02544b3b01b67b76c9170c9778e8e910f490e1a597f2a98b23",
    "merkle_tree_hash" : "5604e4303aa63ad85f89008da4c73871cbc2fc5f7b27db218827af2e52763687",
    "mixhash" : "0",
    "nonce" : "0",
    "number" : 1019574,
    "previous_block_hash" : "1be1e752fc1f2d3b2eaf306a17027abd0f5402c6064a6c04ffd595445c81fc86",
    "timestamp" : 1548214357,
    "transaction_count" : 2,
    "transactions" : 
    [
        {
            "hash" : "0ca5c0e285c180256b44eae94d570fc67366c52ed4fa62a4dd9e9c07e3eddc99",
            "inputs" : 
            [
                {
                    "previous_output" : 
                    {
                        "hash" : "0000000000000000000000000000000000000000000000000000000000000000",
                        "index" : 4294967295
                    },
                    "script" : "[ b68e0f ]",
                    "sequence" : 0
                }
            ],
            "lock_time" : "0",
            "outputs" : 
            [
                {
                    "address" : "tE9wL5d8YK94JgMHrV8HvK5pwb7tAqdHmn",
                    "attachment" : 
                    {
                        "type" : "etp"
                    },
                    "index" : 0,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 4f4e6201241b25f48183dda03f63229fecd2ba4d ] equalverify checksig",
                    "value" : 10754578
                }
            ],
            "version" : "1"
        },
        {
            "hash" : "c246e71b06e75c7d56b7120fda9c8344c45b0aaf4922e8bea8c7ff50b7e79d8e",
            "inputs" : 
            [
                {
                    "address" : "tE9wL5d8YK94JgMHrV8HvK5pwb7tAqdHmn",
                    "previous_output" : 
                    {
                        "hash" : "64337595f1a9538fffca3b892cd1bf0a69910ae505f5735533be778a39f54904",
                        "index" : 1
                    },
                    "script" : "[ 304402205ea27de31e85621d36e5f40aee3cce42639d81059910f2a8f58320f0413ad60d022066747e91635f9b95823d67175b7f5ba3b4e594265f58003fba736fc2ffbd808201 ] [ 026bd7e6d504f3737b930f9fc222dc519c147fb0f0a8ac0216458b637cab25427c ]",
                    "sequence" : 4294967295
                },
                {
                    "address" : "tE9wL5d8YK94JgMHrV8HvK5pwb7tAqdHmn",
                    "previous_output" : 
                    {
                        "hash" : "e5438e1991d84b2d5ccdfd7f78a04b2c19cb46edcea2a8a3a7cd4dab7e9c404d",
                        "index" : 0
                    },
                    "script" : "[ 30450221008731b85098d0ee77556e5f0c9a2429b73148a90b315fb4f9233a72fa239792dc022047972f648ca3ace381cca830687c06aa3e384d13d23fc1e60380ce4581cf01f901 ] [ 026bd7e6d504f3737b930f9fc222dc519c147fb0f0a8ac0216458b637cab25427c ]",
                    "sequence" : 4294967295
                }
            ],
            "lock_time" : "0",
            "outputs" : 
            [
                {
                    "attachment" : 
                    {
                        "type" : "coinstake"
                    },
                    "index" : 0,
                    "locked_height_range" : 0,
                    "script" : "",
                    "value" : 0
                },
                {
                    "address" : "tE9wL5d8YK94JgMHrV8HvK5pwb7tAqdHmn",
                    "attachment" : 
                    {
                        "type" : "etp"
                    },
                    "index" : 1,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 4f4e6201241b25f48183dda03f63229fecd2ba4d ] equalverify checksig",
                    "value" : 100032829764
                }
            ],
            "version" : "1"
        }
    ],
    "version" : 2
}
```

该 `PoS` 块包含两个交易：
* 第一个交易为 `coinbase`，其哈希为`0ca5c0e285c180256b44eae94d570fc67366c52ed4fa62a4dd9e9c07e3eddc99`；  
* 第二个交易为 `coinstake`，其哈希为`c246e71b06e75c7d56b7120fda9c8344c45b0aaf4922e8bea8c7ff50b7e79d8e`；

## PoS 创世块
创世块也是一个 `PoS` 块，因此也包含 `coinbase` 和 `coinstake` 交易。此外它还包含第三个交易： `PoS` 创世交易，该交易包含发送到元界基金会地址的创世奖励以及 `23` 个 `witness` 一级证书。

示例：
测试网 `PoS` 创世块的块高为 [`991505`](https://explorer-testnet.mvs.org/blk/991505)，其块构成如下所示：
```
{
    "bits" : "1000000",
    "blocksig" : "08a0040c78daa152c7fc55ac8bbde0276815af1ffdd341aa2bd03dbfe99c8bdcae94272a8b60088bff75558932ad6070ccb93b62c2f462fab8c4def64e45ee5b",
    "hash" : "37d4536c18a46116de359680301b09ba267c7ab9deffd3b7794aaa857ab42e14",
    "merkle_tree_hash" : "56fbbba222565d8fe7c6278be8e1ca5a97c67e29aa2d058989356e22a1bb25c5",
    "mixhash" : "0",
    "nonce" : "0",
    "number" : 991505,
    "previous_block_hash" : "1b8fc39f70983da89aebad22f3ee7354257e57f10efe292abc880d8704c7cd91",
    "timestamp" : 1547629552,
    "transaction_count" : 3,
    "transactions" : 
    [
        {
            "hash" : "e7a25724eccc05fb5f36d14c6e851037dd9e3c9f5002853c2e623e7a64b790f8",
            "inputs" : 
            [
                {
                    "previous_output" : 
                    {
                        "hash" : "0000000000000000000000000000000000000000000000000000000000000000",
                        "index" : 4294967295
                    },
                    "script" : "[ 11210f ]",
                    "sequence" : 0
                }
            ],
            "lock_time" : "0",
            "outputs" : 
            [
                {
                    "address" : "tE9wL5d8YK94JgMHrV8HvK5pwb7tAqdHmn",
                    "attachment" : 
                    {
                        "type" : "etp"
                    },
                    "index" : 0,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 4f4e6201241b25f48183dda03f63229fecd2ba4d ] equalverify checksig",
                    "value" : 11320608
                }
            ],
            "version" : "1"
        },
        {
            "hash" : "21ab6dca066b6a7cdbaa71f4564f6979b9484b86c387885d91126a03f54949fc",
            "inputs" : 
            [
                {
                    "address" : "tE9wL5d8YK94JgMHrV8HvK5pwb7tAqdHmn",
                    "previous_output" : 
                    {
                        "hash" : "88f86937cffa9f9cdf55a14dc154dd5534690d1a86981d83f49a8386a7fde34f",
                        "index" : 0
                    },
                    "script" : "[ 3045022100ab835030425bd60173c9e3e5cbb7818fab48260f69cfa32ff5a528cb70160a4002202aa01254275f1117cbc21d396cd6c1202d0d480c13c0d68804291cf41b32cd2b01 ] [ 026bd7e6d504f3737b930f9fc222dc519c147fb0f0a8ac0216458b637cab25427c ]",
                    "sequence" : 4294967295
                },
                {
                    "address" : "tE9wL5d8YK94JgMHrV8HvK5pwb7tAqdHmn",
                    "previous_output" : 
                    {
                        "hash" : "88f86937cffa9f9cdf55a14dc154dd5534690d1a86981d83f49a8386a7fde34f",
                        "index" : 1
                    },
                    "script" : "[ 30440220746ca6690f75a5e3f7da75b6afdd6eae33174ce3acc47ea0d7d4eeb67de2960002202b8b62f96cea12dd0a136f349c31258b09784d8fa24ee14cd668cd0fde5f8da401 ] [ 026bd7e6d504f3737b930f9fc222dc519c147fb0f0a8ac0216458b637cab25427c ]",
                    "sequence" : 4294967295
                }
            ],
            "lock_time" : "0",
            "outputs" : 
            [
                {
                    "attachment" : 
                    {
                        "type" : "coinstake"
                    },
                    "index" : 0,
                    "locked_height_range" : 0,
                    "script" : "",
                    "value" : 0
                },
                {
                    "address" : "tE9wL5d8YK94JgMHrV8HvK5pwb7tAqdHmn",
                    "attachment" : 
                    {
                        "type" : "etp"
                    },
                    "index" : 1,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 4f4e6201241b25f48183dda03f63229fecd2ba4d ] equalverify checksig",
                    "value" : 120776443211
                }
            ],
            "version" : "1"
        },
        {
            "hash" : "9a71d084b472468421012b1c4a25ef3e2e42d2712069d2a447a7befaab92bcad",
            "inputs" : 
            [
                {
                    "previous_output" : 
                    {
                        "hash" : "0000000000000000000000000000000000000000000000000000000000000000",
                        "index" : 4294967295
                    },
                    "script" : "[ 004100b8087f00007420506f532061742020a900b8087f0000404200b8087f0000b04100 ]",
                    "sequence" : 0
                }
            ],
            "lock_time" : "0",
            "outputs" : 
            [
                {
                    "address" : "tBELxsiiaMVGQcY2Apf7hmzAaipD4YWTTj",
                    "attachment" : 
                    {
                        "type" : "etp"
                    },
                    "index" : 0,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 2f3b65f87fa30c7fc1b5e2919daf0aad0e42b074 ] equalverify checksig",
                    "value" : 1726452600000000
                },
                {
                    "address" : "tBELxsiiaMVGQcY2Apf7hmzAaipD4YWTTj",
                    "attachment" : 
                    {
                        "address" : "tBELxsiiaMVGQcY2Apf7hmzAaipD4YWTTj",
                        "cert" : "witness",
                        "owner" : "yoyo",
                        "symbol" : "MVS.WITNESS.1",
                        "type" : "asset-cert"
                    },
                    "index" : 1,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 2f3b65f87fa30c7fc1b5e2919daf0aad0e42b074 ] equalverify checksig",
                    "value" : 0
                },
                {
                    //省略 witness 证书...
                },
                {
                    "address" : "tBELxsiiaMVGQcY2Apf7hmzAaipD4YWTTj",
                    "attachment" : 
                    {
                        "address" : "tBELxsiiaMVGQcY2Apf7hmzAaipD4YWTTj",
                        "cert" : "witness",
                        "owner" : "yoyo",
                        "symbol" : "MVS.WITNESS.23",
                        "type" : "asset-cert"
                    },
                    "index" : 23,
                    "locked_height_range" : 0,
                    "script" : "dup hash160 [ 2f3b65f87fa30c7fc1b5e2919daf0aad0e42b074 ] equalverify checksig",
                    "value" : 0
                }
            ],
            "version" : "0"
        }
    ],
    "version" : 2
}
```

该 `PoS` 创世块包含三个交易：
* 第一个交易为 `coinbase`，其哈希为[`e7a25724eccc05fb5f36d14c6e851037dd9e3c9f5002853c2e623e7a64b790f8`](https://explorer-testnet.mvs.org/tx/e7a25724eccc05fb5f36d14c6e851037dd9e3c9f5002853c2e623e7a64b790f8)；  
* 第二个交易为 `coinstake`，其哈希为[`21ab6dca066b6a7cdbaa71f4564f6979b9484b86c387885d91126a03f54949fc`](https://explorer-testnet.mvs.org/tx/21ab6dca066b6a7cdbaa71f4564f6979b9484b86c387885d91126a03f54949fc)；
* 第三个交易为 `PoS` 创世交易，其哈希为[`9a71d084b472468421012b1c4a25ef3e2e42d2712069d2a447a7befaab92bcad`](https://explorer-testnet.mvs.org/tx/9a71d084b472468421012b1c4a25ef3e2e42d2712069d2a447a7befaab92bcad)；

## Relative lock-time (RLT) 相对时间锁交易
Metaverse 实现了 [BIP112](https://github.com/bitcoin/bips/blob/master/bip-0112.mediawiki) 中定义的相对时间锁机制。带有相对时间锁交易的脚本中包含操作码 `CHECKSEQUENCEVERIFY` **(使用操作码值为NOP4 (=179) 而非NOP3 (=178)，由于 NOP3 已经被元界另一个扩展功能(CHECKATTENUATIONVERIFY)占用了。请注意此处与比特币的不同。)**。

示例交易如下：
交易[2912621cb70244d878ed0594d1bf841191d5323347cad76b3126085220692702](https://explorer-testnet.mvs.org/tx/2912621cb70244d878ed0594d1bf841191d5323347cad76b3126085220692702) 通过相对时间锁锁仓 `1000 ETP`，锁仓块高为 `10000000`，其值对应脚本中第一个操作数的十六进制 `969800` 部分。

其交易构成如下：
```
{
    "hash" : "2912621cb70244d878ed0594d1bf841191d5323347cad76b3126085220692702",
    "inputs" : 
    [
        {
            "address" : "t76YL2e4CQ17rY9SrrL3LSuNRrRr9b2iAk",
            "previous_output" : 
            {
                "hash" : "b3fdd7ef0fb5b765a94d1ad5849789430d7ac03ee62c35c7912a2cdbde43a22b",
                "index" : 2
            },
            "script" : "[ 3044022043a54fb6d713a4fa56728f0bf7c7a39e291ced7a7a8ff27267b8f86712391cf40220453e2c5e0bfbb96cd5c60e63bdac5fb9a09ae3983f801c776584bb892d72154701 ] [ 02efe188fa25406d3662fcf372cb28a31473827c5d3e01a411b1c7515b1550e917 ]",
            "sequence" : 4294967295
        }
    ],
    "lock_time" : "0",
    "outputs" : 
    [
        {
            "address" : "t76YL2e4CQ17rY9SrrL3LSuNRrRr9b2iAk",
            "attachment" : 
            {
                "type" : "etp"
            },
            "index" : 0,
            "locked_height_range" : 0,
            "script" : "[ 80969800 ] checksequenceverify drop dup hash160 [ 01e10de596cc7067f098bc854eec51644d5704e1 ] equalverify checksig",
            "value" : 100000000000
        },
        {
            "address" : "t76YL2e4CQ17rY9SrrL3LSuNRrRr9b2iAk",
            "attachment" : 
            {
                "type" : "etp"
            },
            "index" : 1,
            "locked_height_range" : 0,
            "script" : "dup hash160 [ 01e10de596cc7067f098bc854eec51644d5704e1 ] equalverify checksig",
            "value" : 19899990000
        }
    ],
    "version" : "4"
}
```
