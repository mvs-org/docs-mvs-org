title: Command line usage
comments: false
---

# mvsd usage
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

## Designate the data folder directory
```bash
mvsd -D D:\MVS\ChainData\Metaverse
```

# mvs-cli usage 

## Register
```bash
mvs-cli getnewaccount chenhao chenhao
```

## Create 10 addresses
```bash
mvs-cli getnewaddress -n 10 chenhao chenhao
```

## list all addresses of this account

```bash
mvs-cli listaddresses chenhao chenhao
```

## Get the total account balance

```bash
mvs-cli getbalance chenhao chenhao
```

## Get balance details
```bash
mvs-cli listbalances chenhao chenhao
```

## Query transaction according to transaction ID
```bash
mvs-cli gettransaction 6f2ee246af04f226dbf598749db885e44830eac61f065069dfd8d790fc58d7c0
mvs-cli fetch-tx 6f2ee246af04f226dbf598749db885e44830eac61f065069dfd8d790fc58d7c0
```

## Send ETP to the designated address

```bash
# Automatically group changes from account addresses
mvs-cli send chenhao chenhao  tUop3B6TJMHUSVM4jxyGgaf2rJ8wENiGtQ 100000000

# Default change to sending address
mvs-cli sendfrom chenhao chenhao tVfAVefMQ2xifDyW5fNqRbH7qSxpuUDypt tUop3B6TJMHUSVM4jxyGgaf2rJ8wENiGtQ 100000000

# Automatically group changes from account addresses, then option –m to specify a change address
mvs-cli sendmore chenhao chenhao -r tUop3B6TJMHUSVM4jxyGgaf2rJ8wENiGtQ:100000000 -m tPpZzPL99rLqYZpfn4ZdCXHinzDg8ZY3Kp
```

## List the assets under the account
```bash
mvs-cli getaccountasset chenhao chenhao
```

## List the assets under the account
```bash
mvs-cli getaccountasset chenhao chenhao
```

## Send asset
```bash
sendassetfrom mvs_test1 123456 t7h5b9svF5yXS8jPU7SzeRjDtsw8nAEA5N tCYBVEZPvRcPfiTGycY161kssPamedUDTR WANDASHEN1 10
```

