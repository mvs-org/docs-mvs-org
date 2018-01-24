title: Build Private Chains
comments: false
---

## Why Build Private Chain

Private block chains can be tailored to the specific cases of enterprises and their partners, using transparent mechanisms to build trust and improve efficiency.

Private block chain is aimed at users in single entity, or users in the same industry alliance, they need transparency between each other, but they need not be transparent to the public.

Private chain can also be used to simulate testing work. Reduce the difficulty by modifying the source code, you can quickly start from the origin of the chain to mining to get rich. With ETPs in hand you can then test the various types of API interface, such as creating / issue assets, send ETP, use multi signature and so on.

Of course, you can also implement a more practical private chain with your own needs.

The following is the way to build the private chain.

## How To Build Private Chain

### 1. Get the Wallet Software

**You can build MVS Wallet from the source code**

[Build on windows](build-windows.html)

[Build on Macosx](build-macosx.html)

[Build on Linux](build-linux.html)

**off course, you can alse download MVS Wallet binary and setup it directly**

[Windows setup](setup-windows.html)

[Macosx setup](setup-macosx.html)

[Linux setup](setup-linux.html)

### 2. Modify Config Options

For configuration Options, you can see [Config Options](options.html)


With reference to the above document, we can build private chains based on Metaverse by setting configuration files without the need to change the code.

By modifying the `identifier`, we can implement different blockchain instances.
Developers don’t have to be worried even it runs in the main network mode, because block generation speed is very fast and they can use the CPU to continue mining test.

Build Private Chain needs run at least two `mvsd` to get consensus. You'd better run each of them on different computer。**NOTE: the computer should be connectable through network**

The Config files are as the following：

Config file 1：
```bash
[network]
identifier = 1234567890
self = 172.100.0.197:5251
seed = 172.100.1.22:5251

[server]
log_level = DEBUG
mongoose_listen = 0.0.0.0:8820
websocket_listen = 0.0.0.0:8821
```
Config file 2：
```bash
[network]
identifier = 1234567890
self = 172.100.1.22:5251
seed = 172.100.0.197:5251

[server]
log_level = DEBUG
mongoose_listen = 0.0.0.0:8820
websocket_listen = 0.0.0.0:8821
```
NOTE: the two Config files use a same `identifier`， and set its `seed` to the other one.

### 3. Run mvsd to verify

Firstly，Because the configuration file is customized, we need to place it at the default location to make it effective (_if the directory does not exist then create it_):

> Windows   : %HOMEPATH%\AppData\Roaming\Metaverse
> Apple OSX : ~/Library/Application\ Support/Metaverse
> Linux/Uinx: ~/.metaverse

Then，run `mvsd` separately on each computer
> ./mvsd

The output is something like the following：
```
20180124T130912 INFO [server] mvsd version 0.7.3
20180124T130912 INFO [server] ================= startup ==================
20180124T130912 ERROR [server] ================= startup ==================
20180124T130912 FATAL [server] ================= startup ==================
20180124T130912 INFO [server] Using config file: "/home/jowen/.metaverse/mvs.conf"
20180124T130912 INFO [server] Please wait while the server is starting...
20180124T130912 INFO [node] Starting manual session.
20180124T130912 INFO [server] Seeding is complete.
20180124T130912 INFO [http] Http Service listen on 0.0.0.0:8820
20180124T130912 INFO [MONGO] Websocket Service listen on 0.0.0.0:8821
20180124T130912 INFO [node] Node start height is (0).
20180124T130912 INFO [node] Starting inbound session.
20180124T130912 INFO [node] Starting outbound session.
20180124T130912 INFO [server] Bound public query service to tcp://*:9091
20180124T130912 INFO [server] Server is started.
```

### 4. Execute the client command or request

At this point, the private chain has been completed.

You can call APIs through `JSON-RPC` or `mvs-cli`.

You can also add more computers to participate the private chain, as long as the `self`, `identifier` and `seed` is setted rightly in each Config file.

The Follwing is some simple examples of API calling, aims to verify the normal state of the private chain.

For more information about APIs Interface, please see [Command Line Usage](command-line.html) and [API v2 Usage](../api_v2/index.html)

Get the version information:
```bash
[jowen@JOWEN bin]$ ./mvs-cli getinfo
{
	"database-version" : "0.6.2",
	"difficulty" : "1",
	"hash-rate" : 0,
	"height" : 0,
	"is-mining" : false,
	"network-assets-count" : 0,
	"peers" : 2,
	"protocol-version" : 70012,
	"testnet" : false,
	"wallet-account-count" : 1,
	"wallet-version" : "0.7.3"
}
```
Get peer information（If no peer exist, that maybe a configuration or network problem）：
```bash
[jowen@JOWEN bin]$ ./mvs-cli getpeerinfo
{
	"peers" : 
	[
		"172.100.1.22:5251",
		"172.100.1.22:33146"
	]
}
```
Create account：
```bash
[jowen@JOWEN bin]$ ./mvs-cli getnewaccount test1 passwd1
{
	"default-address" : "MAGRQAbQj2uZMfChXqgpJoXwCkDgfw9ZK1",
	"mnemonic" : "discover glance limit similar stable comic patient protect media correct sorry capital object foil noise ill beauty teach hole monster half banana enforce lion"
}
```
Start mining to make money：
```bash
[jowen@JOWEN bin]$ ./mvs-cli startmining test1 passwd1
solo mining started at MKWjVNAGSDjhQmUW9VUwcBNGTscYozNopJ
```
Get the block height（here I use JSON-RPC）：
`We can judge from the zero result that this is a pure private chain just inited`
```bash
[jowen@JOWEN bin]$ curl -X POST --data '{"jsonrpc":"2.0","method":"getheight","params":[],"id":25}' http://127.0.0.1:8820/rpc/v2
{
	"id" : 25,
	"jsonrpc" : "2.0",
	"result" : 0
}
```
Wait some minutes and get get the block height again:
If the result height is not zero now, it means I have succeedded some mining.(_NOTE: the mining work needs time, and the validating block work still needs time, so you may wait more longer_)
`In order to increase the mining speed, you can decrease the difficulty of mining by modifying source code. This is useful in some situation, like testing Interfaces etc.`
```bash
[jowen@JOWEN bin]$ curl -X POST --data '{"jsonrpc":"2.0","method":"getheight","params":[],"id":25}' http://127.0.0.1:8820/rpc/v2
{
	"id" : 25,
	"jsonrpc" : "2.0",
	"result" : 29999
}
```
OK, when your money is enough, you can use `stopmining` to stop mining.
Stop mining may also need a long time.
```bash
[jowen@JOWEN bin]$ ./mvs-cli startmining test1 passwd1
```

And, now you can do more APIs calling which you are intersted in.
Wish you a good feeling about `Metaverse Wallet`.