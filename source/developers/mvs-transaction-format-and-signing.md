title: Transaction format and signing
comments: false
---

# Transaction format

metaverse transactions are mostly the same as `Bitcoin`, Only the transaction Output is extended with attachment.

ref. <https://github.com/bitcoinbook/bitcoinbook/blob/develop/ch06.asciidoc#transactions>

## Transaction

Exactly the same as `Bitcoin`

* struct

```
uint32_t version;
uint32_t locktime;
input::list inputs;
output::list outputs;
```

* transaction version

```
0 : null version
1 : first version
2 : check output script
3 : nova special testnet transaction (only for some tx can't pass validation)
4 : nova transaction
```

>`Genesis transaction` version is recommend to 0.  
>`Coinbase transaction` version is recommend to 1.  
>`Coinstake transaction` version is recommend to 2.  
>`All the other transactions'` version are recommend to the latest version (at present 4). 
>
> NOTICE:
>>* Do not use the transaction version to judge the transaction's kind.  
>>For example, use version 0 to judge a transaction is a genesis transaction,  
>> or use version 1 to judge a transaction is a coinbase transaction.

>>* If a transaction version >= 2, then the validation will check if all its outputs script pattern is standard. If has unkown script pattern, the transaction can not pass validation.

* serialization

```
void transaction::to_data(writer& sink) const
{
    sink.write_4_bytes_little_endian(version);
    sink.write_variable_uint_little_endian(inputs.size());

    for (const auto& input: inputs)
        input.to_data(sink);

    sink.write_variable_uint_little_endian(outputs.size());

    for (const auto& output: outputs)
        output.to_data(sink);

    sink.write_4_bytes_little_endian(locktime);
}
```

## Transaction Input

Exactly the same as `Bitcoin`

ref. <https://github.com/bitcoinbook/bitcoinbook/blob/develop/ch06.asciidoc#transaction-inputs>

* struct

```
hash_digest hash; // 32 bytes
uint32_t index;
chain::script script;
uint32_t sequence;
```
* serialization

```
void input::to_data(writer& sink) const
{
    sink.write_hash(hash);
    sink.write_4_bytes_little_endian(index);
    script.to_data(sink, true);
    sink.write_4_bytes_little_endian(sequence);
}
```

## Transaction Output

Mostly the same as `Bitcoin`.
Extent with an attachment data for metaverse extended functions (Asset, Cert, DID, MIT, etc).

Please see [Output-attachment](mvs-transaction-format-and-signing.html#Output-attachment) for more info.

* struct

```
uint64_t value;
chain::script script;
chain::attachment attachment; // Extended field
```
* serialization

```
sink.write_8_bytes_little_endian(value);
script.to_data(sink, true);
attachment.to_data(sink);
```

## Script

Almost the same as `Bitcoin`

ref. <https://github.com/bitcoinbook/bitcoinbook/blob/develop/ch06.asciidoc#transaction-scripts-and-script-language>

Except the following difference:

* operation code

> OP\_CHECKATTENUATIONVERIFY has op code of 178 (**newly added for Asset lock**)  
> OP\_CHECKSEQUENCEVERIFY has op code of 179 (**while Bitcoin is 178**)

* script pattern

> add `pay_blackhole_address` (**for Burn transaction**)  
> add `pay_key_hash_with_attenuation_model` (**for Asset lock transaction**)

***

* struct

```
operation::stack operations; // vector of operation

struct operation {
    opcode code;
    std::vector<uint8_t> data;
}
```

* serialization

```
// prefix is true in signing
void script::to_data(writer& sink, bool prefix) const
{
    if (prefix)
        sink.write_variable_uint_little_endian(satoshi_content_size());

    if ((operations.size() > 0) && (operations[0].code == opcode::raw_data)) {
        operations[0].to_data(sink);
    } else {
        for (const auto& op: operations)
            op.to_data(sink);
    }
}
```

## Output attachment

* struct

```
uint32_t version;
uint32_t type;
std::string todid;
std::string fromdid;
boost::variant<
    etp,
    etp_award, // unused
    asset,
    blockchain_message,
    did,
    asset_cert,
    asset_mit
> attach;
```

* attachment version

```
1   : normal
207 : did related
```

* attachment type

```
0 : etp
1 : etp_award // unused
2 : asset
3 : message
4 : did
5 : asset_cert
6 : asset_mit
```

* serialization

```
void attachment::to_data_t(writer& sink) const
{
    sink.write_4_bytes_little_endian(version);
    sink.write_4_bytes_little_endian(type);
    if (version == 207) {
        sink.write_string(todid);
        sink.write_string(fromdid);
    }
    attach.to_data(sink); // visit boost::variant
}
```

***

### `etp` attachment

Empty.  
Nothing to serialize.

### `asset` attachment

* struct

```
uint32_t status; // 1 for issue, 2 for transfer
boost::variant<asset_detail, asset_transfer> data;
```

* serialization

```
void asset::to_data(writer& sink) const
{
    sink.write_4_bytes_little_endian(status);
    data.to_data(sink); // visit boost::variant
}
```

#### 1. `asset_detail`
* struct

```
std::string symbol;      // < 64 bytes
uint64_t maximum_supply;
uint8_t decimal_number;
uint8_t secondaryissue_threshold;
uint8_t unused2;
uint8_t unused3;
std::string issuer;      // < 64 bytes
std::string address;     // < 64 bytes
std::string description; // < 64 bytes
```

* serialization

```
void asset_detail::to_data(writer& sink) const
{
    sink.write_string(symbol);
    sink.write_8_bytes_little_endian(maximum_supply);
    sink.write_byte(decimal_number);
    sink.write_byte(secondaryissue_threshold);
    sink.write_byte(unused2);
    sink.write_byte(unused3);
    sink.write_string(issuer);
    sink.write_string(address);
    sink.write_string(description);
}
```

#### 2. `asset_transfer`

* struct

```
std::string symbol; // < 64 bytes
uint64_t quantity;  // = 8 bytes
```

* serialization

```
void asset_transfer::to_data(writer& sink) const
{
    sink.write_string(symbol);
    sink.write_8_bytes_little_endian(quantity);
}
```

### `blockchain_message` attachment

* struct

```
std::string content; // < 253 bytes
```

* serialization

```
void message::to_data(writer& sink) const
{
    sink.write_string(content);
}
```

### `did` attachment

* struct

```
uint32_t status;     // 1 for register, 2 for transfer
std::string symbol;  // < 64 bytes
std::string address; // < 64 bytes
```

* serialization

```
void did::to_data(writer& sink) const
{
    sink.write_4_bytes_little_endian(status);
    sink.write_string(symbol);
    sink.write_string(address);
}
```

### `asset_cert` attachment

* struct

```
std::string symbol;   // < 64 bytes
std::string owner;    // < 64 bytes
std::string address;  // < 64 bytes
uint32_t cert_type;   // = 4 bytes
uint8_t status;       // = 1 byte
std::string content;  // < 64 bytes
```

* cert type

```
1 : issue
2 : domain
3 : naming
0x60000004 : mining
5 : witness

0x80000000 : marriage
0x80000001 : kyc
```

* serialization

```
void asset_cert::to_data(writer& sink) const
{
    sink.write_string(symbol);
    sink.write_string(owner);
    sink.write_string(address);
    sink.write_4_bytes_little_endian(cert_type);
    sink.write_byte(status);

    if (has_content()) { // only write in issuing *mining* asset cert
        sink.write_string(content);
    }
}
```

### `asset_mit` attachment

* struct

```
uint8_t status.      // 1 for register, 2 for transfer
std::string symbol;  // < 64 bytes
std::string address; // < 64 bytes
std::string content; // < 256 bytes
```

* serialization

```
void asset_mit::to_data(writer& sink) const
{
    sink.write_byte(status);
    sink.write_string(symbol);
    sink.write_string(address);

    if (is_register_status()) { // don't write in transfer case
        sink.write_string(content);
    }
}
```

# Transaction signing

Exactly the same as `Bitcoin`

ref. <https://github.com/bitcoinbook/bitcoinbook/blob/develop/ch06.asciidoc#digital-signatures-ecdsa>

## Signing use RPC API

First install and run a metaverse full node.  
ref. <https://mvs.org/wallet.html> and <https://docs.mvs.org/docs/>

ref. <https://docs.mvs.org/api_v3/rawtx.html>

* use `createrawtx` to create metaverse raw transaction

* use `decoderawtx` to decode raw transaction to json string

* use `signrawtx` to sign raw transaction

* use `sendrawtx` to broadcast signed transaction

_You can combine the above APIs to check and verify your own implementation of creating and signing metaverse transaction._
