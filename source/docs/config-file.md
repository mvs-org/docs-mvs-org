title: Configuration file - mvs.conf
comments: false
---

## mvs.conf
Get config files from <https://github.com/mvs-org/metaverse/tree/master/etc>:
* `mvs.conf` - mainnet configuration file
* `mvs-test.conf` - testnet configuration file
* `mvs-full-setting-template.conf`  - template for all parameters. 

The default work path for mvs.conf is as follows:
* Windows   : `%HOMEPATH%\AppData\Roaming\Metaverse`
* Apple OSX : `~/Library/Application\ Support/Metaverse`
* Linux/Uinx: `~/.metaverse`

mvs.conf template:
```bash
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

# Write service requests to the log, defaults to DEBUG. [TRACE/DEBUG/INFO]
log_level = DEBUG
```
