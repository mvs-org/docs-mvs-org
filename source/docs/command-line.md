title: Command line usage
comments: false
---

***
# mvsd usage
```help
Usage: mvsd [-dhistv] [--datadir value] [--config value] [--ui value]

Info: Runs a full metaverse node in the global peer-to-peer network.

Options (named):

-D [--datadir]       Specify mvsd workspace path.
-c [--config]        Specify path to a configuration settings file based
                     on path ~/.metaverse
-d [--daemon]        Run in daemon mode (unix/apple).
-h [--help]          Display command line options.
-i [--initchain]     Initialize blockchain in the configured directory.
-s [--settings]      Display all configuration settings.
-t [--testnet]       Use testnet rules for determination of work
                     required, defaults to false.
-v [--version]       Display version information.
```
***
## Start with the daemon process

```bash
mvsd -d
```

## Start with the test network mode
```bash
mvsd -t
```

## Get the mvsd version
```bash
mvsd -v
```

## Check out mvsd's help information
```bash
mvsd -h
```

## Specify database path
```bash
mvsd -D D:\MVS\ChainData\Metaverse
```

## Specify path to a configuration settings file
**based on path ~/.metaverse**
```bash
mvsd -c
```

## Initialize blockchain in the configured directory
```bash
mvsd -i
```

## Display all configuration settings
```bash
mvsd -s
```

***
# mvs-cli usage
***

Obviously, Use `help` to get all commands(methods) list.
```bash
$ ./mvs-cli help
$ ./mvs-cli help $command or ./mvs-cli $command -h
```

***
## Account
***

### getnewaccount
```help
Usage: mvs-cli getnewaccount [-h] [--language value] ACCOUNTNAME
ACCOUNTAUTH

Info: Generate a new account from this wallet.

Options (named):

-h [--help]          Get a description and instructions for this command.
-l [--language]      Options are 'en', 'es', 'ja', 'zh_Hans', 'zh_Hant'
                     and 'any', defaults to 'en'.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
### validateaddress
```help
Usage: mvs-cli validateaddress [-h] [PAYMENT_ADDRESS]

Info: validateaddress

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

PAYMENT_ADDRESS      Valid payment address. If not specified the address
                     is read from STDIN.
```
### importaccount
```help
Usage: mvs-cli importaccount [-h] --accountname value --password value
[--hd_index value] [--language value] WORD

Info: importaccount

Options (named):

-h [--help]          Get a description and instructions for this command.
-i [--hd_index]      Teh HD index for the account.
-l [--language]      The language identifier of the dictionary of the
                     mnemonic. Options are 'en', 'es', 'ja', 'zh_Hans',
                     'zh_Hant' and 'any', defaults to 'any'.
-n [--accountname]   Account name required.
-p [--password]      Account password(authorization) required.

Arguments (positional):

WORD                 The set of words that that make up the mnemonic. If
                     not specified the words are read from STDIN.
```
### importkeyfile
```help
Usage: mvs-cli importkeyfile [-h] FILE

Info: importkeyfile

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

FILE                 account info file path
```
### dumpkeyfile
```help
Usage: mvs-cli dumpkeyfile [-h] ACCOUNTNAME ACCOUNTAUTH LASTWORD
[DESTINATION]

Info: dumpkeyfile

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
LASTWORD             The last word of your master private-key phrase.
DESTINATION          The keyfile storage path to.
```
### getnewaddress
```help
Usage: mvs-cli getnewaddress [-h] [--number value] ACCOUNTNAME
ACCOUNTAUTH

Info: Generate new address for this account.

Options (named):

-h [--help]          Get a description and instructions for this command.
-n [--number]        The address count.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
### listaddresses
```help
Usage: mvs-cli listaddresses [-h] ACCOUNTNAME ACCOUNTAUTH

Info: List available addresses of this account.

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
### changepasswd
```help
Usage: mvs-cli changepasswd [-h] --password value ACCOUNTNAME ACCOUNTAUTH

Info: changepasswd

Options (named):

-h [--help]          Get a description and instructions for this command.
-p [--password]      The new password.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
### deleteaccount
```help
Usage: mvs-cli deleteaccount [-h] ACCOUNTNAME ACCOUNTAUTH LASTWORD

Info: deleteaccount

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
LASTWORD             The last word of your private-key phrase.
```
### getaccount
```help
Usage: mvs-cli getaccount [-h] ACCOUNTNAME ACCOUNTAUTH LASTWORD

Info: Show account details

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
LASTWORD             The last word of your backup words.
```

***
## Blockchain
***

### shutdown
```help
Usage: mvs-cli shutdown [-h] [ACCOUNTNAME] [ACCOUNTAUTH]

Info: stop mvsd.

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME            Account name.
ACCOUNTAUTH            Account password/authorization.
```
### getinfo
```help
Usage: mvs-cli getinfo [-h]

Info: getinfo

Options (named):

-h [--help]          Get a description and instructions for this command.
```
### getheight
```help
Usage: mvs-cli getheight [-h]

Info: Get last height. Alias as fetch-height.

Options (named):

-h [--help]          Get a description and instructions for this command.
```
### getpeerinfo
```help
Usage: mvs-cli getpeerinfo [-h]

Info: getpeerinfo

Options (named):

-h [--help]          Get a description and instructions for this command.
```
### getmininginfo
```help
Usage: mvs-cli getmininginfo [-h]

Info: getmininginfo

Options (named):

-h [--help]          Get a description and instructions for this command.
```
### startmining
```help
Usage: mvs-cli startmining [-h] ACCOUNTNAME ACCOUNTAUTH

Info: start CPU solo mining. You have to setminingaccount firstly.

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
### stopmining
```help
Usage: mvs-cli stopmining [-h] [ACCOUNTNAME] [ACCOUNTAUTH]

Info: stop CPU solo mining.

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
### getwork
```help
Usage: mvs-cli getwork [-h] [ACCOUNTNAME] [ACCOUNTAUTH]

Info: getwork to get mining info

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Mining account name required.
ACCOUNTAUTH          Mining account password(authorization) required.
```
### addnode
```help
Usage: mvs-cli addnode [-h] ACCOUNTNAME ACCOUNTAUTH

Info: addnode

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
### setminingaccount
```help
Usage: mvs-cli setminingaccount [-h] ACCOUNTNAME ACCOUNTAUTH
PAYMENT_ADDRESS

Info: setminingaccount when pool mining.

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
PAYMENT_ADDRESS      the payment address of this account.
```
### submitwork
```help
Usage: mvs-cli submitwork [-h] NOUNCE HEADERHASH MIXHASH

Info: submitwork to submit mining result.

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

NOUNCE               nounce.
HEADERHASH           header hash.
MIXHASH              mix hash.
```
### getmemorypool
```help
Usage: mvs-cli getmemorypool [-h] [--json value]

Info: Returns all transactions in memory pool.

Options (named):

-h [--help]          Get a description and instructions for this command.
-j [--json]          Json format or Raw format, default is Json(true).
```

***
## Block
***

### getblock
```help
Usage: mvs-cli getblock [-h] HASH_OR_HEIGH [JSON] [TX_JSON]

Info: Get sepcified block header from wallet.

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

HASH_OR_HEIGH        block hash or block height
JSON                 Json/Raw format, default is '--json=true'.
TX_JSON              Json/Raw format for txs, default is
                     '--tx_json=true'.
```
### getblockheader
```help
Usage: mvs-cli getblockheader [-h] [--hash value] [--height value]

Info: getblockheader, alias as
fetch-header/getbestblockhash/getbestblockheader.

Options (named):

-h [--help]          Get a description and instructions for this command.
-s [--hash]          The Base16 block hash.
-t [--height]        The block height.

```

***
## ETP
***

### getbalance
```help
Usage: mvs-cli getbalance [-h] ACCOUNTNAME ACCOUNTAUTH

Info: Show total balance details of this account.

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
### listbalances
```help
Usage: mvs-cli listbalances [-hn] [--greater_equal value] [--lesser_equal
value] ACCOUNTNAME ACCOUNTAUTH

Info: List balance details of each address of this account. defaults show
non-zero unspent address.

Options (named):

-g [--greater_equal] Greater than ETP bits.
-h [--help]          Get a description and instructions for this command.
-l [--lesser_equal]  Lesser than ETP bits.
-n [--nozero]        Defaults to true.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
### deposit
```help
Usage: mvs-cli deposit [-h] [--address value] [--deposit value] [--fee
value] ACCOUNTNAME ACCOUNTAUTH AMOUNT

Info: Deposit some etp, then get reward for frozen some etp.

Options (named):

-h [--help]          Get a description and instructions for this command.
-a [--address]       The deposit target address.
-d [--deposit]       Deposits support [7, 30, 90, 182, 365] days.
                     defaluts to 7 days
-f [--fee]           Transaction fee. defaults to 10000 ETP bits

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
AMOUNT               ETP integer bits.
```
### send
```help
Usage: mvs-cli send [-h] [--fee value] [--memo value] ACCOUNTNAME
ACCOUNTAUTH TOADDRESS AMOUNT

Info: send etp to a targert address, mychange goes to another existed
address of this account.

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           Transaction fee. defaults to 10000 etp bits
-m [--memo]          Attached memo for this transaction.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
TOADDRESS            Send to this address
AMOUNT               ETP integer bits.
```
### sendfrom
```help
Usage: mvs-cli sendfrom [-h] [--fee value] [--memo value] ACCOUNTNAME
ACCOUNTAUTH FROMADDRESS TOADDRESS AMOUNT

Info: send etp from a specified address of this account to target
address, mychange goes to from_address.

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           Transaction fee. defaults to 10000 ETP bits
-m [--memo]          The memo to descript transaction

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
FROMADDRESS          Send from this address
TOADDRESS            Send to this address
AMOUNT               ETP integer bits.
```
### sendmore
```help
Usage: mvs-cli sendmore [-h] --receivers value [--fee value] [--mychange
value] ACCOUNTNAME ACCOUNTAUTH

Info: send etp to multi target addresses, must specify mychange address.
Eg: [sendmore $name $password -r $address1:$amount1 -r $address2:$amount2
-m $mychange_address]

Options (named):

-h [--help]          Send to more target.
-f [--fee]           Transaction fee. defaults to 10000 ETP bits
-m [--mychange]      Mychange to this address
-r [--receivers]     Send to [address:etp_bits].

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```

***
## Transaction
***

### gettx
```help
Usage: mvs-cli gettx [-h] HASH [JSON]

Info: gettx alias as fetch-tx/gettransaction

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

JSON                 Json/Raw format, default is '--json=true'.
HASH                 The Base16 transaction hash of the transaction to
                     get. If not specified the transaction hash is read
                     from STDIN.
```
### listtxs
```help
Usage: mvs-cli listtxs [-h] [--address value] [--height value] [--index
value] [--limit value] [--symbol value] ACCOUNTNAME ACCOUNTAUTH

Info: List transactions details of this account.

Options (named):

-h [--help]          Get a description and instructions for this command.
-a [--address]       Address.
-e [--height]        Get tx according height eg: -e
                     start-height:end-height will return tx between
                     [start-height, end-height)
-i [--index]         Page index.
-l [--limit]         Transaction count per page.
-s [--symbol]        Asset symbol.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```

***
## Asset
***

### createasset
```help
Usage: mvs-cli createasset [-h] --symbol value --volume value
[--description value] [--issuer value] [--decimalnumber value]
ACCOUNTNAME ACCOUNTAUTH

Info: createasset

Options (named):

-h [--help]          Get a description and instructions for this command.
-d [--description]   The asset description.
-i [--issuer]        The asset issuer.defaults to account name.
-n [--decimalnumber] The asset amount decimal number.
-s [--symbol]        The asset symbol/name. Global unique.
-v [--volume]        The asset maximum supply volume.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
### deletelocalasset
```help
Usage: mvs-cli deletelocalasset [-h] --symbol value ACCOUNTNAME
ACCOUNTAUTH

Info: deletelocalasset

Options (named):

-h [--help]          Get a description and instructions for this command.
-s [--symbol]        The asset symbol/name. Global unique.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
### getaccountasset
```help
Usage: mvs-cli getaccountasset [-h] ACCOUNTNAME ACCOUNTAUTH [SYMBOL]

Info: getaccountasset

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
SYMBOL               Asset symbol.
```
### getaddressasset
```help
Usage: mvs-cli getaddressasset [-h] ADDRESS

Info: getaddressasset

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ADDRESS              address
```
### getasset
```help
Usage: mvs-cli getasset [-h] [SYMBOL]

Info: Show existed assets details from MVS blockchain.

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

SYMBOL               Asset symbol. If not specified, will show whole
                     network asset symbols.
```
### issue
```help
Usage: mvs-cli issue [-h] [--fee value] ACCOUNTNAME ACCOUNTAUTH SYMBOL

Info: issue

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           The fee of tx. default_value 10 etp

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
SYMBOL               issued asset symbol
```
### issuefrom
```help
Usage: mvs-cli issuefrom [-h] [--fee value] ACCOUNTNAME ACCOUNTAUTH
ADDRESS SYMBOL

Info: issuefrom

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           The fee of tx. default_value 10 etp

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
ADDRESS              target address
SYMBOL               issued asset symbol
```
### listassets
```help
Usage: mvs-cli listassets [-h] [ACCOUNTNAME] [ACCOUNTAUTH]

Info: list assets details.

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
### sendasset
```help
Usage: mvs-cli sendasset [-h] [--fee value] ACCOUNTNAME ACCOUNTAUTH
ADDRESS SYMBOL AMOUNT

Info: sendasset

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           Transaction fee. defaults to 10000 ETP bits

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
ADDRESS              Asset receiver.
SYMBOL               Asset symbol/name.
AMOUNT               Asset integer bits. see asset <decimal_number>.
```
### sendassetfrom
```help
Usage: mvs-cli sendassetfrom [-h] [--fee value] ACCOUNTNAME ACCOUNTAUTH
FROMADDRESS TOADDRESS SYMBOL AMOUNT

Info: sendassetfrom

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           Transaction fee. defaults to 10000 ETP bits

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
FROMADDRESS          From address
TOADDRESS            Target address
SYMBOL               Asset symbol
AMOUNT               Asset integer bits. see asset <decimal_number>.
```

***
## Multi-Signatue
***

### createmultisigtx
```help
Usage: mvs-cli createmultisigtx [-h] [--fee value] ACCOUNTNAME
ACCOUNTAUTH FROMADDRESS TOADDRESS AMOUNT

Info: createmultisigtx

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           Transaction fee. defaults to 10000 ETP bits

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
FROMADDRESS          Send from this address
TOADDRESS            Send to this address
AMOUNT               ETP integer bits.
```
### getpublickey
```help
Usage: mvs-cli getpublickey [-h] ACCOUNTNAME ACCOUNTAUTH ADDRESS

Info: getpublickey

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
ADDRESS              Address.
```
### deletemultisig
```help
Usage: mvs-cli deletemultisig [-h] ACCOUNTNAME ACCOUNTAUTH ADDRESS

Info: deletemultisig

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
ADDRESS              The multisig script corresponding address.
```
### getnewmultisig
```help
Usage: mvs-cli getnewmultisig [-h] --signaturenum value --publickeynum
value --selfpublickey value [--description value] [--publickey value]
ACCOUNTNAME ACCOUNTAUTH

Info: getnewmultisig

Options (named):

-h [--help]          Get a description and instructions for this command.
-d [--description]   multisig record description.
-k [--publickey]     cosigner public key used for multisig
-m [--signaturenum]  Account multisig signature number.
-n [--publickeynum]  Account multisig public key number.
-s [--selfpublickey] the public key belongs to this account.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
### listmultisig
```help
Usage: mvs-cli listmultisig [-h] ACCOUNTNAME ACCOUNTAUTH

Info: listmultisig

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
```
### signmultisigtx
```help
Usage: mvs-cli signmultisigtx [-hb] ACCOUNTNAME ACCOUNTAUTH TRANSACTION

Info: signmultisigtx

Options (named):

-h [--help]          Get a description and instructions for this command.
-b [--broadcast]     Broadcast the tx if it is fullly signed.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
TRANSACTION          The input Base16 transaction to sign.
```

***
## Rawtx(offline-sign)
***

### createrawtx
```help
Usage: mvs-cli createrawtx [-h] --receivers value --senders value --type
value [--deposit value] [--fee value] [--message value] [--mychange
value] [--symbol value]

Info: createrawtx

Options (named):

-d [--deposit]       Deposits support [7, 30, 90, 182, 365] days.
                     defaluts to 7 days
-f [--fee]           Transaction fee. defaults to 10000 ETP bits
-h [--help]          Get a description and instructions for this command.
-i [--message]       Message/Information attached to this transaction
-m [--mychange]      Mychange to this address, includes etp and asset
                     change
-n [--symbol]        asset name, not specify this option for etp tx
-r [--receivers]     Send to [address:amount]. amount is asset number if
                     sybol option specified
-s [--senders]       Send from addresses
-t [--type]          Transaction type. 0 -- transfer etp, 1 -- deposit
                     etp, 3 -- transfer asset, 6 -- just only send
                     message


```
### signrawtx
```help
Usage: mvs-cli signrawtx [-h] ACCOUNTNAME ACCOUNTAUTH TRANSACTION

Info: signrawtx

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

ACCOUNTNAME          Account name required.
ACCOUNTAUTH          Account password(authorization) required.
TRANSACTION          The input Base16 transaction to sign.
```
### decoderawtx
```help
Usage: mvs-cli decoderawtx [-h] TRANSACTION

Info: decoderawtx

Options (named):

-h [--help]          Get a description and instructions for this command.

Arguments (positional):

TRANSACTION          The input Base16 transaction to sign.
```
### sendrawtx
```help
Usage: mvs-cli sendrawtx [-h] [--fee value] TRANSACTION

Info: sendrawtx

Options (named):

-h [--help]          Get a description and instructions for this command.
-f [--fee]           The max tx fee. default_value 10 etp

Arguments (positional):

TRANSACTION          The input Base16 transaction to broadcast.
```
