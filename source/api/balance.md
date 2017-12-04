title: Balance
comments: false
---

### Description

We display amount with integer bits in metaverse command-line/RPC call case.

Example:
ETP bits (8 times 0)
```
{
    "total-confirmed": "200000001", // 2.0000001 ETP
    "total-received": "1000000000", // 10 ETP
    "total-unspent": "112345678", // 1.12345678 ETP
    "total-frozen": "0"
}
```
MVS.ZDC bits (6 times 0)
```
{
    "total-confirmed": "200000001", // 200.000001 MVS.ZDC
    "total-received": "1000000000", // 1000 MVS.ZDC
    "total-unspent": "112345678", // 112.345678 MVS.ZD
    "total-frozen": "0"
}
```

### getbalance
Show total-balance of this account.
```
./mvs-cli getbalance chenhao chenhao
```
```json
{
    "total-confirmed": "6059875918900",
    "total-received": "6181075918900",
    "total-unspent": "6059875918900",
    "total-frozen": "0"
}
```

### listbalances
list balance of each address of this account.
```bash
./mvs-cli listbalances chenhao chenhao
```
```json
{
    "balances": [
        {
            "balance": {
                "address": "tPpZzPL99rLqYZpfn4ZdCXHinzDg8ZY3Kp",
                "confirmed": "318060000000",
                "received": "318060000000",
                "unspent": "318060000000",
                "frozen": "0"
            }
        },
        {
            "balance": {
                "address": "tDufUbYv2Ga8ReRYmqjvsM7u56br3XTqcr",
                "confirmed": "3803175000000",
                "received": "3803175000000",
                "unspent": "3803175000000",
                "frozen": "0"
            }
        },
        {
            "balance": {
                "address": "tCYULUfAkFixcnWWRrpEx7uEUX7HiveXyf",
                "confirmed": "1411200000000",
                "received": "1411200000000",
                "unspent": "1411200000000",
                "frozen": "0"
            }
        },
        {
            "balance": {
                "address": "tMHMVgcc1FPLcLeXVkzL4zQpuEdJSn3MGp",
                "confirmed": "1000958900",
                "received": "1000958900",
                "unspent": "1000958900",
                "frozen": "0"
            }
        },
        {
            "balance": {
                "address": "tMe7kzY2riAPh7cNDgr97choBkbNnQPu1y",
                "confirmed": "499980000",
                "received": "499980000",
                "unspent": "499980000",
                "frozen": "0"
            }
        },
        {
            "balance": {
                "address": "tVfAVefMQ2xifDyW5fNqRbH7qSxpuUDypt",
                "confirmed": "131299990000",
                "received": "252499990000",
                "unspent": "131299990000",
                "frozen": "0"
            }
        }
    ]
}
```

### fetch-balance
see balance of any address of whole network.
```bash
./mvs-cli fetch-balance tPpZzPL99rLqYZpfn4ZdCXHinzDg8ZY3Kp
```
```json
{
    "balance": {
        "address": "tPpZzPL99rLqYZpfn4ZdCXHinzDg8ZY3Kp",
        "confirmed": "318060000000",
        "received": "318060000000",
        "unspent": "318060000000"
    }
}
```
