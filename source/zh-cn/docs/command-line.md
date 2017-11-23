title: 命令行使用
comments: false
---

# mvsd的使用方式
## 以守护进程的方式启动
```bash
mvsd -d
```

## 以测试网的模式启动
```bash
mvsd -t
```

## 查看mvsd的版本
```bash
mvsd -v
```

## 查看mvsd的帮助信息
```bash
mvsd -h
```

## 指定数据文件夹目录
```bash
mvsd -D D:\MVS\ChainData\Metaverse
```

# mvs-cli的使用方式
## 创建账户
```bash
mvs-cli getnewaccount chenhao chenhao
```

## 生成10个地址
```bash
mvs-cli getnewaddress -n 10 chenhao chenhao
```

## 查看账户下所有地址
```bash
mvs-cli listaddresses chenhao chenhao
```

## 查看账户总余额
```bash
mvs-cli getbalance chenhao chenhao
```

## 查看账户明细余额
```bash
mvs-cli listbalances chenhao chenhao
```

## 根据交易ID查询交易
```bash
mvs-cli gettransaction 6f2ee246af04f226dbf598749db885e44830eac61f065069dfd8d790fc58d7c0
mvs-cli fetch-tx 6f2ee246af04f226dbf598749db885e44830eac61f065069dfd8d790fc58d7c0
```

## 发送ETP到指定地址
### 自动归集账户零钱的方式
```bash
mvs-cli send chenhao chenhao  tUop3B6TJMHUSVM4jxyGgaf2rJ8wENiGtQ 100000000
```

### 默认找零到发送地址的方式
```bash
mvs-cli sendfrom chenhao chenhao tVfAVefMQ2xifDyW5fNqRbH7qSxpuUDypt tUop3B6TJMHUSVM4jxyGgaf2rJ8wENiGtQ 100000000
```

### 自动归集账户零钱，且 -m 指定找零地址的方式
```bash
mvs-cli sendmore chenhao chenhao -r tUop3B6TJMHUSVM4jxyGgaf2rJ8wENiGtQ:100000000 -m tPpZzPL99rLqYZpfn4ZdCXHinzDg8ZY3Kp
```

## 查询账户下资产
```bash
mvs-cli getaccountasset chenhao chenhao
```

## 查询账户下资产
```bash
mvs-cli getaccountasset chenhao chenhao
```

## 发送资产
```bash
sendassetfrom mvs_test1 123456 t7h5b9svF5yXS8jPU7SzeRjDtsw8nAEA5N tCYBVEZPvRcPfiTGycY161kssPamedUDTR WANDASHEN1 10
```
