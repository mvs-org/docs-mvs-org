title: 配置选项
comments: false
---

## 运行mvsd

```
Usage: mvsd [-dhistv] [--datadir value] [--config value] [--ui value]      

Info: Runs a full metaverse node in the global peer-to-peer network.     

Options (named):

-D [--datadir]       Specify database path.                              
-c [--config]        Specify path to a configuration settings file based 
                     on path ~/.metaverse                                
-d [--daemon]        Run in daemon mode (unix/apple).                    
-h [--help]          Display command line options.                       
-i [--initchain]     Initialize blockchain in the configured directory.  
-s [--settings]      Display all configuration settings.                 
-t [--testnet]       Use testnet rules for determination of work         
                     required, defaults to false.                        
-u [--ui]            Open wallet UI.                                     
-v [--version]       Display version information.
```

## 配置mvs.conf
你可以在<https://github.com/mvs-org/metaverse/tree/master/etc>找到几个常用的配置文件：
* mvs.conf - 主网配置文件
* mvs-test.conf - 测试网配置文件
* mvs-full-setting-template.conf  - 完整的参数模板的配置文件

mvs.conf的示例内容:
```bash
# mvs configuration in common usage in MAINNET
# mvs.conf default in path as below
# Windows   : %HOMEPATH%\AppData\Roaming\Metaverse
# Apple OSX : ~/Library/Application\ Support/Metaverse
# Linux/Uinx: ~/.metaverse

[network]
# The port for incoming connections, defaults to 5251 (15251 for testnet).
inbound_port = 5251
# The target number of incoming network connections, defaults to 8.
inbound_connections = 256
# The target number of outgoing network connections, defaults to 8.
outbound_connections = 32
# The cached peer hosts when startup
hosts_file = hosts.cache
# The debug log file path, defaults to 'debug.log'.
debug_file = debug.log
# The error log file path, defaults to 'error.log'.
error_file = error.log
# The advertised public address of this node, defaults to none.
#self = your_own_public_ip_address:port
# IP address to disallow as a peer, multiple entries allowed.
#blacklist = 127.0.0.1
# Persistent host:port channels, multiple entries allowed.
#peer = seed.getmvs.org:5251

[database]
# The blockchain database directory, defaults to 'mainnet' of below default path.
# Windows   : %HOMEPATH%\AppData\Roaming\Metaverse
# Apple OSX : ~/Library/Application\ Support/Metaverse
# Linux/Uinx: ~/.metaverse
# Eg:
# directory = D:\MVS\ChainData\Metaverse
# directory = /var/local/Metaverse

[server]
# The maximum number of query worker threads per endpoint, defaults to 1.
query_workers = 1

# local http RPC call listen port
mongoose_listen = 127.0.0.1:8820

# Write service requests to the log, defaults to false.
log_level = DEBUG
```

## 更换数据文件夹位置
我们以Windows环境为例。

1. 在下述目录创建配置文件mvs.conf：
```
%HOMEPATH%\AppData\Roaming\Metaverse
```

2. mvs.conf 文件配置内容如下:
```
[database]
directory = D:\MVS\ChainData\Metaverse
```
![p1](http://dlmvs1.oss-cn-hangzhou.aliyuncs.com/conf/20170929181838.jpg)
**上述的路径可以填写你自己的路径;**
或者你可以下载该配置文件:
<http://newmetaverse.org/conf/mvs.conf>

如果是新用户，建议安装 blockdata-inside 版本后，
将 %HOMEPATH%\AppData\Roaming\Metaverse 目录整个拷贝到D盘的目标目录;
(文件夹名称必须是 Metaverse 。)
