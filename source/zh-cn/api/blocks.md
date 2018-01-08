title: Blocks
comments: false
---

## Description
Get blocks from mvsd

### fetch-header
```bash
# Inquiry the block hash, specify height
./mvs-cli fetch-header -t  $block_height
```
```json
{
    "result": {
        "bits": "1",
        "hash": "c359a1cc3dfb8b97111c3e602f1f6de31306926f9ec779cb9ea002edbee91741",
        "merkle_tree_hash": "d4d612297cbecbc2d6438403e751ca83b3eedc58966033016e52889a9a86062e",
        "nonce": "0",
        "previous_block_hash": "0000000000000000000000000000000000000000000000000000000000000000",
        "time_stamp": "1479881397",
        "version": "1",
        "mixhash": "0",
        "number": "0",
        "transaction_count": "0"
    }
}
```

### getblock 
```bash
# Inquiry the block structure, specify block header and block data.
./mvs-cli getblock  $block_hash --json=true
```
```json
{
    "header": {
        "result": {
            "bits": "1",
            "hash": "c359a1cc3dfb8b97111c3e602f1f6de31306926f9ec779cb9ea002edbee91741",
            "merkle_tree_hash": "d4d612297cbecbc2d6438403e751ca83b3eedc58966033016e52889a9a86062e",
            "nonce": "0",
            "previous_block_hash": "0000000000000000000000000000000000000000000000000000000000000000",
            "time_stamp": "1479881397",
            "version": "1",
            "mixhash": "0",
            "number": "0",
            "transaction_count": "1"
        }
    },
    "txs": {
        "transactions": [
            {
                "hash": "d4d612297cbecbc2d6438403e751ca83b3eedc58966033016e52889a9a86062e",
                "inputs": [
                    {
                        "previous_output": {
                            "hash": "0000000000000000000000000000000000000000000000000000000000000000",
                            "index": "4294967295"
                        },
                        "script": "[ 323031372e30312e3138204d56532073746172742072756e6e696e6720746573746e65742e ]",
                        "sequence": "0"
                    }
                ],
                "lock_time": "0",
                "outputs": [
                    {
                        "index": "0",
                        "address": "tPd41bKLJGf1C5RRvaiV2mytqZB6WfM1vR",
                        "script": "dup hash160 [ b72852b4c7195034304bcc90b07326e6e555dc60 ] equalverify checksig",
                        "locked_height_range": "0",
                        "value": "5000000000000000",
                        "attachment": {
                            "type": "etp"
                        }
                    }
                ],
                "version": "0"
            }
        ]
    }
}
```

### getbestblockhash
```bash
# Inquiry the block structure, specify block header and block data.
./mvs-cli getbestblockhash
```

### getbestblockheader
```bash
./mvs-cli getbestblockheader
```

