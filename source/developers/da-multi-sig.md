title: MST Multi-signature
---

## Introduction
A multi-signature address is an address that is associated with more than one ECDSA private key. The simplest type is an m-of-n address - it is associated with n private keys, and sending possession from this address requires signatures from at least m keys. A multi-signature transaction is one that sends possession from a multi-signature address.

For example：
> 1-of-2: Husband and wife petty cash joint account — the signature of either spouse is sufficient to spend the funds.  
> 2-of-2: Husband and wife savings account — both signatures are required to spend the funds, preventing one spouse from spending the money without the approval of the other.  

## Use Multi-signature
1. Every participator gets the public-key of an address by command `getpublickey` and let others known the public-key. The corresponding private-key will be used to signature multi-signature transaction later.  
2. Every participator creates a multi-signature address by command `getnewmultisig` with the public-key got in step 1 and same constraints(that means same `m`, `n` and `public-keys`). A multi-signature address is called `P2SH（Pay-to-Script-Hash）`, it starts with number `3`. The multi-signature addresses created by participators should be the same.  
3. One participator creates a multi-signature transaction by command `createmultisigtx` with the multi-signature addresses created in step 2. The content of the multi-signature transaction can be decoded by command  `decoderawtx`.  
4. `m` participators signature the multi-signature transaction successively by command `signmultisigtx`. They signature and send the output to the next participator.  
5. After m participators signatured, broadcast the multi-signature transaction to Metaverse network by command `sendrawtx`.  

## Commands related to Multi-signature
The following commands allow you to use multi-signature in Metaverse:
> [getpublickey](multisig.html#getpublickey)  
> [getnewmultisig](multisig.html#getnewmultisig)  
> [listmultisig](multisig.html#listmultisig)  
> [deletemultisig](multisig.html#deletemultisig)  
> [createmultisigtx](multisig.html#createmultisigtx)  
> [signmultisigtx](multisig.html#signmultisigtx)  
> [sendrawtx](rawtx.html#sendrawtx)  
> [decoderawtx](rawtx.html#decoderawtx)  

> [registerdid](identity.html#registerdid)  
> [didchangeaddress](identity.html#didchangeaddress)    
> [transfercert](asset.html#transfercert)  
> [transfermit](mit.html#transfermit)  

## Example
The following example involves three accounts：`Alice`，`Bob` and `Cindy`. For more detail of the commands, please refer to [API_v3_multisig](/api_v3/multisig.html).

### 1. Get and inform public-key
Every participator gets the public-key of an address by command `getpublickey` and let others known the public-key.
```
// Alice gets the public-key of an address of she.
Command：
$ ./mvs-cli getpublickey Alice A123456 "MCJ6vpdCYsVD34XFC22fhqDLfHo7ZtnyM2"

Output：
{
  "address" : "MCJ6vpdCYsVD34XFC22fhqDLfHo7ZtnyM2",
  "public-key" : "03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e"
}

// Bob gets the public-key of an address of he.
Command：
$ ./mvs-cli getpublickey Bob B123456 MHaKHUFwAdcszvQarCmn1Rkq2uRoPQjZwm

Output：
{
  "address" : "MHaKHUFwAdcszvQarCmn1Rkq2uRoPQjZwm",
  "public-key" : "03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02"
}

// Cindy gets the public-key of an address of she.
Command：
$ ./mvs-cli getpublickey Cindy C123456 MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m

Output：
{
  "address" : "MKXa7mtzNaGCEF9vM2sUmmTS93iDpHYd4m",
  "public-key" : "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9"
}
```

### 2. Create a multi-signature address
Every participator creates a same multi-signature address by command `getnewmultisig` with the public-key got in step 1 and same constraints(that means same `m`, `n` and `public-keys`). 

For example, every participator creates a same multi-signature address by command `getnewmultisig` with option option `m` setted to 2, option `n` setted to 3, option `-s` for self public-key and options `-k` for other's public-keys. Finally the get the same multi-signature address `39hh1NY9xyTKzawD8zFKXgXa7XBwqck6BR`.  
```
// Alice creates a multi-signature address
Command：
$ ./mvs-cli getnewmultisig Alice A123456 -m 2 -n 3 -s "03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e" -k "03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02" -k "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9" -d "multisig test"

Output：
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
// Bob creates a multi-signature address
Command：
$ ./mvs-cli getnewmultisig Bob B123456 -m 2 -n 3 -s "03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02" -k "03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e" -k "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9" -d "multisig test"

Output：
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
// Cindy creates a multi-signature address
Command：
$ ./mvs-cli getnewmultisig Cindy C123456 -m 2 -n 3 -s "02729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b9" -k "03f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e02" -k "03d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e" -d "multisig test"

Output：
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

### 3. Send ETP to the multi-signature address
Participators send ETP to the multi-signature address by command `send` or `sendfrom` accord to their contract.

### 4. Create a multi-signature transaction
One participator creates a multi-signature transaction to spend ETP on the multi-signature address by command  `createmultisigtx`. The detail of the transaction can be displayed by command `decoderawtx`.

For example, `Cindy` creates a multi-signature transaction to send ETP from the multi-signature address to address `MHaKHUFwAdcszvQarCmn1Rkq2uRoPQjZwm`.  
```
Command：
$ ./mvs-cli createmultisigtx Cindy C123456 39hh1NY9xyTKzawD8zFKXgXa7XBwqck6BR MHaKHUFwAdcszvQarCmn1Rkq2uRoPQjZwm 3344

Output：
02000000016453713104d144387553bcb0fa457f40d2dc5fb916bd9e2256835a4b6de48d4c00000000b500483045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e3014c69522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253aeffffffff02100d0000000000001976a9146a20e940e8d7be0a49c598e91fa79c8b36e5353588ac0100000000000000d0fb01000000000017a91457e1a19e5ee4c0065f8fd76b0351fa145e44435a87010000000000000000000000
```

Display the detail of the multi-signature transaction by command `decoderawtx`.  
```
Command：
$ ./mvs-cli decoderawtx "02000000016453713104d144387553bcb0fa457f40d2dc5fb916bd9e2256835a4b6de48d4c00000000b500483045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e3014c69522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253aeffffffff02100d0000000000001976a9146a20e940e8d7be0a49c598e91fa79c8b36e5353588ac0100000000000000d0fb01000000000017a91457e1a19e5ee4c0065f8fd76b0351fa145e44435a87010000000000000000000000"

Output：
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
The format of field `transaction:inputs:script` in output is `[zero signature-1 signature-2 ... signature-m endorsement]`. `Cindy`'s signature is already included in field `transaction:inputs:script`. 

### 5. Ohter participators signature
 Other participators signature the multi-signature transaction successively by command `signmultisigtx`. They signature and send the output to next participator.  

`Alice` gets the raw transaction from `Cindy` and signatures.
```
Command：
$ ./mvs-cli signmultisigtx Alice A123456 "02000000016453713104d144387553bcb0fa457f40d2dc5fb916bd9e2256835a4b6de48d4c00000000b500483045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e3014c69522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253aeffffffff02100d0000000000001976a9146a20e940e8d7be0a49c598e91fa79c8b36e5353588ac0100000000000000d0fb01000000000017a91457e1a19e5ee4c0065f8fd76b0351fa145e44435a87010000000000000000000000"

Output：
02000000016453713104d144387553bcb0fa457f40d2dc5fb916bd9e2256835a4b6de48d4c00000000fdfd0000483045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e3014730440220018b6a113d89de18b6c3c7090758cf9e4ca24e7762a2796b872bf6d2d1015b96022046b4518aa9451e617dff9467db7fe0c0d45811d0884faed51e343fec2c4579ff014c69522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253aeffffffff02100d0000000000001976a9146a20e940e8d7be0a49c598e91fa79c8b36e5353588ac0100000000000000d0fb01000000000017a91457e1a19e5ee4c0065f8fd76b0351fa145e44435a87010000000000000000000000
```

Display the detail of the transaction by command `decoderawtx`.  
```
Command：
$ ./mvs-cli decoderawtx "02000000016453713104d144387553bcb0fa457f40d2dc5fb916bd9e2256835a4b6de48d4c00000000fdfd0000483045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e3014730440220018b6a113d89de18b6c3c7090758cf9e4ca24e7762a2796b872bf6d2d1015b96022046b4518aa9451e617dff9467db7fe0c0d45811d0884faed51e343fec2c4579ff014c69522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253aeffffffff02100d0000000000001976a9146a20e940e8d7be0a49c598e91fa79c8b36e5353588ac0100000000000000d0fb01000000000017a91457e1a19e5ee4c0065f8fd76b0351fa145e44435a87010000000000000000000000"

Output：
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
Now, `Alice`'s signature is already included in field `transaction:inputs:script` too. 

### 6. Broadcast the multi-signature transaction
After `Alice` and `Cindy` signatured, `Alice` broadcasts the multi-signature transaction to Metaverse network.
```
$ ./mvs-cli sendrawtx "02000000016453713104d144387553bcb0fa457f40d2dc5fb916bd9e2256835a4b6de48d4c00000000fdfd0000483045022100cbfdda943648344dc03fd92a905072082af93dfd4f166e3d1bb258e3437069790220321ee22c6a2543392909e21cd347d009a6d32173c23700424b45b4592d4075e3014730440220018b6a113d89de18b6c3c7090758cf9e4ca24e7762a2796b872bf6d2d1015b96022046b4518aa9451e617dff9467db7fe0c0d45811d0884faed51e343fec2c4579ff014c69522102729cae0c16009f44440f306b76fafb7a7d2503741a619c15b41ff927c1afd6b92103d29f0b96f332e50d6014cb91c334214ecb8caf2881a97e7d944bdf4e5fd6a39e2103f97e079ccae21e1ee65d5ee64e5c27d7d6ce9a867cec75e9736ad5f258329e0253aeffffffff02100d0000000000001976a9146a20e940e8d7be0a49c598e91fa79c8b36e5353588ac0100000000000000d0fb01000000000017a91457e1a19e5ee4c0065f8fd76b0351fa145e44435a87010000000000000000000000"
```
