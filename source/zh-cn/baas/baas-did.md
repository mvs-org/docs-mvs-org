title: 数字身份微服务
---

## 概要
数字身份微服务提供 `API` 接口以方便交易所为用户注册数字身份，并绑定到用户钱包。

交易所也可以参照本文档中的设计自己实现同样的功能。涉及到的`CLI command`:
> getnewaddress  
> registerdid  
> didchangeaddress  
> getdid  
> getpublickey  
> getnewmultisig  
> sendrawtx  
> send  

以上命令的详细文档可以查看[API文档](https://docs.mvs.org/zh-cn/api_v2/)。

## 用例
以下用例场景涉及到两个角色：交易所和用户 `Alice`。

### 一，用户申请登记数字身份
`Alice` 通过交易所的交互界面申请登记名为 `Alias@Alice` 的数字身份。

### 二，交易所登记数字身份
交易所使用自己的 `MVS` 账户用命令 `getnewaddress` 生成新的地址，然后通过命令 `registerdid` 将名为 `Alias@Alice` 的数字身份绑定到该地址。

### 三，用户绑定数字身份到自己的钱包

1. 生成多重签名地址
`Alice` 和交易所通过命令 `getpublickey` 获取各自账号下某个地址的公钥，并交换公钥。然后各自通过命令 `getnewmultisig` 使用公钥信息生成 `m:n` 为 `1:2` 的相同多重签名地址 `multisig_address`。交易所

2. 交易所转出数字身份到多重签名地址
交易所通过命令 `didchangeaddress` 创建将数字身份 `Alias@Alice` 转出到多重签名地址 `multisig_address` 的交易，并使用命令 `sendrawtx` 广播交易。

3. 用户转入数字身份到钱包地址
`Alice` 通过命令 `didchangeaddress` 创建将数字身份 `Alias@Alice` 转入到钱包地址的交易，并使用命令 `sendrawtx` 广播交易。

4. 确认数字身份
交易所或者 `Alice` 通过命令 `getdid` 可以查看数字身份 `Alias@Alice` 的历史记录确认。

## 数字身份微服务
为了简化交易所的工作，数字身份微服务对以上业务进行了封装，提供了便利的接口。

1. 交易所登记数字身份
交易所使用自己的 `MVS` 账户用命令 `getnewaddress` 生成新的地址，然后通过命令 `registerdid` 将用户请求的数字身份绑定到该地址。然后交易所将用户在交易所的帐户ID，登记的数字身份名称以及绑定的地址通过数字身份微服务接口 `savedid` 保存起来。

2. 交易所生成多重签名地址
当用户申请转出数字身份到用户钱包时，交易所用用户在交易所的帐户ID通过数字身份微服务接口 `querydid` 获得数字身份名称以及绑定的地址。

3. 交易所通过命令 `getpublickey` 获取绑定地址的公钥，并将该公钥出示给用户，同时要求用户输入用户地址的公钥。然后通过命令 `getnewmultisig` 使用公钥信息生成 `m:n` 为 `1:2` 的多重签名地址。

4. 交易所转出数字身份到多重签名地址
交易所通过命令 `didchangeaddress` 创建将数字身份转出到多重签名地址的交易，并使用命令 `sendrawtx` 广播交易。

## 实现
根据上面的用例，下面详细地描述了各命令的调用过程。

### 一，用户申请登记数字身份
`Alice` 通过交易所的交互界面申请登记名为 `Alias@Alice` 的数字身份。

### 二，交易所登记数字身份
1. 交易所使用自己的 `MVS` 账户用命令 `getnewaddress` 生成新的地址用于登记用户的数字身份。
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

2. 交易所向该地址转入 `100000000` 聪（`1 ETP`）作为后续登记数字身份的手续费。
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
        // 略...
    }
    ```

3. 交易所通过命令 `registerdid` 将名为 `Alias@Alice` 的数字身份绑定到该地址。
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

4. 交易所将用户在交易所的帐户ID，登记的数字身份名称以及绑定的地址通过数字身份微服务接口 `savedid` 保存起来。

### 三，用户绑定数字身份到自己的钱包  
1. `Alice` 通过交易所交互页面申请绑定数字身份到自己的钱包。交易所用 `Alice` 在交易所的帐户ID通过数字身份微服务接口 `querydid` 获得数字身份名称 `Alias@Alice` 以及绑定的地址 `MLTxV5JAu5sFhQmJYNRmPuu31CkNWrF5rj`。

2. 交易所通过命令 `getpublickey` 获取绑定的地址的公钥 `031c7ac7f12a05ea4952289801fa52142aa421f11efe8ab7090fb823562156a321`，然后通过交互页面展示给 `Alice`， `Alice` 记录下该公钥用于后续生成多重签名地址。
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

3. `Alice` 通过钱包获取账户下某个可以使用的地址 `MSqhPipeAZ1Ua9GfNbBi65RPdT7x4iHvwF` 以及对应的公钥 `0344befcd59670651a6441c00ef26caa104bab8ff9e5ec3f6e9b65bac9194cad0a`，并通过交互页面将该公钥提交给交易所。
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

4. 生成多重签名地址  
至此，交易所和 `Alice` 双方都获得了对方的公钥，因此交易所和 `Alice` 各自通过命令 `getnewmultisig` 使用公钥信息生成 `m:n` 为 `1:2` 的相同多重签名地址 `multisig_address`。  
交易所生成多重签名地址 `35ZW2TFThaK96DzwRwrfq5SRH2u7zfKTCF`：
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
`Alice` 生成多重签名地址 `35ZW2TFThaK96DzwRwrfq5SRH2u7zfKTCF`：
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

5. 交易所转出数字身份到多重签名地址  
交易所向多重签名地址 `35ZW2TFThaK96DzwRwrfq5SRH2u7zfKTCF`转入 `10000` 聪（`0.0001 ETP`） 作为后续转出数字身份的手续费。
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
交易所通过命令 `didchangeaddress` 创建将数字身份 `Alias@Alice` 转出到多重签名地址 `35ZW2TFThaK96DzwRwrfq5SRH2u7zfKTCF` 的交易，然后使用命令 `sendrawtx` 广播交易。  
交易所创建转出数字身份的多重签名交易：
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
交易所广播多重签名交易：
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

6. 用户转入数字身份到钱包地址  
`Alice` 通过钱包用命令 `didchangeaddress` 创建将数字身份 `Alias@Alice` 转入到钱包地址 `MSqhPipeAZ1Ua9GfNbBi65RPdT7x4iHvwF`的交易，并使用命令 `sendrawtx` 广播交易。  
`Alice` 创建转入数字身份的多重签名交易：
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
`Alice` 广播多重签名交易：
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

7. 确认数字身份  
交易所或者 `Alice` 通过命令 `getdid` 可以查看数字身份 `Alias@Alice` 的历史记录确认。
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
