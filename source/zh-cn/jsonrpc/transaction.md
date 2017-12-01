title: Transaction
comments: false
---

### Description
Get transaction from mvsd.

### fetch-tx/gettransaction 
see transaction of specified hash.
```bash
./mvs-cli fetch-tx/gettransaction 6f2ee246af04f226dbf598749db885e44830eac61f065069dfd8d790fc58d7c0
```
```json
{
    "transaction": {
        "hash": "90085d2fbc39290220548bb2c719c1863714507395175c8ea8e622359410ac72",
        "inputs": [
            {
                "previous_output": {
                    "hash": "0000000000000000000000000000000000000000000000000000000000000000",
                    "index": "4294967295"
                },
                "script": "[ 03396301 ]",
                "sequence": "0"
            }
        ],
        "lock_time": "0",
        "outputs": [
            {
                "index": "0",
                "address": "tPpZzPL99rLqYZpfn4ZdCXHinzDg8ZY3Kp",
                "script": "dup hash160 [ b955ec8cc2a3521c429118dc381950392810a8da ] equalverify checksig",
                "value": "285000000",
                "attachment": {
                    "type": "etp"
                }
            }
        ],
        "version": "1"
    }
}
```

### fetch-history
see transactions of any address.
```bash
./mvs-cli fetch-history tPpZzPL99rLqYZpfn4ZdCXHinzDg8ZY3Kp
```
```json
{
    "transfers": [
        {
            "received": {
                "hash": "90085d2fbc39290220548bb2c719c1863714507395175c8ea8e622359410ac72",
                "height": "90937",
                "index": "0"
            },
            "value": "285000000"
        },
        {
            "received": {
                "hash": "b8b877f647c4394a0efca7d86b40e1c0ee04f064782b00c4008a11f5aa4d667b",
                "height": "89822",
                "index": "0"
            },
            "value": "285000000"
        }
    ]
}
```

### listtxs
see transactions that related my account.Old version wallet has no transaction history paging fuction.
```bash
./mvs-cli listtxs -a tPpZzPL99rLqYZpfn4ZdCXHinzDg8ZY3Kp chenhao chenhao
```
```json
{
    "transactions": [
        {
            "hash": "b8b877f647c4394a0efca7d86b40e1c0ee04f064782b00c4008a11f5aa4d667b",
            "height": "89822",
            "timestamp": "1494563846",
            "direction": "receive",
            "inputs": [
                {
                    "address": ""
                }
            ],
            "outputs": [
                {
                    "address": "tPpZzPL99rLqYZpfn4ZdCXHinzDg8ZY3Kp",
                    "etp-value": "285000000",
                    "attachment": {
                        "type": "etp"
                    }
                }
            ]
        },
        {
            "hash": "90085d2fbc39290220548bb2c719c1863714507395175c8ea8e622359410ac72",
            "height": "90937",
            "timestamp": "1494603096",
            "direction": "receive",
            "inputs": [
                {
                    "address": ""
                }
            ],
            "outputs": [
                {
                    "address": "tPpZzPL99rLqYZpfn4ZdCXHinzDg8ZY3Kp",
                    "etp-value": "285000000",
                    "attachment": {
                        "type": "etp"
                    }
                }
            ]
        }
    ]
}
```
Version 0.7.0 wallet has transactions paging fuction
```bash
./mvs-cli listtxs -a tDm2xzMJQPWeCEoRVCwMEezfyRZTQW7VSu test4 123456 -i 1 -l 2
```

```json
{
    "total_page": "1498",
    "current_page": "1",
    "transaction_count": "2",
    "transactions": [
        {
            "hash": "7642013435f7eb86579f16ecf26f73740a28be3320928e207a60246a553c45a9",
            "height": "160152",
            "timestamp": "1504781975",
            "direction": "receive",
            "inputs": [
                {
                    "address": "",
                    "script": "[ 03987102 ]"
                }
            ],
            "outputs": [
                {
                    "own": "true",
                    "address": "tDm2xzMJQPWeCEoRVCwMEezfyRZTQW7VSu",
                    "script": "dup hash160 [ 4af9854d20c06026e7c86cb94ae009da17f58e5b ] equalverify checksig",
                    "etp-value": "257212499",
                    "attachment": {
                        "type": "etp"
                    }
                }
            ]
        },
        {
            "hash": "57619fde7971c636ebabbfbddc701040003c15569b4bba09e0ba9ea2e34e2f4d",
            "height": "160151",
            "timestamp": "1504781972",
            "direction": "receive",
            "inputs": [
                {
                    "address": "",
                    "script": "[ 03977102 ]"
                }
            ],
            "outputs": [
                {
                    "own": "true",
                    "address": "tDm2xzMJQPWeCEoRVCwMEezfyRZTQW7VSu",
                    "script": "dup hash160 [ 4af9854d20c06026e7c86cb94ae009da17f58e5b ] equalverify checksig",
                    "etp-value": "257212499",
                    "attachment": {
                        "type": "etp"
                    }
                }
            ]
        }
    ]
}

```
