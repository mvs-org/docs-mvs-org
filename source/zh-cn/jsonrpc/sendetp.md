title: Sending ETP
comments: false
---

## Description
Sending etp.
offline signature tx , then sending etp.

### sendfrom
This is a sample command that will send transaction specifically.

**My change will goes to my sender address.**
```bash
./mvs-cli sendfrom chenhao chenhao tVfAVefMQ2xifDyW5fNqRbH7qSxpuUDypt tUop3B6TJMHUSVM4jxyGgaf2rJ8wENiGtQ 100000000
```
```json
{
    "transaction": {
        "hash": "deea7cb817ca27936d5c77178b6b1fffcde4ca83a5e5f6ce0d764319f756618c",
        "inputs": [
            {
                "address": "tVfAVefMQ2xifDyW5fNqRbH7qSxpuUDypt",
                "previous_output": {
                    "hash": "de4688477aaa30eb3e45f7f78561c9d306b60235749f8065b44af275eab6ec3b",
                    "index": "1"
                },
                "script": "[ 3044022028d44bb4d3cc37db59aaa0415bd62e04f972dc92019531bdcae39f56f545b46e022024851d8a04125c1d20f7f8db5f45f9313e145b77aae47900a7be51624fcc75fe01 ] [ 023eae2ac21e34929345d1323f81d29668688a61aaa91527fc4f8a71ac090b72b0 ]",
                "sequence": "4294967295"
            }
        ],
        "lock_time": "0",
        "outputs": [
            {
                "index": "0",
                "address": "tUop3B6TJMHUSVM4jxyGgaf2rJ8wENiGtQ",
                "script": "dup hash160 [ f009dd1d8e5fed1bf95afb7f1e208e963b6ee430 ] equalverify checksig",
                "value": "100000000",
                "attachment": {
                    "type": "etp"
                }
            },
            {
                "index": "1",
                "address": "tVfAVefMQ2xifDyW5fNqRbH7qSxpuUDypt", // mychange here
                "script": "dup hash160 [ f95f5272a1d8219035fadd48c06561c56026da35 ] equalverify checksig",
                "value": "99980000",
                "attachment": {
                    "type": "etp"
                }
            }
        ],
        "version": "1"
    }
}
```

### send
**My change goes to one random existed address of my account.**
```bash
./mvs-cli send chenhao chenhao  tUop3B6TJMHUSVM4jxyGgaf2rJ8wENiGtQ 100000000
```
```json
{
    "transaction": {
        "hash": "f1dfefd3c7d515700fbec92f86cf0194377e2c872021310f985b6381562dc910",
        "inputs": [
            {
                "address": "tMe7kzY2riAPh7cNDgr97choBkbNnQPu1y",
                "previous_output": {
                    "hash": "e32a01a71d764c595f6113e603dc4bc9dca666702265345d4deb09d4dd09ae11",
                    "index": "1"
                },
                "script": "[ 3044022021b1a11570a1a3f6a4137f13f8ecddf0c0cdbab94183b2d7c5c7e0d96b794793022068888553d0ca8b61ce731f8b7f43e2c42766fece81f9ed8da73fae83ffcfcdcb01 ] [ 03369e1179a441c27651349af19aaec7384b4793fe3740fcb94dab955c0c2954b5 ]",
                "sequence": "4294967295"
            }
        ],
        "lock_time": "0",
        "outputs": [
            {
                "index": "0",
                "address": "tUop3B6TJMHUSVM4jxyGgaf2rJ8wENiGtQ",
                "script": "dup hash160 [ f009dd1d8e5fed1bf95afb7f1e208e963b6ee430 ] equalverify checksig",
                "value": "100000000",
                "attachment": {
                    "type": "etp"
                }
            },
            {
                "index": "1",
                "address": "tPpZzPL99rLqYZpfn4ZdCXHinzDg8ZY3Kp", // mychange here
                "script": "dup hash160 [ b955ec8cc2a3521c429118dc381950392810a8da ] equalverify checksig",
                "value": "99980000",
                "attachment": {
                    "type": "etp"
                }
            }
        ],
        "version": "1"
    }
}
```

### sendmore
send to multi-receivers.

**My change goes to one existed random address of my account, but you can also specify a address which option --mychange.**
```bash
./mvs-cli sendmore chenhao chenhao  -r tUop3B6TJMHUSVM4jxyGgaf2rJ8wENiGtQ:100000000 -m tPpZzPL99rLqYZpfn4ZdCXHinzDg8ZY3Kp
```
```json
{
    "transaction": {
        "hash": "2546f9890c807cb7836836af6bad5bcc2eca31959ce436e799c77b03f2af03fa",
        "inputs": [
            {
                "address": "tUop3B6TJMHUSVM4jxyGgaf2rJ8wENiGtQ",
                "previous_output": {
                    "hash": "f1dfefd3c7d515700fbec92f86cf0194377e2c872021310f985b6381562dc910",
                    "index": "0"
                },
                "script": "[ 3045022100d6953369049c5779c5b61e1d9dafa723e93ef49d9dd98537af7aec3b6db0b8fe0220570ab848c3ad41098770ee2e6e55657c0d1d779bf69f7fef331cbe8e0dd41d8d01 ] [ 03b7810a12b300f1246778648ea57bd63edd260bac8016dde3175d613f5740b644 ]",
                "sequence": "4294967295"
            },
            {
                "address": "tUop3B6TJMHUSVM4jxyGgaf2rJ8wENiGtQ",
                "previous_output": {
                    "hash": "deea7cb817ca27936d5c77178b6b1fffcde4ca83a5e5f6ce0d764319f756618c",
                    "index": "0"
                },
                "script": "[ 30440220210d84a37928c1fdad1b25a5ffac4be9f6674a3d2e149e1dfce089a2b3469f0302201a019411f1654c73ddc7ff9157faa21adefe2040374e9febaceaff83bb15c72501 ] [ 03b7810a12b300f1246778648ea57bd63edd260bac8016dde3175d613f5740b644 ]",
                "sequence": "4294967295"
            }
        ],
        "lock_time": "0",
        "outputs": [
            {
                "index": "0",
                "address": "tPpZzPL99rLqYZpfn4ZdCXHinzDg8ZY3Kp", // mychange here
                "script": "dup hash160 [ b955ec8cc2a3521c429118dc381950392810a8da ] equalverify checksig",
                "value": "99990000",
                "attachment": {
                    "type": "etp"
                }
            },
            {
                "index": "1",
                "address": "tUop3B6TJMHUSVM4jxyGgaf2rJ8wENiGtQ",
                "script": "dup hash160 [ f009dd1d8e5fed1bf95afb7f1e208e963b6ee430 ] equalverify checksig",
                "value": "100000000",
                "attachment": {
                    "type": "etp"
                }
            }
        ],
        "version": "1"
    }
}
```


### createrawtx
version 0.7.2 support

create not signed raw etp/asset transfer transaction from multiple addresses to multiple target addresses.
```bash
./mvs-cli createrawtx -t 0 -s tKisXQbtwZgC9vXbLa8Wngt2jxJKhSAxFo -s tHcdZs73L9Ck9UFxLbj1Hquu1wPmEbkJey -r tV8kVAX2gjXnsqZHUzU4xvespTCb2YsYtJ:20000000000 -r tLWixVH8zJGcJpJPjo549q75WcyqrudL9d:50000000000 -m tHcdZs73L9Ck9UFxLbj1Hquu1wPmEbkJey -i "etp transfer from multi addr to multi target"
```
```json
{
    "hex": "020000000b1cb0d02058f2ef5d924720f1d76ccae49d1ea07c766f730517b8345e49a6fc730100000000ffffffff7cd3132bae432d49a9af997c3d530ca9f0e847d7092abe0ccae656497ee3547c0000000000ffffffffabf134504c7d82c751f19c79ac576d3a9a6bf0353784b37032fd5b4c0092678d0000000000ffffffffc343e3c3b414d65d70d1a8dac5d718f7af982b00a3c66252a0cd589abd400c580000000000ffffffff9f6bbaefd50249e06894ff92b727cf5c92b83867df6bd0d5a1467e8ebde131370000000000ffffffffd98920a8d96de3d713043208a967ef1f5f2a0de9f49359a5061802eaaaf2ac870000000000ffffffff65e47a9fb41f16fb5774721cba34799dadd7bc037ff7fb05f9e151a7598dfecb0000000000ffffffff828126f33f9f105eefeb750c4fefbb7192a8107b4e4f78b28994bde8612db8f70000000000ffffffffe2b2b938a6fb1a089d319d7ddd268cceffafc7986fd27de3d188604f048f258f0000000000ffffffff743065d9b5640ea0f3d37bb1da2e594458d64f75d5af256dce408da220f0d41a0000000000ffffffff5cb628825de73fa62d3d7566a1c06e5645e345cfe871f735271d84546669558b0000000000ffffffff0400c817a8040000001976a914f39ecd520ccb8a5e8e4ea7c41a5ec8215e3f77f288ac010000000000000000743ba40b0000001976a914950d8b7cbec7fdf1f9780cbd00870378b3b8eb0488ac0100000000000000d06bf505000000001976a914754329f4e57be1787e9f500b7b4b558add38e5e488ac010000000000000000000000000000001976a914754329f4e57be1787e9f500b7b4b558add38e5e488ac01000000030000002c657470207472616e736665722066726f6d206d756c7469206164647220746f206d756c74692074617267657400000000"
}

```

### signrawtx
version 0.7.2 support

sign raw transaction created by createrawtx command
```bash
./mvs-cli signrawtx chenhao chenhao 020000000b1cb0d02058f2ef5d924720f1d76ccae49d1ea07c766f730517b8345e49a6fc730100000000ffffffff7cd3132bae432d49a9af997c3d530ca9f0e847d7092abe0ccae656497ee3547c0000000000ffffffffabf134504c7d82c751f19c79ac576d3a9a6bf0353784b37032fd5b4c0092678d0000000000ffffffffc343e3c3b414d65d70d1a8dac5d718f7af982b00a3c66252a0cd589abd400c580000000000ffffffff9f6bbaefd50249e06894ff92b727cf5c92b83867df6bd0d5a1467e8ebde131370000000000ffffffffd98920a8d96de3d713043208a967ef1f5f2a0de9f49359a5061802eaaaf2ac870000000000ffffffff65e47a9fb41f16fb5774721cba34799dadd7bc037ff7fb05f9e151a7598dfecb0000000000ffffffff828126f33f9f105eefeb750c4fefbb7192a8107b4e4f78b28994bde8612db8f70000000000ffffffffe2b2b938a6fb1a089d319d7ddd268cceffafc7986fd27de3d188604f048f258f0000000000ffffffff743065d9b5640ea0f3d37bb1da2e594458d64f75d5af256dce408da220f0d41a0000000000ffffffff5cb628825de73fa62d3d7566a1c06e5645e345cfe871f735271d84546669558b0000000000ffffffff0400c817a8040000001976a914f39ecd520ccb8a5e8e4ea7c41a5ec8215e3f77f288ac010000000000000000743ba40b0000001976a914950d8b7cbec7fdf1f9780cbd00870378b3b8eb0488ac0100000000000000d06bf505000000001976a914754329f4e57be1787e9f500b7b4b558add38e5e488ac010000000000000000000000000000001976a914754329f4e57be1787e9f500b7b4b558add38e5e488ac01000000030000002c657470207472616e736665722066726f6d206d756c7469206164647220746f206d756c74692074617267657400000000
```
```json
{
    "hash": "f50bdff56a1626ff487c96ffac6415986bbef4239379c0893126c446e2e95274",
    "hex": "020000000b1cb0d02058f2ef5d924720f1d76ccae49d1ea07c766f730517b8345e49a6fc73010000006b483045022100fa159ef3916755b82db886e3d114ff1e49315c563c3c77c3491980db029dc3680220699c5da9264ba9585db1540b02979ebb7197d090b352d292185137af4747886a01210319115972ebfd7a16f63dac39dbb996e7968706dbac19bde34157ca37eabb99b9ffffffff7cd3132bae432d49a9af997c3d530ca9f0e847d7092abe0ccae656497ee3547c000000006a47304402204b06cceb63bf49cf57b7442a53d110d3b1665d2197f0596bde380fd82a835bf702202578e26511d8b2fc563a65c55ee3953ec5926127df132cc13491f9a8a2adc08801210319115972ebfd7a16f63dac39dbb996e7968706dbac19bde34157ca37eabb99b9ffffffffabf134504c7d82c751f19c79ac576d3a9a6bf0353784b37032fd5b4c0092678d000000006b4830450221008d88d9529bc0eadbe9bb1a900ea1e7d11b1f7761bc1a89103d567a9e6f5148bf0220440980e6c7ed4ad3b717d93baf9e760e895e3c1f591f39097d793b01ae484109012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffffc343e3c3b414d65d70d1a8dac5d718f7af982b00a3c66252a0cd589abd400c58000000006b483045022100811687f0523f50bc034c409c09e3c09d2d76a0c2557aa9f7dd8b424433c708b602206ab1b4f7b3fb2dc27892efe9355f0009e8d0c2ce95bd38775191ee66f014b8ab012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffff9f6bbaefd50249e06894ff92b727cf5c92b83867df6bd0d5a1467e8ebde13137000000006a473044022014628bd060de43faf2397efb38a589e824916143655a963a61c26af7461af73f02206ecd4d925b9bfc44d29f7b02bbb2032c2acc58583c9efb18b02d2529538c75aa012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffffd98920a8d96de3d713043208a967ef1f5f2a0de9f49359a5061802eaaaf2ac87000000006a473044022026fb6d6a560527048a0b3ec80708c7fad7e93b5d99199615e89281f03400dbdc02205b2847862140bd9d6cceeb35b6bcc9a1f84f6e15dba493e4c13d57897cb18395012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffff65e47a9fb41f16fb5774721cba34799dadd7bc037ff7fb05f9e151a7598dfecb000000006a4730440220236b5d8da9c03635d26c560485bcf1f756655ff2d8e048e98e6012a06b0e35a802207223625463d40e659b9383e05622944b25279f25bccc4eadbac957d0bcaa2755012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffff828126f33f9f105eefeb750c4fefbb7192a8107b4e4f78b28994bde8612db8f7000000006a473044022008e6a2ebbbf90c810add89325e8f1ef9887f871a0ce2a9bda11244923c6442730220331118a49eb3fd5ed5cd35365fb689f0c60c08def480f485b4819a3d10235753012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffffe2b2b938a6fb1a089d319d7ddd268cceffafc7986fd27de3d188604f048f258f000000006b483045022100de2c90f781d80f7a7d9ce57a5fb71a88ab08dce7282743947c90d531e7b031d30220357ae413aa82bf35911ca9c9902e0fe16401099ef5871b9691d84304d0c600b7012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffff743065d9b5640ea0f3d37bb1da2e594458d64f75d5af256dce408da220f0d41a000000006b483045022100eb2d93898e36792b3a9c920e638dde786d532e9f49b2b5c4b7ff881be105ad3802205f5b49cad3787689f1ebbf188fecaaf6e76b1f2923700695c140203acc748e72012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffff5cb628825de73fa62d3d7566a1c06e5645e345cfe871f735271d84546669558b000000006a47304402205b9fbe1a2175c566dd4d498552158ce9427889c7a669b417ba047bfcdb97e93702200b513cd5df33f9ca1e4f3836e262788a5207b7cebaf0471f11bd68113abe69f7012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffff0400c817a8040000001976a914f39ecd520ccb8a5e8e4ea7c41a5ec8215e3f77f288ac010000000000000000743ba40b0000001976a914950d8b7cbec7fdf1f9780cbd00870378b3b8eb0488ac0100000000000000d06bf505000000001976a914754329f4e57be1787e9f500b7b4b558add38e5e488ac010000000000000000000000000000001976a914754329f4e57be1787e9f500b7b4b558add38e5e488ac01000000030000002c657470207472616e736665722066726f6d206d756c7469206164647220746f206d756c74692074617267657400000000"
}
```

### decoderawtx
version 0.7.2 support

decode signed or not raw transactoin to json output
```bash
./mvs-cli decoderawtx 020000000b1cb0d02058f2ef5d924720f1d76ccae49d1ea07c766f730517b8345e49a6fc73010000006b483045022100fa159ef3916755b82db886e3d114ff1e49315c563c3c77c3491980db029dc3680220699c5da9264ba9585db1540b02979ebb7197d090b352d292185137af4747886a01210319115972ebfd7a16f63dac39dbb996e7968706dbac19bde34157ca37eabb99b9ffffffff7cd3132bae432d49a9af997c3d530ca9f0e847d7092abe0ccae656497ee3547c000000006a47304402204b06cceb63bf49cf57b7442a53d110d3b1665d2197f0596bde380fd82a835bf702202578e26511d8b2fc563a65c55ee3953ec5926127df132cc13491f9a8a2adc08801210319115972ebfd7a16f63dac39dbb996e7968706dbac19bde34157ca37eabb99b9ffffffffabf134504c7d82c751f19c79ac576d3a9a6bf0353784b37032fd5b4c0092678d000000006b4830450221008d88d9529bc0eadbe9bb1a900ea1e7d11b1f7761bc1a89103d567a9e6f5148bf0220440980e6c7ed4ad3b717d93baf9e760e895e3c1f591f39097d793b01ae484109012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffffc343e3c3b414d65d70d1a8dac5d718f7af982b00a3c66252a0cd589abd400c58000000006b483045022100811687f0523f50bc034c409c09e3c09d2d76a0c2557aa9f7dd8b424433c708b602206ab1b4f7b3fb2dc27892efe9355f0009e8d0c2ce95bd38775191ee66f014b8ab012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffff9f6bbaefd50249e06894ff92b727cf5c92b83867df6bd0d5a1467e8ebde13137000000006a473044022014628bd060de43faf2397efb38a589e824916143655a963a61c26af7461af73f02206ecd4d925b9bfc44d29f7b02bbb2032c2acc58583c9efb18b02d2529538c75aa012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffffd98920a8d96de3d713043208a967ef1f5f2a0de9f49359a5061802eaaaf2ac87000000006a473044022026fb6d6a560527048a0b3ec80708c7fad7e93b5d99199615e89281f03400dbdc02205b2847862140bd9d6cceeb35b6bcc9a1f84f6e15dba493e4c13d57897cb18395012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffff65e47a9fb41f16fb5774721cba34799dadd7bc037ff7fb05f9e151a7598dfecb000000006a4730440220236b5d8da9c03635d26c560485bcf1f756655ff2d8e048e98e6012a06b0e35a802207223625463d40e659b9383e05622944b25279f25bccc4eadbac957d0bcaa2755012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffff828126f33f9f105eefeb750c4fefbb7192a8107b4e4f78b28994bde8612db8f7000000006a473044022008e6a2ebbbf90c810add89325e8f1ef9887f871a0ce2a9bda11244923c6442730220331118a49eb3fd5ed5cd35365fb689f0c60c08def480f485b4819a3d10235753012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffffe2b2b938a6fb1a089d319d7ddd268cceffafc7986fd27de3d188604f048f258f000000006b483045022100de2c90f781d80f7a7d9ce57a5fb71a88ab08dce7282743947c90d531e7b031d30220357ae413aa82bf35911ca9c9902e0fe16401099ef5871b9691d84304d0c600b7012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffff743065d9b5640ea0f3d37bb1da2e594458d64f75d5af256dce408da220f0d41a000000006b483045022100eb2d93898e36792b3a9c920e638dde786d532e9f49b2b5c4b7ff881be105ad3802205f5b49cad3787689f1ebbf188fecaaf6e76b1f2923700695c140203acc748e72012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffff5cb628825de73fa62d3d7566a1c06e5645e345cfe871f735271d84546669558b000000006a47304402205b9fbe1a2175c566dd4d498552158ce9427889c7a669b417ba047bfcdb97e93702200b513cd5df33f9ca1e4f3836e262788a5207b7cebaf0471f11bd68113abe69f7012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffff0400c817a8040000001976a914f39ecd520ccb8a5e8e4ea7c41a5ec8215e3f77f288ac010000000000000000743ba40b0000001976a914950d8b7cbec7fdf1f9780cbd00870378b3b8eb0488ac0100000000000000d06bf505000000001976a914754329f4e57be1787e9f500b7b4b558add38e5e488ac010000000000000000000000000000001976a914754329f4e57be1787e9f500b7b4b558add38e5e488ac01000000030000002c657470207472616e736665722066726f6d206d756c7469206164647220746f206d756c74692074617267657400000000
```
```json
{
    "transaction": {
        "hash": "f50bdff56a1626ff487c96ffac6415986bbef4239379c0893126c446e2e95274",
        "inputs": [
            {
                "address": "tKisXQbtwZgC9vXbLa8Wngt2jxJKhSAxFo",
                "previous_output": {
                    "hash": "73fca6495e34b81705736f767ca01e9de4ca6cd7f12047925deff25820d0b01c",
                    "index": "1"
                },
                "script": "[ 3045022100fa159ef3916755b82db886e3d114ff1e49315c563c3c77c3491980db029dc3680220699c5da9264ba9585db1540b02979ebb7197d090b352d292185137af4747886a01 ] [ 0319115972ebfd7a16f63dac39dbb996e7968706dbac19bde34157ca37eabb99b9 ]",
                "sequence": "4294967295"
            },
            {
                "address": "tKisXQbtwZgC9vXbLa8Wngt2jxJKhSAxFo",
                "previous_output": {
                    "hash": "7c54e37e4956e6ca0cbe2a09d747e8f0a90c533d7c99afa9492d43ae2b13d37c",
                    "index": "0"
                },
                "script": "[ 304402204b06cceb63bf49cf57b7442a53d110d3b1665d2197f0596bde380fd82a835bf702202578e26511d8b2fc563a65c55ee3953ec5926127df132cc13491f9a8a2adc08801 ] [ 0319115972ebfd7a16f63dac39dbb996e7968706dbac19bde34157ca37eabb99b9 ]",
                "sequence": "4294967295"
            },
            {
                "address": "tHcdZs73L9Ck9UFxLbj1Hquu1wPmEbkJey",
                "previous_output": {
                    "hash": "8d6792004c5bfd3270b3843735f06b9a3a6d57ac799cf151c7827d4c5034f1ab",
                    "index": "0"
                },
                "script": "[ 30450221008d88d9529bc0eadbe9bb1a900ea1e7d11b1f7761bc1a89103d567a9e6f5148bf0220440980e6c7ed4ad3b717d93baf9e760e895e3c1f591f39097d793b01ae48410901 ] [ 03fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaaf ]",
                "sequence": "4294967295"
            },
            {
                "address": "tHcdZs73L9Ck9UFxLbj1Hquu1wPmEbkJey",
                "previous_output": {
                    "hash": "580c40bd9a58cda05262c6a3002b98aff718d7c5daa8d1705dd614b4c3e343c3",
                    "index": "0"
                },
                "script": "[ 3045022100811687f0523f50bc034c409c09e3c09d2d76a0c2557aa9f7dd8b424433c708b602206ab1b4f7b3fb2dc27892efe9355f0009e8d0c2ce95bd38775191ee66f014b8ab01 ] [ 03fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaaf ]",
                "sequence": "4294967295"
            },
            {
                "address": "tHcdZs73L9Ck9UFxLbj1Hquu1wPmEbkJey",
                "previous_output": {
                    "hash": "3731e1bd8e7e46a1d5d06bdf6738b8925ccf27b792ff9468e04902d5efba6b9f",
                    "index": "0"
                },
                "script": "[ 3044022014628bd060de43faf2397efb38a589e824916143655a963a61c26af7461af73f02206ecd4d925b9bfc44d29f7b02bbb2032c2acc58583c9efb18b02d2529538c75aa01 ] [ 03fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaaf ]",
                "sequence": "4294967295"
            },
            {
                "address": "tHcdZs73L9Ck9UFxLbj1Hquu1wPmEbkJey",
                "previous_output": {
                    "hash": "87acf2aaea021806a55993f4e90d2a5f1fef67a908320413d7e36dd9a82089d9",
                    "index": "0"
                },
                "script": "[ 3044022026fb6d6a560527048a0b3ec80708c7fad7e93b5d99199615e89281f03400dbdc02205b2847862140bd9d6cceeb35b6bcc9a1f84f6e15dba493e4c13d57897cb1839501 ] [ 03fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaaf ]",
                "sequence": "4294967295"
            },
            {
                "address": "tHcdZs73L9Ck9UFxLbj1Hquu1wPmEbkJey",
                "previous_output": {
                    "hash": "cbfe8d59a751e1f905fbf77f03bcd7ad9d7934ba1c727457fb161fb49f7ae465",
                    "index": "0"
                },
                "script": "[ 30440220236b5d8da9c03635d26c560485bcf1f756655ff2d8e048e98e6012a06b0e35a802207223625463d40e659b9383e05622944b25279f25bccc4eadbac957d0bcaa275501 ] [ 03fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaaf ]",
                "sequence": "4294967295"
            },
            {
                "address": "tHcdZs73L9Ck9UFxLbj1Hquu1wPmEbkJey",
                "previous_output": {
                    "hash": "f7b82d61e8bd9489b2784f4e7b10a89271bbef4f0c75ebef5e109f3ff3268182",
                    "index": "0"
                },
                "script": "[ 3044022008e6a2ebbbf90c810add89325e8f1ef9887f871a0ce2a9bda11244923c6442730220331118a49eb3fd5ed5cd35365fb689f0c60c08def480f485b4819a3d1023575301 ] [ 03fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaaf ]",
                "sequence": "4294967295"
            },
            {
                "address": "tHcdZs73L9Ck9UFxLbj1Hquu1wPmEbkJey",
                "previous_output": {
                    "hash": "8f258f044f6088d1e37dd26f98c7afffce8c26dd7d9d319d081afba638b9b2e2",
                    "index": "0"
                },
                "script": "[ 3045022100de2c90f781d80f7a7d9ce57a5fb71a88ab08dce7282743947c90d531e7b031d30220357ae413aa82bf35911ca9c9902e0fe16401099ef5871b9691d84304d0c600b701 ] [ 03fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaaf ]",
                "sequence": "4294967295"
            },
            {
                "address": "tHcdZs73L9Ck9UFxLbj1Hquu1wPmEbkJey",
                "previous_output": {
                    "hash": "1ad4f020a28d40ce6d25afd5754fd65844592edab17bd3f3a00e64b5d9653074",
                    "index": "0"
                },
                "script": "[ 3045022100eb2d93898e36792b3a9c920e638dde786d532e9f49b2b5c4b7ff881be105ad3802205f5b49cad3787689f1ebbf188fecaaf6e76b1f2923700695c140203acc748e7201 ] [ 03fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaaf ]",
                "sequence": "4294967295"
            },
            {
                "address": "tHcdZs73L9Ck9UFxLbj1Hquu1wPmEbkJey",
                "previous_output": {
                    "hash": "8b55696654841d2735f771e8cf45e345566ec0a166753d2da63fe75d8228b65c",
                    "index": "0"
                },
                "script": "[ 304402205b9fbe1a2175c566dd4d498552158ce9427889c7a669b417ba047bfcdb97e93702200b513cd5df33f9ca1e4f3836e262788a5207b7cebaf0471f11bd68113abe69f701 ] [ 03fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaaf ]",
                "sequence": "4294967295"
            }
        ],
        "lock_time": "0",
        "outputs": [
            {
                "index": "0",
                "address": "tV8kVAX2gjXnsqZHUzU4xvespTCb2YsYtJ",
                "script": "dup hash160 [ f39ecd520ccb8a5e8e4ea7c41a5ec8215e3f77f2 ] equalverify checksig",
                "locked_height_range": "0",
                "value": "20000000000",
                "attachment": {
                    "type": "etp"
                }
            },
            {
                "index": "1",
                "address": "tLWixVH8zJGcJpJPjo549q75WcyqrudL9d",
                "script": "dup hash160 [ 950d8b7cbec7fdf1f9780cbd00870378b3b8eb04 ] equalverify checksig",
                "locked_height_range": "0",
                "value": "50000000000",
                "attachment": {
                    "type": "etp"
                }
            },
            {
                "index": "2",
                "address": "tHcdZs73L9Ck9UFxLbj1Hquu1wPmEbkJey",
                "script": "dup hash160 [ 754329f4e57be1787e9f500b7b4b558add38e5e4 ] equalverify checksig",
                "locked_height_range": "0",
                "value": "99970000",
                "attachment": {
                    "type": "etp"
                }
            },
            {
                "index": "3",
                "address": "tHcdZs73L9Ck9UFxLbj1Hquu1wPmEbkJey",
                "script": "dup hash160 [ 754329f4e57be1787e9f500b7b4b558add38e5e4 ] equalverify checksig",
                "locked_height_range": "0",
                "value": "0",
                "attachment": {
                    "type": "message",
                    "content": "etp transfer from multi addr to multi target"
                }
            }
        ],
        "version": "2"
    }
}

```

### sendrawtx
version 0.7.2 support

send signed raw transaction to network. it will fail if the transaction not pass validation check
```bash
./mvs-cli sendrawtx 020000000b1cb0d02058f2ef5d924720f1d76ccae49d1ea07c766f730517b8345e49a6fc73010000006b483045022100fa159ef3916755b82db886e3d114ff1e49315c563c3c77c3491980db029dc3680220699c5da9264ba9585db1540b02979ebb7197d090b352d292185137af4747886a01210319115972ebfd7a16f63dac39dbb996e7968706dbac19bde34157ca37eabb99b9ffffffff7cd3132bae432d49a9af997c3d530ca9f0e847d7092abe0ccae656497ee3547c000000006a47304402204b06cceb63bf49cf57b7442a53d110d3b1665d2197f0596bde380fd82a835bf702202578e26511d8b2fc563a65c55ee3953ec5926127df132cc13491f9a8a2adc08801210319115972ebfd7a16f63dac39dbb996e7968706dbac19bde34157ca37eabb99b9ffffffffabf134504c7d82c751f19c79ac576d3a9a6bf0353784b37032fd5b4c0092678d000000006b4830450221008d88d9529bc0eadbe9bb1a900ea1e7d11b1f7761bc1a89103d567a9e6f5148bf0220440980e6c7ed4ad3b717d93baf9e760e895e3c1f591f39097d793b01ae484109012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffffc343e3c3b414d65d70d1a8dac5d718f7af982b00a3c66252a0cd589abd400c58000000006b483045022100811687f0523f50bc034c409c09e3c09d2d76a0c2557aa9f7dd8b424433c708b602206ab1b4f7b3fb2dc27892efe9355f0009e8d0c2ce95bd38775191ee66f014b8ab012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffff9f6bbaefd50249e06894ff92b727cf5c92b83867df6bd0d5a1467e8ebde13137000000006a473044022014628bd060de43faf2397efb38a589e824916143655a963a61c26af7461af73f02206ecd4d925b9bfc44d29f7b02bbb2032c2acc58583c9efb18b02d2529538c75aa012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffffd98920a8d96de3d713043208a967ef1f5f2a0de9f49359a5061802eaaaf2ac87000000006a473044022026fb6d6a560527048a0b3ec80708c7fad7e93b5d99199615e89281f03400dbdc02205b2847862140bd9d6cceeb35b6bcc9a1f84f6e15dba493e4c13d57897cb18395012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffff65e47a9fb41f16fb5774721cba34799dadd7bc037ff7fb05f9e151a7598dfecb000000006a4730440220236b5d8da9c03635d26c560485bcf1f756655ff2d8e048e98e6012a06b0e35a802207223625463d40e659b9383e05622944b25279f25bccc4eadbac957d0bcaa2755012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffff828126f33f9f105eefeb750c4fefbb7192a8107b4e4f78b28994bde8612db8f7000000006a473044022008e6a2ebbbf90c810add89325e8f1ef9887f871a0ce2a9bda11244923c6442730220331118a49eb3fd5ed5cd35365fb689f0c60c08def480f485b4819a3d10235753012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffffe2b2b938a6fb1a089d319d7ddd268cceffafc7986fd27de3d188604f048f258f000000006b483045022100de2c90f781d80f7a7d9ce57a5fb71a88ab08dce7282743947c90d531e7b031d30220357ae413aa82bf35911ca9c9902e0fe16401099ef5871b9691d84304d0c600b7012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffff743065d9b5640ea0f3d37bb1da2e594458d64f75d5af256dce408da220f0d41a000000006b483045022100eb2d93898e36792b3a9c920e638dde786d532e9f49b2b5c4b7ff881be105ad3802205f5b49cad3787689f1ebbf188fecaaf6e76b1f2923700695c140203acc748e72012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffff5cb628825de73fa62d3d7566a1c06e5645e345cfe871f735271d84546669558b000000006a47304402205b9fbe1a2175c566dd4d498552158ce9427889c7a669b417ba047bfcdb97e93702200b513cd5df33f9ca1e4f3836e262788a5207b7cebaf0471f11bd68113abe69f7012103fa92707a9b45d9d23c09e0c30cad6ea7258e4f9d1431594910d3dc083d0ccaafffffffff0400c817a8040000001976a914f39ecd520ccb8a5e8e4ea7c41a5ec8215e3f77f288ac010000000000000000743ba40b0000001976a914950d8b7cbec7fdf1f9780cbd00870378b3b8eb0488ac0100000000000000d06bf505000000001976a914754329f4e57be1787e9f500b7b4b558add38e5e488ac010000000000000000000000000000001976a914754329f4e57be1787e9f500b7b4b558add38e5e488ac01000000030000002c657470207472616e736665722066726f6d206d756c7469206164647220746f206d756c74692074617267657400000000
```
```json
{
    "hash": "f50bdff56a1626ff487c96ffac6415986bbef4239379c0893126c446e2e95274"
}
```
