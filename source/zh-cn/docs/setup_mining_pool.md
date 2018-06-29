title: 搭建简易矿池
comments: false
---

#安装环境
OS: Ubuntu 16.04

#安装步骤
## 1. Install redis(3.2.8):
```
$ wget http://download.redis.io/releases/redis-3.2.8.tar.gz
$ tar -zxvf redis-3.2.8.tar.gz
$ cd redis-3.2.8/
$ make -j4
```

### 1.1 Start redis-server
```
$ cd redis-3.2.8/src
$ ./redis-server &
```

## 2. Install Node.js:
```
$ sudo apt-get install -y nodejs
```

## 3. Build open-mining-pool frontend. before building please change ApiUrl: '//example.net/' in www/config/environment.js to match your domain name. Also don't forget to adjust other options.
```
$ sudo apt install npm
$ sudo npm install -g ember-cli@2.9.1
$ sudo npm install -g bower
$ sudo npm install
$ bower install
$ cd open-ethereum-pool/www
$ ./build.sh
```

## 4. Install nginx
```
$ wget http://nginx.org/download/nginx-1.10.3.tar.gz
$ tar -zxvf  nginx-1.10.3.tar.gz
$ cd nginx-1.10.3
$ ./configure
$ make 
$ sudo make install
```

### 4.1 nginx setting
Please refer to the difference between 'mvs_mining_pool_nginx.conf' and 'conf/nginx.conf'.

### 4.2 Start nginx
```
$ cd /usr/local/nginx
$ sudo ./objs/nginx -c ./conf/nginx.conf
```

## 5. Build open-mining-pool

### 5.1 download open-mining-pool source code & apply patch for mvs & build
```
$ git clone https://github.com/sammy007/open-ethereum-pool.git
$ cd open-ethereum-pool
$ git apply ../mvs_mining_pool.diff
$ make
```

### 5.2 Change open-mining-pool config
Please refer to the difference between 'mvs_mining_pool_config.json' and config.example.json, and generate your own config.json.
Note: the ip address '10.10.10.37' in 'mvs_mining_pool_config.json' should be modified to your own ip address.

### 5.3 Start open-mining-pool
```
$ ./build/bin/open-ethereum-pool ./config.json
```

测试日期: 2018-06-18
By: chengzhpchn@163.com
测试用挖矿软件取自UUPool.cn http://www.uupool.cn/course/etp 软件版本： 'ETC ETH ETP原版软件v11.8.zip'
配套MVS钱包版本：0.8.1

注意: 
1. MVS矿池基于以太坊开源的open_mining_pool修改，补丁仅支持获取/提交挖矿信息，不支持自动给矿工发钱。如果需要支持其他功能，请自行基于open-mining-pool的代码修改。
2. 需要先在MVS钱包上设置好挖矿帐号（setminingaccount），否则调用getwork会失败。
3. MVS go SDK(开发中)下载路径: https://github.com/mvshub/mvs_rpc_go.git



