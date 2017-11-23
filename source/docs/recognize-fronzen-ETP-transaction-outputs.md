title: Recognize Fronzen ETP Transaction Outputs
comments: false
---
Because of [onchain-deposit](/docs/features-onchain-deposit.html), users can send FRONZEN ETP to any address. So the exchange platforms and wallet serivie prividers have to recognize this type of transaction outputs.  

## How to recognize fronzen ETP transaction outputs?
A regular P2PKH (Pay to public key hash) output script looks like this:
```
dup hash160 [ 376485d30ed4e7d051f215f5eeeff4732b1075c6 ] equalverify checksig
```

A locked transaction however has the following output script:
```
[ 7062 ] numequalverify dup hash160 [ 4fd34a03c3e140700c9324202a335bda6b5fddc3 ] equalverify checksig
```

The first sqare brackets determine the locktime in number of blocks (hex encoded little endian).
A lock transaction also triggers the creation of a reward transaction that the miner of the block creates. That transaction has a coinbase input and a locked output.  
Please make sure that you only accept P2PKH transaction outputs if you expect a regular payment or deposit. Otherwise the ETP will be locked for up to a year.

## Solutions
* Solution 1: Write some code to identity the type of ETP transaction.We recommand to use regular expression as below to filter script:
```bash
^dup\ hash160\ \[ ([a-f0-9]+)\ \]\ equalverify\ checksig$
```

* Solution 2:
A improved version of Metaverse Wallet already released on mvs.org, and improved source code was commited on github(#178).
Added new filed 'locked_height_range' in JSON response for commands:
```bash
gettransaction
fetch-tx
listtxs
getblock
```
If the value of locked_height_range is non-zero, it means the ETP output is fronzen.

Example of **NORMAL** ETP output:
```json
{
    "hash": "edfabf9651669645235ddeda824648409bf586b79722c4ebd54f6aaf53de58f8",
    "height": "719299",
    "inputs": [
        {
            "previous_output": {
                "hash": "0000000000000000000000000000000000000000000000000000000000000000",
                "index": "4294967295"
            },
            "script": "[ 03c3f90a ]",
            "sequence": "0"
        }
    ],
    "lock_time": "0",
    "outputs": [
        {
            "index": "0",
            "address": "MEVgP8kvucyR9523t71FVKSiZccQjeK4ki",
            "script": "dup hash160 [ 485810bf4d7c698938786c937aa12c467f8261a9 ] equalverify checksig",
            "locked_height_range": "0", // It means this ETP output is available.
            "value": "285240000",
            "attachment": {
                "type": "etp"
            }
        }
    ],
    "version": "1"
}
```

Example of **FROZEN** ETP output:
```json
{
    "hash": "53e05539209c80bf36b9f729f4d8c0f240e55b320814fdb074029b6bd5d3e967",
    "height": "676276",
    "inputs": [
        {
            "previous_output": {
                "hash": "0000000000000000000000000000000000000000000000000000000000000000",
                "index": "4294967295"
            },
            "script": "[ 03b4510a ]",
            "sequence": "0"
        }
    ],
    "lock_time": "676274",
    "outputs": [
        {
            "index": "0",
            "address": "MFBEjD9QwgTxnRiUGd2qXATYxcReyG5ZtB",
            "script": "[ 7062 ] numequalverify dup hash160 [ 4fd34a03c3e140700c9324202a335bda6b5fddc3 ] equalverify checksig",
            "locked_height_range": "25200", // value is non-zero, It means FRONZEN ETP will be unlocked after how many blocks.
            "value": "9",
            "attachment": {
                "type": "etp"
            }
        }
    ],
    "version": "1"
}
```
