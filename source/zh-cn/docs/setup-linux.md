title: 安装Linux版本钱包
comments: false
---

到官网<https://mvs.org/wallet.html>下载Linux钱包客户端, 目前支持Linux 64bit。

安装包为标准版，同时还独立提供数据包供安装。

数据包包含已经同步好了的数据库，可以极大节省第一次的区块同步时间，建议新用户下载安装；由于数据包版可能会覆盖原始数据，建议老用户安装标准版。请根据您的情况选择是否安装数据包。
本文以v0.7.3为示例。

## 下载并解压标准版
```bash
# for zip balls
wget http://sfo.newmetaverse.org/mvs-download/mvs-linux-x86_64-v0.7.3.zip
unzip mvs-linux-x86_64-v0.7.3.zip
```
```bash
# for tarballs
wget http://sfo.newmetaverse.org/mvs-download/mvs-linux-x86_64-v0.7.5.tar.gz
tar -zxf mvs-linux-x86_64-v0.7.5.tar.gz
```
## 安装标准版
```bash
cd mvs-linux-x86_64-v0.7.3
./mvs-install.sh
```

## 下载并解压数据包
```bash
wget http://newmetaverse.org/blockdata/metaverse-mainnet-blocks-840000.tar.gz
tar -zxvf metaverse-mainnet-blocks-840000.tar.gz
```
## 安装数据包
```bash
cd metaverse-mainnet-blocks
./install.sh
```

## 运行
```bash
# 执行'mvsd', 等待同步块完成, 最新块高可以从 <https://explorer.mvs.org> 查询
# -d 以守护进程形式启动, 没有-d则从会话终端启动
./mvsd -d

# 执行help查看启动参数
./mvsd --help

#执行mvs-cli查看控制台命令
./mvs-cli help
```

## 开始使用
1. 命令行(mvs-cli)请在终端使用
    更多请参见[命令行使用](command-line.html#mvs-cli-usage)
2. 浏览器端与其他平台操作相同
    打开浏览器，输入默认网址 `127.0.0.1:8820`
