title: Linux环境下编译
comments: false
---

## 可以使用的Linux版本
几乎所有的Linux都可进行MVS全节点钱包的编译，官方使用Ubuntu 16.04进行编译测试。

## 获取源码
```bash
git clone https://github.com/mvs-org/metaverse.git
```

## 编译工具设置
| Compilier | Minimum Version |  Recommand Version |
| --------------------------------- | ----------------- | ------------ |
| gcc/g++ |   5.0.0               |  Newer than 5.0.0 |
| LLVM    |   8.0.0               |  Newer than 8.0.0 |
* c++ 编译器
通过 `c++ -v` 可查看编译器版本。
如果您的版本不支持，可以参照[如何升级GCC版本](/helpdoc/upgrade-gcc.html)。
MVS全节点客户端均是静态链接(含libstdc++），编译完成后不存在额外依赖的问题。

* Make工具
CMake2.8+
```bash
yum/apt-get/brew install cmake
```


## 依赖的库信息
| Library Dependencies | Minimum Version | Recommand Version |
| --------------------------------- | ----------------- | ------------ |
| Boost     |   1.56               |  1.58/1.64      |
| ZeroMQ|   4.20               |  4.21           |
| spec256k1 |   -                  |  -              |

库编译依赖GNU toolchain\(automake/autoconf/libtool\), 请安装
```bash
yum/apt-get/brew install automake/autoconf/libtool
```
或者自行编译安装，无版本要求；


## 依赖的库安装步骤
### boost 1.56+
```bash
sudo yum/apt-get/brew install libboost-all-dev
```
If build boost manually, please download boost from <http://www.boost.org/>.

If build with boost 1.59~1.63, get compiling error on json_parser 'placeholders::_1' caused by boost bug:
```
/usr/local/include/boost/property_tree/json_parser/detail/parser.hpp:217:52: error: ‘_1’ was not declared in this scope
```
Please upgrade to 1.64, or modify parser.hpp manually at first.
See boost issue details: <https://github.com/boostorg/property_tree/pull/26>

### ZeroMQ 4.2.1+
Install GNU toochain(automake/autoconf/libtool) at first:
```bash
yum/apt-get/brew install automake/autoconf/libtool
```
Module server/explorer required.
```bash
wget https://github.com/zeromq/libzmq/releases/download/v4.2.1/zeromq-4.2.1.tar.gz
tar -xzvf zeromq-4.2.1.tar.gz
cd zeromq-4.2.1
./autogen.sh
./configure
make -j4
sudo make install && sudo ldconfig
```

### secp256k1 
Module blockchain/database required.
```bash
git clone https://github.com/mvs-live/secp256k1
cd secp256k1
./autogen.sh
./configure --enable-module-recovery
make -j4
sudo make install && sudo ldconfig
```

## 编译与安装MVS
```bash
git clone https://github.com/mvs-org/metaverse.git
cd metaverse && mkdir build && cd build
cmake ..
make -j4
make install
```
It takes about 40 minutes.
