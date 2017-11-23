title: 搭建私有链
comments: false
---

## 参照[编译]和[配置选项]
参照上述文档，我们可以通过配置配置文件，搭建基于元界的私有链，而不必改动代码。

```bash
# mvs configuration file exmaple

[network]
# The magic number for message headers
identifier = 0x6d73766d
# The port for incoming connections, defaults to 5251 (15251 for testnet).
inbound_port = 5251
```

通过修改 `identifier` 为不同的值，我们即可实现不同的区块链实例。
即使是以主网模式运行，开发者也不必担心，主网的出块速度也是很快的，可以使用CPU挖矿继续测试。
