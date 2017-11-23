title: Build On MacOSX
comments: false
---

## Get the source code
```bash
git clone https://github.com/mvs-org/metaverse.git
```

## Install Homebrew
If you have installed Homebrew, just skip this step.

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Compile tools settings 
| Compilier | Minimum Version |  Recommended Version |
| --------------------------------- | ----------------- | ------------ |
| gcc/g++ |   5.0.0               |  Newer than 5.0.0 |
| LLVM    |   8.0.0               |  Newer than 8.0.0 |
* c++ Compiler 
* 
Compiler versions can be viewed using `c++ -v`

If your version does not support it, you can refer to [How to upgrade GCC version] (/helpdoc/upgrade-gcc.html).
All MVS node clients are static links (including libstdc ++). Thus, there is no extra dependency after compilation.

* Make Tools
CMake2.8+
```bash
brew install cmake
```


## Library dependence information
| Library Dependencies | Minimum Version | Recommended Version |
| --------------------------------- | ----------------- | ------------ |
| Boost     |   1.56               |  1.58/1.64      |
| ZeroMQ|   4.20               |  4.21           |
| spec256k1 |   -                  |  -              |

The library compiling depends on the GNU toolchain\(automake/autoconf/libtool\), please install it.
```bash
brew install automake/autoconf/libtool
```
Or you can compile by yourself and then install it with no version requirements.


## Installation steps of the dependence library.
### boost 1.56+
```bash
sudo yum/apt-get/brew install libboost-all-dev
```
If building boost manually, please download boost from <http://www.boost.org/>.

If building with boost 1.59~1.63, get compiling error on json_parser 'placeholders::_1' caused by boost bug:
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

## Compile and Install MVS.
```bash
git clone https://github.com/mvs-org/metaverse.git
cd metaverse && mkdir build && cd build
cmake ..
make -j4
make install
```
It takes about 40 minutes.
