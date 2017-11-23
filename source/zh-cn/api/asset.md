title: Asset
comments: false
---

## Description
Assets is a token which is attached on ETP UTXO.

### listassets
list entire network assets if without specify account.
```bash
./mvs-cli listassets
```
```json
{
    "assets": [
        {
            "symbol": "GLORY",
            "maximum_supply": "81",
            "decimal_number": "0",
            "issuer": "jym",
            "address": "tSuXGYwk5SiUE1JnidGrLeXqvzvyb2ycTD",
            "description": "9*9",
            "status": "issued",
            "height": "929"
        },
        {
            "symbol": "LCN",
            "maximum_supply": "100000000",
            "decimal_number": "0",
            "issuer": "leo",
            "address": "tASg3uES813NkxpT6VxNBe6ZpVzTCTswdK",
            "description": "LEO COIN",
            "status": "issued",
            "height": "9120"
        }
    ]
}
```
### getaccountasset 
* Version 0.7.0+
```bash
./mvs-cli getaccountasset chenhao chenhao
```
```json
./mvs-cli getaccountasset test4 123456
{
    "assets": [
        {
            "symbol": "SUN",
            "address": "tDm2xzMJQPWeCEoRVCwMEezfyRZTQW7VSu",
            "quantity": "1000",
            "status": "unspent"
        },
        {
            "symbol": "SUN",
            "address": "",
            "quantity": "1000",
            "decimal_number": "1",
            "status": "unissued"
        }
    ]
}
```
* Oldder version
```bash
./mvs-cli getaccountasset chenhao chenhao
```
```json
{
    "assets": [
        {
            "symbol": "CHENHAO.T5",
            "quantity": "9999989976999990",
            "decimal_number": "8",
            "status": "unspent"
        },
        {
            "symbol": "BTC.SUN",
            "quantity": "11",
            "decimal_number": "10",
            "status": "unspent"
        },
        {
            "symbol": "REALSTEEL",
            "quantity": "2",
            "decimal_number": "0",
            "status": "unspent"
        }
    ]
}
```


### createasset
Create asset at local, will be pushed to metaverse blockchain by command 'issue'.
```bash
./mvs-cli createasset chenhao chenhao -d "chenhao test6" -s CHENHAO.T6 -v 10000000 -n 0
```
```json
{
    "asset": {
        "symbol": "CHENHAO.T6",
        "maximum-supply": "10000000",
        "decimal_number": "0",
        "issuer": "chenhao",
        "address": "",
        "description": "chenhao test6"
    }
}
```
### issue
Publish asset to the blockchain.
```bash
./mvs-cli issue chenhao chenhao CHENHAO.T6
```
```json
{
    "transaction": {
        "hash": "679d25fc97797e37da5f58a624399c61c77db39662b375a2f2b2a6e277c9106a",
        "inputs": [
            {
                "address": "tDE4Y5zjBb9m63ZuDfzGa2Qs5jMNeqW5e4",
                "previous_output": {
                    "hash": "d7a02a444efa18886d3eb4c1690ba30ba8d3ada21e9f98861ad7d051bc6c882f",
                    "index": "0"
                },
                "script": "[ 304402204164ff4e70febab54acdada9b53f097455f4888aa202a083818b5433783a06c102204b7da7f3e99d0b6681a5b0f6412f29d1a3653441e0f23b3eb1293363102155bb01 ] [ 0330e6a6df5dd73273f4af26cd858864b447bf8f04c900969334a005f52a6d060f ]",
                "sequence": "4294967295"
            },
            {
                "address": "tDE4Y5zjBb9m63ZuDfzGa2Qs5jMNeqW5e4",
                "previous_output": {
                    "hash": "868ed1eabb458358544d6466f45e7d340e0dd0bf733af43fcc25720c4c8aad62",
                    "index": "0"
                },
                "script": "[ 304402201d209a3941d9564ae76370d168ac875e1eb09f98a53c69dd222a2137794e36c60220746e5d51e40d63279a59bab6d1143a0529b3906509907f1f32f44e67258f739201 ] [ 0330e6a6df5dd73273f4af26cd858864b447bf8f04c900969334a005f52a6d060f ]",
                "sequence": "4294967295"
            },
            {
                "address": "tDE4Y5zjBb9m63ZuDfzGa2Qs5jMNeqW5e4",
                "previous_output": {
                    "hash": "a755818c754fdcfc17948ac3ec4aae72f058f7d17f185433620388dd6fed1d0b",
                    "index": "0"
                },
                "script": "[ 30450221008e61b5cede1b4a17c9a1265cb3b3cd7c5eccd67f87f2961caca526544a460367022078a95d929bc3893bbeb06d8cd61d139859066785bae50fc1e7f6bb381d41ccb101 ] [ 0330e6a6df5dd73273f4af26cd858864b447bf8f04c900969334a005f52a6d060f ]",
                "sequence": "4294967295"
            },
            {
                "address": "tDE4Y5zjBb9m63ZuDfzGa2Qs5jMNeqW5e4",
                "previous_output": {
                    "hash": "7ebca3c84a7c25ca0c97accda3b369d63415520905a95a493223323517bba91d",
                    "index": "0"
                },
                "script": "[ 3045022100d0828ea5ef5896bcdd8d07bb77d37debbbd840fa84eb51a00a1c70aca4dbf5bf022021282ee544625585578c44b2e992ade8ef56b4bdfa8cf9023666b506e5ed8d0f01 ] [ 0330e6a6df5dd73273f4af26cd858864b447bf8f04c900969334a005f52a6d060f ]",
                "sequence": "4294967295"
            }
        ],
        "lock_time": "0",
        "outputs": [
            {
                "index": "0",
                "address": "tDE4Y5zjBb9m63ZuDfzGa2Qs5jMNeqW5e4",
                "script": "dup hash160 [ 451defdf3adbac10ac55e611048649fc832797de ] equalverify checksig",
                "value": "0",
                "attachment": {
                    "type": "asset-issue",
                    "symbol": "CHENHAO.T6",
                    "quantity": "10000000",
                    "decimal_number": "0",
                    "issuer": "chenhao",
                    "address": "tDE4Y5zjBb9m63ZuDfzGa2Qs5jMNeqW5e4",
                    "description": "chenhao test6"
                }
            },
            {
                "index": "1",
                "address": "tDE4Y5zjBb9m63ZuDfzGa2Qs5jMNeqW5e4",
                "script": "dup hash160 [ 451defdf3adbac10ac55e611048649fc832797de ] equalverify checksig",
                "value": "200000000",
                "attachment": {
                    "type": "etp"
                }
            }
        ],
        "version": "2"
    }
}
```
### getaddressasset
non-account command.
```bash
./mvs-cli getaddressasset tDE4Y5zjBb9m63ZuDfzGa2Qs5jMNeqW5e4 
```
```json
{
    "assets": [
        {
            "symbol": "CHENHAO.T5",
            "quantity": "9999989976999990",
            "decimal_number": "8",
            "address": "tDE4Y5zjBb9m63ZuDfzGa2Qs5jMNeqW5e4",
            "status": "unspent"
        },
        {
            "symbol": "CHENHAO.T6",
            "quantity": "10000000",
            "decimal_number": "0",
            "address": "tDE4Y5zjBb9m63ZuDfzGa2Qs5jMNeqW5e4",
            "status": "unspent"
        }
    ]
}
```

### sendasset
```bash
./mvs-cli sendasset chenhao chenhao tCtwTim6PWGd9KjSnoKLW5MYtCH4JnT72m CHENHAO.T6 10
```
```json
{
    "transaction": {
        "hash": "71385ffe6d878fc586def553ceb6c9ae65e868289525f7133630d80dbe1e60e4",
        "inputs": [
            {
                "address": "tDE4Y5zjBb9m63ZuDfzGa2Qs5jMNeqW5e4",
                "previous_output": {
                    "hash": "487feae9ba68ca4e915a475d909442b427bae401eeb5d6cdd51a30a0c3e05253",
                    "index": "0"
                },
                "script": "[ 3045022100f9b23047e684a82f62a01563c91fa323ebf76e0dc66f838d77a5cf2887cb900502205e389d54e4d4d38f226461b07edf3479777915ca9cb1841010e6133e3f6c1f1b01 ] [ 0330e6a6df5dd73273f4af26cd858864b447bf8f04c900969334a005f52a6d060f ]",
                "sequence": "4294967295"
            },
            {
                "address": "tDE4Y5zjBb9m63ZuDfzGa2Qs5jMNeqW5e4",
                "previous_output": {
                    "hash": "679d25fc97797e37da5f58a624399c61c77db39662b375a2f2b2a6e277c9106a",
                    "index": "0"
                },
                "script": "[ 30450221009917ef5e7807ba5f55fdc084792fbf967b83d079994afbdb4caf33fb7c069a4202200826d61e42eb189a592d909840f269d03fc1965484feb2aea3f00f00874af3cf01 ] [ 0330e6a6df5dd73273f4af26cd858864b447bf8f04c900969334a005f52a6d060f ]",
                "sequence": "4294967295"
            }
        ],
        "lock_time": "0",
        "outputs": [
            {
                "index": "0",
                "address": "tCtwTim6PWGd9KjSnoKLW5MYtCH4JnT72m",
                "script": "dup hash160 [ 418020a92bffb15b7c0564c43aafeea6b21b8ac8 ] equalverify checksig",
                "value": "0",
                "attachment": {
                    "type": "asset-transfer",
                    "symbol": "CHENHAO.T6",
                    "quantity": "10"
                }
            },
            {
                "index": "1",
                "address": "tDE4Y5zjBb9m63ZuDfzGa2Qs5jMNeqW5e4",
                "script": "dup hash160 [ 451defdf3adbac10ac55e611048649fc832797de ] equalverify checksig",
                "value": "299990000",
                "attachment": {
                    "type": "etp"
                }
            },
            {
                "index": "2",
                "address": "tDE4Y5zjBb9m63ZuDfzGa2Qs5jMNeqW5e4",
                "script": "dup hash160 [ 451defdf3adbac10ac55e611048649fc832797de ] equalverify checksig",
                "value": "0",
                "attachment": {
                    "type": "asset-transfer",
                    "symbol": "CHENHAO.T6",
                    "quantity": "9999990"
                }
            }
        ],
        "version": "2"
    }
}
```

Check balance of this asset with this account:
```bash
./mvs-cli listassets chenhao chenhao
```
```json
{
    "assets": [
        {
            "symbol": "CHENHAO.T6",
            "quantity": "9999990",
            "decimal_number": "0",
            "status": "unspent"
        },
        {
            "symbol": "CHENHAO.T5",
            "quantity": "9999989976999990",
            "decimal_number": "8",
            "status": "unspent"
        },
        {
            "symbol": "BTC.SUN",
            "quantity": "11",
            "decimal_number": "10",
            "status": "unspent"
        },
        {
            "symbol": "REALSTEEL",
            "quantity": "2",
            "decimal_number": "0",
            "status": "unspent"
        }
    ]
}
```

### issuefrom
### sendassetfrom
```bash
./mvs-cli sendassetfrom mvs_test1 123456 t7h5b9svF5yXS8jPU7SzeRjDtsw8nAEA5N tCYBVEZPvRcPfiTGycY161kssPamedUDTR WANDASHEN1 10
```
```json
{
    "transaction": {
        "hash": "370a1d2b6e92eeaaa24750208bd8eba2cb73120ae300469872b326457ccfaa20",
        "inputs": [
            {
                "address": "t7h5b9svF5yXS8jPU7SzeRjDtsw8nAEA5N",
                "previous_output": {
                    "hash": "af734e17fc4beecdc31ab037948946700769e2c9678ff592ec3e87db7e5cd415",
                    "index": "1"
                },
                "script": "[ 3045022100a787741a729b331c15a071d8595205db6eaa8fcef87e0b82ae2d35c8e566c138022068176587307a6e8a4aa7f30bc2a52b7fcccfc80315e95b9b112f79a4d1b58b4001 ] [ 03553cdc1bd80ec14f91e5c50e8e0ed92e421c828786dd1f9c5021f3a22096eeee ]",
                "sequence": "4294967295"
            },
            {
                "address": "t7h5b9svF5yXS8jPU7SzeRjDtsw8nAEA5N",
                "previous_output": {
                    "hash": "21586c36cd20d33671a494ed71de5d603c11d23d0c349f8c18427f0cb1439836",
                    "index": "0"
                },
                "script": "[ 30440220665b15a7d5a330ca8502b17cfb1fa3f4de5489b27f577c654aa13a72d5612e8402203202cc1dae832a5d1e8722bdd3cbdade01e73b4be0b710c4b5625d326739272701 ] [ 03553cdc1bd80ec14f91e5c50e8e0ed92e421c828786dd1f9c5021f3a22096eeee ]",
                "sequence": "4294967295"
            }
        ],
        "lock_time": "0",
        "outputs": [
            {
                "index": "0",
                "address": "tCYBVEZPvRcPfiTGycY161kssPamedUDTR",
                "script": "dup hash160 [ 3d9319ccd7f58814ae674501e9c861407fc7e803 ] equalverify checksig",
                "value": "0",
                "attachment": {
                    "type": "asset-transfer",
                    "symbol": "WANDASHEN1",
                    "quantity": "10"
                }
            },
            {
                "index": "1",
                "address": "t7h5b9svF5yXS8jPU7SzeRjDtsw8nAEA5N",
                "script": "dup hash160 [ 08694acb45263f8b38ebdb28b42aba982bb1ce3a ] equalverify checksig",
                "value": "229960000",
                "attachment": {
                    "type": "etp"
                }
            },
            {
                "index": "2",
                "address": "t7h5b9svF5yXS8jPU7SzeRjDtsw8nAEA5N",
                "script": "dup hash160 [ 08694acb45263f8b38ebdb28b42aba982bb1ce3a ] equalverify checksig",
                "value": "0",
                "attachment": {
                    "type": "asset-transfer",
                    "symbol": "WANDASHEN1",
                    "quantity": "2290"
                }
            }
        ],
        "version": "2"
    }
}
```
