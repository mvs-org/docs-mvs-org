title: Configuration file - mvs.conf
comments: false
---

## mvs.conf common
Get config files from <https://github.com/mvs-org/metaverse/tree/master/etc>:
* `mvs.conf` - mainnet configuration file
* `mvs-test.conf` - testnet configuration file
* `mvs-full-setting-template.conf`  - template for all parameters. 

The default work path for mvs.conf is as follows:
* Windows   : `%HOMEPATH%\AppData\Roaming\Metaverse`
* Apple OSX : `~/Library/Application\ Support/Metaverse`
* Linux/Uinx: `~/.metaverse`

## mvs.conf example
```bash
# mvs configuration in common usage in MAINNET

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
# self = your_own_public_ip_address:port
# IP address to disallow as a peer, multiple entries allowed.
blacklist = 127.0.0.1
# Persistent host:port channels, multiple entries allowed.
peer = seed.getmvs.org:5251

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
## mvs-test.conf example
```bash
# mvs configuration in common usage for TESTNET

[network]
# The port for incoming connections, defaults to 5251 (15251 for testnet).
inbound_port = 15251
# The target number of incoming network connections, defaults to 8.
inbound_connections = 32
# The target number of outgoing network connections, defaults to 8.
outbound_connections = 8
# The cached peer hosts when startup
hosts_file = hosts-test.cache
# The debug log file path, defaults to 'debug.log'.
debug_file = debug.log
# The error log file path, defaults to 'error.log'.
error_file = error.log
# The advertised public address of this node, defaults to none.
# self = your_own_public_ip_address:port
# IP address to disallow as a peer, multiple entries allowed.
blacklist = 127.0.0.1
# Persistent host:port channels, multiple entries allowed.
# peer = aisa.mvs.live:15251

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
## mvs-full-setting-template.conf
```bash
# mvs configuration file exmaple

[blockchain]
# The maximum number of orphan blocks in the pool, defaults to 50.
block_pool_capacity = <value>
# A hash:height checkpoint, multiple entries allowed.
checkpoint = <value>
# The maximum number of transactions in the pool, defaults to 2000.
transaction_pool_capacity = <value>
# Enforce consistency between the pool and the blockchain, defaults to false.
transaction_pool_consistency = <value>
# Use testnet rules for determination of work required, defaults to false.
use_testnet_rules = <value>

[database]
# The blockchain database directory, defaults to 'mainnet'.
directory = <value>
# The lower limit of spend indexing, defaults to 0.
history_start_height = <value>
# The lower limit of stealth indexing, defaults to 350000.
stealth_start_height = <value>

[network]
# IP address to disallow as a peer, multiple entries allowed.
blacklist = <value>
# The maximum age limit for an outbound connection, defaults to 1440.
channel_expiration_minutes = <value>
# The maximum time limit for obtaining seed addresses, defaults to 30.
channel_germination_seconds = <value>
# The time limit to complete the connection handshake, defaults to 30.
channel_handshake_seconds = <value>
# The time between ping messages, defaults to 5.
channel_heartbeat_minutes = <value>
# The inactivity time limit for any connection, defaults to 30.
channel_inactivity_minutes = <value>
# The number of concurrent attempts to estalish one connection, defaults to 5.
connect_batch_size = <value>
# The time limit for connection establishment, defaults to 5.
connect_timeout_seconds = <value>
# The debug log file path, defaults to 'debug.log'.
debug_file = <value>
# The error log file path, defaults to 'error.log'.
error_file = <value>
# The maximum number of peer hosts in the pool, defaults to 1000.
host_pool_capacity = <value>
# The peer hosts cache file path, defaults to 'hosts.cache'.
hosts_file = <value>
# The magic number for message headers, defaults to 0x6d73766d.
identifier = <value>
# The target number of incoming network connections, defaults to 8.
inbound_connections = <value>
# The port for incoming connections, defaults to 5251.
inbound_port = <value>
# The attempt limit for manual connection establishment, defaults to 0 (forever).
manual_attempt_limit = <value>
# The target number of outgoing network connections, defaults to 8.
outbound_connections = <value>
# Persistent host:port channels, multiple entries allowed.
peer = <value>
# The network protocol version, defaults to 70012.
protocol = <value>
# Request that peers relay transactions, defaults to true.
relay_transactions = <value>
# A seed node for initializing the host pool, multiple entries allowed.
seed = <value>
# The advertised public address of this node, defaults to none.
self = <value>
# The minimum number of threads in the application threadpool, defaults to 50.
threads = <value>

[node]
# The time limit for block receipt during initial block download, defaults to 5.
block_timeout_seconds = <value>
# The maximum number of connections for initial block download, defaults to 8.
download_connections = <value>
# Refresh the transaction pool on reorganization and channel start, defaults to true.
transaction_pool_refresh = <value>

[server]
# Whether wallet needs administrator to execute non-account commands(shutdown/getinfo...), defaults to false.
administrator_required = <value>
# Enable the block publishing service, defaults to false.
block_service_enabled = <value>
# Allowed client IP address, multiple entries allowed.
client_address = <value>
# Allowed Z85-encoded public key of the client, multiple entries allowed.
client_public_key = <value>
# The heartbeat interval, defaults to 5.
heartbeat_interval_seconds = <value>
# Enable the heartbeat service, defaults to false.
heartbeat_service_enabled = <value>
# Setup log level of debug log in level [TRACE,DEBUG,INFO], defaults to DEBUG.
log_level = <value>
# The listening port for mongoose(Json-RPC), defaults to 127.0.0.1:8820.
mongoose_listen = <value>
# The public block publishing endpoint, defaults to 'tcp://*:9093'.
public_block_endpoint = <value>
# The public heartbeat endpoint, defaults to 'tcp://*:9092'.
public_heartbeat_endpoint = <value>
# The public query endpoint, defaults to 'tcp://*:9091'.
public_query_endpoint = <value>
# The public transaction publishing endpoint, defaults to 'tcp://*:9094'.
public_transaction_endpoint = <value>
# Enable the query service, defaults to true.
query_service_enabled = <value>
# The number of query worker threads per endpoint, defaults to 1.
query_workers = <value>
# The secure block publishing endpoint, defaults to 'tcp://*:9083'.
secure_block_endpoint = <value>
# The secure heartbeat endpoint, defaults to 'tcp://*:9082'.
secure_heartbeat_endpoint = <value>
# Disable public endpoints, defaults to false.
secure_only = <value>
# The secure query endpoint, defaults to 'tcp://*:9081'.
secure_query_endpoint = <value>
# The secure transaction publishing endpoint, defaults to 'tcp://*:9084'.
secure_transaction_endpoint = <value>
# The Z85-encoded private key of the server, enables secure endpoints.
server_private_key = <value>
# The subscription expiration time, defaults to 10.
subscription_expiration_minutes = <value>
# The maximum number of subscriptions, defaults to 100000000.
subscription_limit = <value>
# Enable the transaction publishing service, defaults to false.
transaction_service_enabled = <value>
# The listening port for websocket pub/sub service, defaults to 127.0.0.1:8821.
websocket_listen = <value>
# Enable the websocket pub/sub service, defaults to false.
websocket_service_enabled = <value>
```
