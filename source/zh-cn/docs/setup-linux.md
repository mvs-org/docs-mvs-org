title: 安装Linux版本钱包
comments: false
---

本文以v0.7.1为示例。

## 下载并解压
```bash
wget http://newmetaverse.org/mvs-download/mvs-linux-x86_64-v0.7.1.zip
unzip mvs-linux-x86_64-v0.7.1.zip
```

## 安装
```bash
./mvs-install.sh
```

## 运行
```bash
# 执行'mvsd', 等待同步块完成, 最新块高可以从 <https://explorer.mvs.org> 查询
# -d 以守护进程形式启动, 没有-d则从会话终端启动
./mvsd -d

# 执行help查看启动参数
./mvsd help

#执行mvs-cli查看控制台命令
./mvs-cli help
```

## 开始使用
1. 命令行(mvs-cli)请在终端使用
2. 浏览器端与其他平台操作相同:
