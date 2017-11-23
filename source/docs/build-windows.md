title: Build On Windows
comments: false
---

## Dependencies:
* Microsoft Visual Studio Community 2015 With Update 3
* [boost_1_63_0](https://sourceforge.net/projects/boost/files/boost/1.63.0/boost_1_63_0.zip/download)
* [zeromq-4.2.1](https://github.com/zeromq/libzmq/releases/download/v4.2.1/zeromq-4.2.1.zip)
* [secp256k1](https://github.com/mvs-org/secp256k1.git)
* [metaverse](https://github.com/mvs-org/metaverse.git)

## Get the source code
### Download all the dependencies to the specific folder as below:
```shell
boost_1_63_0/
zeromq-4.2.1/
secp256k1/
metaverse/
```

## Build Metaverse Step by Step
* Build Boost
```shell
bootstrap.bat
b2.exe address-model=64 runtime-link=static link=static
```

* Build zeromq-4.2.1
Open `zeromq-4.2.1\builds\msvc\vs2015\libzmq.sln`, switch to libzmq project, then build x64 Platform StaticDebug and StaticRelease versions separately.

* Build secp256k1
Open `secp256k1\builds\msvc\vs2013\secp256k1.sln`, switch to secp256k1 project, then build x64 Platform StaticDebug or StaticRelease versions separately.

* Build metaverse
Open `metaverse\builds\msvc-140\metaverse.sln`, switch to mvsd project, then build x64 Platform Debug or Release versions separately.
