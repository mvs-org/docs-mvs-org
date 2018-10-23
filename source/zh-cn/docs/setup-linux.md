title: 安装Linux版本钱包
comments: false
---

到官网<https://mvs.org/wallet.html>下载Linux钱包客户端, 目前支持Linux 64bit，安装全节点钱包至少需要 10 GB 磁盘空间。本文以v0.8.4为示例。

## 下载并解压标准版
```bash
# for tarballs
wget https://s3-us-west-1.amazonaws.com/wallet.mvs.org/download/mvs-linux-x86_64-v0.8.4.tar.gz
tar -zxf mvs-linux-x86_64-v0.8.4.tar.gz
```

## 安装标准版
```bash
cd mvs-linux-x86_64-v0.8.4
./mvs-install.sh
```

## 运行
```bash
# 执行'mvsd', 等待同步块完成, 最新块高可以从 <https://explorer.mvs.org> 查询
# -d 以守护进程形式启动, 没有-d则从会话终端启动
mvsd -d

# 执行help查看启动参数
mvsd --help

#执行mvs-cli查看控制台命令
mvs-cli help
```

## 下载数据包加速同步
```bash
# 下载最新数据包
$ wget http://newmetaverse.org/mvs-download/block-data/mvs-block-data-for-linux.tar.gz

# 解压数据包
$ tar -xzvf mvs-block-data-for-linux.tar.gz

# 执行数据拷贝脚本：默认数据目录路径为： ~/.metaverse/mainnet
# 如果您的数据目录不是默认的路径，请将数据目录路径当作参数传入：
# ./copy-block-data.sh PATH_TO_BLOCK_DATA
$ ./copy-block-data.sh
```

## 开始使用
1. 命令行(mvs-cli)请在终端使用
    更多请参见[命令行使用](command-line.html#mvs-cli-usage)
2. 浏览器端与其他平台操作相同
    打开浏览器，输入默认网址 `127.0.0.1:8820`
