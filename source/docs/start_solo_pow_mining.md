title: Start solo PoW mining
comments: false
---

# How to mine
## 1. Start mining

You can simply use the startmining command to start mining. The default concensus is PoW.

```
$ ./mvs-cli startmining account_name password
```

## 2. Setup mining account

Optionally, you can use setminingaccount in order to choose which address will be used to mine, and optionally add a MST to be mined (see the section [MST mining](mst_mining.html)). These options should be set before starting mining.

```
$ ./mvs-cli setminingaccount account_name password payment_address -s mst_to_mine
```

## 3. Stop mining

To stop mininig, use the stopmining command without any parameter.

```
$ ./mvs-cli stopmining
```