title: 搭建私有链
comments: false
---

## 搭建私有链目的

私有区块链可以根据企业及其合作伙伴的具体案例来量身定制，利用透明机制来建立信任并提高效率。

私有区块链针对的是单一实体内的用户，或者在同一个行业联盟内的用户，他们彼此之间需要透明，但没必要对公众透明。

私有链也可用于一些模拟测试工作，通过修改源码降低挖矿难度，可以较快从起源链开始白手起家挖矿致富，从而有ETP在手去测试各类接口，例如创建/发布资产，转账，多重签名等等。

当然你也可以结合自己的需求实现更有实际意义的私有链。

下面就来谈私有链的搭建方法。

## 搭建私有链步骤

### 1. 获取钱包软件

**你可以从源码编译**

[Windows编译](build-windows.html)

[Macosx编译](build-macosx.html)

[Linux编译](build-linux.html)

**当然，你也可以直接下载二进制安装包**

[Windows安装](setup-windows.html)

[Macosx安装](setup-macosx.html)

[Linux安装](setup-linux.html)

### 2. 修改配置

关于配置项说明，可以参看[配置选项](options.html)

参照上述文档，我们可以通过配置配置文件，搭建基于元界的私有链，而不必改动代码。

通过修改 `identifier` 为不同的值，我们即可实现不同的区块链实例。
即使是以主网模式运行，开发者也不必担心，主网的出块速度也是很快的，可以使用CPU挖矿继续测试。

搭建私有链至少需要运行两个`mvsd`进行共识，最好是在两台电脑各自运行一个。**注意电脑之间的网络是互通的。**以下是两个程序的配置文件：

配置文件一：
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
配置文件二：
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
注意，两个程序使用同一个 `identifier`， 互为彼此的 `seed`，这样就可以在两者之间进行共识同步了。

### 3. 运行程序验证效果

首先，由于配置文件是自己定制的，所以需要将其放置在默认位置处（目录不存在则创建之）:

> Windows   : %HOMEPATH%\AppData\Roaming\Metaverse
> Apple OSX : ~/Library/Application\ Support/Metaverse
> Linux/Uinx: ~/.metaverse

然后，在两台机器上分别启动 `mvsd` 程序：
> ./mvsd

程序运行输出：
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

### 4. 执行客户端命令

至此，私有链已经搭建完成，可以通过 `JSON-RPC` 或者 `mvs-cli` 进行接口调用了。两台电脑可以看成是两个独立的帐户参与方，当然你也可以继续添加电脑参与进来，只要配置文件中的 `self`, `identifier` 和 `seed` 设置正确，**并且电脑之间是可以互连的**就行。

以下是一些简单的接口调用，更多是为了辅助验证私有链状态正常。
更多接口说明请参见：[命令行使用](command-line.html) 和 [API v2 Usage](../api_v2/index.html)

获取版本信息：
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
获取peer信息（如果没有则可能配置或者网络有问题）：
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
创建新账户：
```bash
[jowen@JOWEN bin]$ ./mvs-cli getnewaccount test1 passwd1
{
	"default-address" : "MAGRQAbQj2uZMfChXqgpJoXwCkDgfw9ZK1",
	"mnemonic" : "discover glance limit similar stable comic patient protect media correct sorry capital object foil noise ill beauty teach hole monster half banana enforce lion"
}
```
开始挖矿赚钱：
```bash
[jowen@JOWEN bin]$ ./mvs-cli startmining test1 passwd1
solo mining started at MKWjVNAGSDjhQmUW9VUwcBNGTscYozNopJ
```
获取区块高度（注意到没有，这里我使用了JSON-RPC）：
块高为0说明当前是起源块，是纯净的私有链。
```bash
[jowen@JOWEN bin]$ curl -X POST --data '{"jsonrpc":"2.0","method":"getheight","params":[],"id":25}' http://127.0.0.1:8820/rpc/v2
{
	"id" : 25,
	"jsonrpc" : "2.0",
	"result" : 0
}
```
等待一段时间，再次获取块高：
当块高不为0时，说明已经挖到矿了。注意，挖矿需要时间，验证区块也需要时间。
所以在接口测试时可以通过修改源码降低挖矿难度，从而提升挖矿速度。
```bash
[jowen@JOWEN bin]$ curl -X POST --data '{"jsonrpc":"2.0","method":"getheight","params":[],"id":25}' http://127.0.0.1:8820/rpc/v2
{
	"id" : 25,
	"jsonrpc" : "2.0",
	"result" : 29999
}
```
当挖到足够多矿时则通过 `stopmining` 停止挖矿，停止挖矿有时需要更长时间。
```bash
[jowen@JOWEN bin]$ ./mvs-cli startmining test1 passwd1
```