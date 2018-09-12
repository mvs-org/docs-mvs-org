title: MST Multi-signature
---

## 简介
多重签名交易需要多个密钥持有者的签名才能通过验证。可以简单的理解为，一笔交易需要得到多个人的授权才能完成。这样能提高数字资产的安全性，并基于此构建复杂有趣的应用场景。

多重签名技术的原理并不是很复杂，但它增加了第三方的介入保障，可以实现现实场景中需要第三方介入的很多的应用场景。与传统的第三方介入不同的是，这个介入必须是交易之前就提前确定好的，而事后是不能进行改变的。

如果一个地址只能由一个私钥签名和支付，表现形式就是 `1/1`；而多重签名的表现形式是 `m/n`，也就是说一共 `n` 个私钥可以给一个账户签名，而当 `m` 个地址签名时，就可以支付一笔交易。所以，`m` 一定是小于等于 `n` 的。

示例：
> 多重签名 `2/3`，表示 `3` 个人拥有签名权，只要有两个人签名就可以完成这笔交易；  
> 多重签名 `1/2`，表示 `2` 个人拥有签名权，只要有一个人签名就可以完成这笔交易。

## 使用流程
1. 每一个参与者通过 `getpublickey` 获得某个地址的公钥，该公钥对应的私钥用于签名随后创建的多重签名交易，并把该公钥告知其他所有参与者；
2. 每一个参与者各自通过 `getnewmultisig` 使用自己的公钥创建签名约束条件相同（即相同的m，n以及公钥列表）的多重签名，得到相同的以3开头的多重签名地址：“支付到脚本哈希”模式 `P2SH（Pay-to-Script-Hash）`；
3. 某个参与者通过 `createmultisigtx` 使用多重签名地址发起一笔多重签名交易；可以使用 `decoderawtx` 命令查看该交易详情；
4. m个参与者依次通过 `signmultisigtx` 对多重签名交易进行签名，每一个参与者通过链下的方式从前一个签名参与者获得已部分签名的交易；
5. 通过 `sendrawtx` 广播拥有足够多签名的多重签名交易。

## 支持多重签名的命令
以下命令与多重签名相关或支持多重签名：

> [getpublickey](/zh-cn/multisig.html#getpublickey)  
> [getnewmultisig](/zh-cn/multisig.html#getnewmultisig)  
> [listmultisig](/zh-cn/multisig.html#listmultisig)  
> [deletemultisig](/zh-cn/multisig.html#deletemultisig)  
> [createmultisigtx](/zh-cn/multisig.html#createmultisigtx)  
> [signmultisigtx](/zh-cn/multisig.html#signmultisigtx)  
> [sendrawtx](/zh-cn/rawtx.html#sendrawtx)  
> [decoderawtx](/zh-cn/rawtx.html#decoderawtx)  

> [registerdid](/zh-cn/identity.html#registerdid)  
> [didchangeaddress](/zh-cn/identity.html#didchangeaddress)    
> [transfercert](/zh-cn/asset.html#transfercert)  
> [transfermit](/zh-cn/mit.html#transfermit)  

## 示例
该示例涉及到三个账户：`Alice`，`Bob` 以及 `Cindy`。多重签名命令使用手册请参考[API_v3_multisig](/zh-cn/api_v3/multisig.html)。

### 1. 获取和传播公钥
每一个参与者通过 `getpublickey` 获得某个地址的公钥，该公钥对应的私钥用于签名随后创建的多重签名交易，并把该公钥告知其他所有参与者。
```
// Alice 获取公钥
命令：
$ ./mvs-cli getpublickey Alice A123456 "MCJ6vpdCYsVD34XFC22fhqDLfHo7ZtnyM2"

输出：
{
  "address" : "MCJ6vpdCYsVD34XFC22fhqDLfHo7ZtnyM2",
  "public-key" : "03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e"
}

// Bob 获取公钥
命令：
$ ./mvs-cli getpublickey Bob B123456 MHaKHUFwAdcszvQarCmn1Rkq2uRoPQjZwm

输出：
{
  "address" : "MHaKHUFwAdcszvQarCmn1Rkq2uRoPQjZwm",
  "public-key" : "03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02"
}

// Cindy 获取公钥
命令：
$ ./mvs-cli getpublickey Cindy C123456 MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m

输出：
{
  "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
  "public-key" : "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9"
}
```

### 2. 创建多重签名
每一个参与者各自通过 `getnewmultisig` 使用自己的公钥创建签名约束条件相同（即相同的`m`，`n`以及公钥列表）的多重签名，得到相同的以`3`开头的多重签名地址。

范例中每一个参与者通过 `-s` 指定自己的公钥以及 `-k` 指定其他参与者的公钥创建 `m:n` 为 `2:3` 的多重签名，得到相同的多重签名地址`"39hh1NY9xyTKzawD8zFKXgXa7XBwqck6BR"`
```
// Alice 创建多重签名
命令：
$ ./mvs-cli getnewmultisig Alice A123456 -m 2 -n 3 -s "03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e" -k "03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02" -k "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9" -d "multisig test"

输出：
{
  "address" : "39hh1NY9xyTKzawD8zFKXgXa7XBwqck6BR",
  "description" : "multisig test",
  "index" : 1,
  "m" : 2,
  "multisig-script" : "2 [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]  [ 03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e ]  [ 03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02 ] 3 checkmultisig",
  "n" : 3,
  "public-keys" : 
  [
    "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9",
    "03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e",
    "03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02"
  ],
  "self-publickey" : "03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e"
}
```
```
// Bob 创建多重签名
命令：
$ ./mvs-cli getnewmultisig Bob B123456 -m 2 -n 3 -s "03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02" -k "03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e" -k "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9" -d "multisig test"

输出：
{
  "address" : "39hh1NY9xyTKzawD8zFKXgXa7XBwqck6BR",
  "description" : "multisig test",
  "index" : 1,
  "m" : 2,
  "multisig-script" : "2 [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]  [ 03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e ]  [ 03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02 ] 3 checkmultisig",
  "n" : 3,
  "public-keys" : 
  [
    "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9",
    "03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e",
    "03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02"
  ],
  "self-publickey" : "03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02"
}
```

```
// Cindy 创建多重签名
命令：
$ ./mvs-cli getnewmultisig Cindy C123456 -m 2 -n 3 -s "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9" -k "03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02" -k "03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e" -d "multisig test"

输出：
{
   "address" : "39hh1NY9xyTKzawD8zFKXgXa7XBwqck6BR",
   "description" : "",
   "index" : 1,
   "m" : 2,
   "multisig-script" : "2 [ 02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9 ]  [ 03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e ]  [ 03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02 ] 3 checkmultisig",
   "n" : 3,
   "public-keys" : 
   [
     "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9",
     "03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e",
     "03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02"
   ],
   "self-publickey" : "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9"
}
```
### 3. 往多重签名地址发送币
参与者按照合同需求往创建的多重签名地址上发送虚拟货币。

### 4. 发起多重签名交易
某个参与者通过 `createmultisigtx` 使用多重签名地址发起一笔多重签名交易；可以使用 `decoderawtx` 命令查看该交易详情。
范例中 Cindy 发起一笔从多重签名地址转账 `3344 `个虚拟币的交易。
```
命令：
$ ./mvs-cli createmultisigtx Cindy C123456 39hh1NY9xyTKzawD8zFKXgXa7XBwqck6BR MHaKHUFwAdcszvQarCmn1Rkq2uRoPQjZwm 3344

输出：
02000000016453713104d144387553bcb0fa457f40d2dc5fb916bd9e2256835a4b6de48d4c00000000b500483045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e3014c69522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253aeffffffff02100d0000000000001976a9146a20e940e8d7be0a49c598e91fa79c8b36e5353588ac0100000000000000d0fb01000000000017a91457e1a19e5ee4c0065f8fd76b0351fa145e44435a87010000000000000000000000
```

通过 `decoderawtx` 查看该交易详情：
```
命令：
$ ./mvs-cli decoderawtx "02000000016453713104d144387553bcb0fa457f40d2dc5fb916bd9e2256835a4b6de48d4c00000000b500483045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e3014c69522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253aeffffffff02100d0000000000001976a9146a20e940e8d7be0a49c598e91fa79c8b36e5353588ac0100000000000000d0fb01000000000017a91457e1a19e5ee4c0065f8fd76b0351fa145e44435a87010000000000000000000000"

输出：
{
  "transaction" : 
  {
    "hash" : "69c044be3c137f0bb34908be257acbb8157877bc57976a25881ed942384a9a61",
    "inputs" : 
    [
      {
        "address" : "39hh1NY9xyTKzawD8zFKXgXa7XBwqck6BR",
        "previous_output" : 
        {
          "hash" : "4c8de46d4b5a8356229ebd16b95fdcd2407f45fab0bc53753844d10431715364",
          "index" : 0
        },
        "script" : "zero [ 3045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e301 ] [ 522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253ae ]",
        "sequence" : 4294967295
      }
    ],
    "lock_time" : "0",
    "outputs" : 
    [
      {
        "address" : "MHaKHUFwAdcszvQarCmn1Rkq2uRoPQjZwm",
        "attachment" : 
        {
          "type" : "etp"
        },
        "index" : 0,
        "locked_height_range" : 0,
        "script" : "dup hash160 [ 6a20e940e8d7be0a49c598e91fa79c8b36e53535 ] equalverify checksig",
        "value" : 3344
      },
      {
        "address" : "39hh1NY9xyTKzawD8zFKXgXa7XBwqck6BR",
        "attachment" : 
        {
          "type" : "etp"
        },
        "index" : 1,
        "locked_height_range" : 0,
        "script" : "hash160 [ 57e1a19e5ee4c0065f8fd76b0351fa145e44435a ] equal",
        "value" : 130000
      }
    ],
    "version" : "2"
  }
}
```
注意观察输出中的 `transaction:inputs:script` 项，该项中存放签名详细，格式为：`[zero 签名1 签名2 ... 签名m 多重签名交易的endorsement]`。从元界区块链命令`createmultisigtx`命令输出的交易信息看，脚本中只包含一个签名，也就是多重签名交易创建者的签名默认就包含在内了。

### 5. 参与者签名
其他参与者依次通过 `signmultisigtx` 对多重签名交易进行签名，每一个参与者通过链下的方式从前一个签名参与者获得已部分签名的交易。

由于元界区块链命令 `createmultisigtx`  默认包含交易创建者的签名，因此这里只需要其它 `m -1` 个参与者的签名即可。用户 `Alice` 从用户 `Cindy` 处获得 `createmultisigtx` 创建的 `raw` 交易信息，以此作为输入进行签名：
```
命令：
$ ./mvs-cli signmultisigtx Alice A123456 "02000000016453713104d144387553bcb0fa457f40d2dc5fb916bd9e2256835a4b6de48d4c00000000b500483045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e3014c69522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253aeffffffff02100d0000000000001976a9146a20e940e8d7be0a49c598e91fa79c8b36e5353588ac0100000000000000d0fb01000000000017a91457e1a19e5ee4c0065f8fd76b0351fa145e44435a87010000000000000000000000"

输出：
{
    "rawtx" : "02000000016453713104d144387553bcb0fa457f40d2dc5fb916bd9e2256835a4b6de48d4c00000000fdfd0000483045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e3014730440220018b6a113d89de18b6c3c7090758cf9e4ca24e7762a2796b872bf6d2d1015b96022046b4518aa9451e617dff9467db7fe0c0d45811d0884faed51e343fec2c4579ff014c69522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253aeffffffff02100d0000000000001976a9146a20e940e8d7be0a49c598e91fa79c8b36e5353588ac0100000000000000d0fb01000000000017a91457e1a19e5ee4c0065f8fd76b0351fa145e44435a87010000000000000000000000"
}
```

这里依然通过 `decoderawtx` 查看该交易详情：
```
命令：
$ ./mvs-cli decoderawtx "02000000016453713104d144387553bcb0fa457f40d2dc5fb916bd9e2256835a4b6de48d4c00000000fdfd0000483045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e3014730440220018b6a113d89de18b6c3c7090758cf9e4ca24e7762a2796b872bf6d2d1015b96022046b4518aa9451e617dff9467db7fe0c0d45811d0884faed51e343fec2c4579ff014c69522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253aeffffffff02100d0000000000001976a9146a20e940e8d7be0a49c598e91fa79c8b36e5353588ac0100000000000000d0fb01000000000017a91457e1a19e5ee4c0065f8fd76b0351fa145e44435a87010000000000000000000000"

输出：
{
  "transaction" : 
  {
    "hash" : "d791b2e0ca6eeb9b5521766b051d54f3659c775dceb39c478ebd0a549bb6d2b4",
    "inputs" : 
    [
      {
        "address" : "39hh1NY9xyTKzawD8zFKXgXa7XBwqck6BR",
        "previous_output" : 
        {
          "hash" : "4c8de46d4b5a8356229ebd16b95fdcd2407f45fab0bc53753844d10431715364",
          "index" : 0
        },
        "script" : "zero [ 3045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e301 ] [ 30440220018b6a113d89de18b6c3c7090758cf9e4ca24e7762a2796b872bf6d2d1015b96022046b4518aa9451e617dff9467db7fe0c0d45811d0884faed51e343fec2c4579ff01 ] [ 522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253ae ]",
        "sequence" : 4294967295
      }
    ],
    "lock_time" : "0",
    "outputs" : 
    [
      {
        "address" : "MHaKHUFwAdcszvQarCmn1Rkq2uRoPQjZwm",
        "attachment" : 
        {
          "type" : "etp"
        },
        "index" : 0,
        "locked_height_range" : 0,
        "script" : "dup hash160 [ 6a20e940e8d7be0a49c598e91fa79c8b36e53535 ] equalverify checksig",
        "value" : 3344
      },
      {
        "address" : "39hh1NY9xyTKzawD8zFKXgXa7XBwqck6BR",
        "attachment" : 
        {
          "type" : "etp"
        },
        "index" : 1,
        "locked_height_range" : 0,
        "script" : "hash160 [ 57e1a19e5ee4c0065f8fd76b0351fa145e44435a ] equal",
        "value" : 130000
      }
    ],
    "version" : "2"
  }
}
```
对比前一次交易输出中的 `transaction:inputs:script` 项，可以看到签名脚本项目中多了用户 `Alice` 的签名。

### 6. 广播交易
通过 `sendrawtx` 广播拥有足够多签名的多重签名交易。
范例中 `m:n` 为 `2:3`，也就是说只需要 `3` 个签名中的 `2` 个进行签名，交易即可通过验证，现在用户 `Cindy` 以及 `Alice` 都进行了签名，因此可以广播用户 `Alice` 签名之后的 `raw` 交易，发送到链上让矿工们去打包验证该交易。
```
$ ./mvs-cli sendrawtx  "02000000016453713104d144387553bcb0fa457f40d2dc5fb916bd9e2256835a4b6de48d4c00000000fdfd0000483045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e3014730440220018b6a113d89de18b6c3c7090758cf9e4ca24e7762a2796b872bf6d2d1015b96022046b4518aa9451e617dff9467db7fe0c0d45811d0884faed51e343fec2c4579ff014c69522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253aeffffffff02100d0000000000001976a9146a20e940e8d7be0a49c598e91fa79c8b36e5353588ac0100000000000000d0fb01000000000017a91457e1a19e5ee4c0065f8fd76b0351fa145e44435a87010000000000000000000000"
```
