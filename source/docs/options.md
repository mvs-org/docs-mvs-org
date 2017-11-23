title: Configuration options
comments: false
---

## Run mvsd

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

## Configure mvs.conf
You can find several commonly used configuration files at <https://github.com/mvs-org/metaverse/tree/master/etc>:
* mvs.conf - The main net configuration file
* mvs-test.conf - The test net configuration files
* mvs-full-setting-template.conf  - The configuration file for the complete parameter template

mvs.conf sample content：
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

## Change the data folder location
Let's take the Windows environment as an example.

1. Create the configuration file mvs.conf in the following directory：
```
%HOMEPATH%\AppData\Roaming\Metaverse
```

2. The mvs.conf file configuration is as follows:
```
[database]
directory = D:\MVS\ChainData\Metaverse
```
![p1](http://dlmvs1.oss-cn-hangzhou.aliyuncs.com/conf/20170929181838.jpg)
**You can fill in your own path in the above path,**
or you can download the configuration file:
<http://newmetaverse.org/conf/mvs.conf>

For new users, it is recommended to install blockdata-inside version.
Copy the “% HOMEPATH% \ AppData \ Roaming \ Metaverse” directory to the target directory on disk D.
(The folder name must be Metaverse.)


