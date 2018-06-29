title: Setup a Simple Mining Pool
comments: false
---

# Environment
OS: Ubuntu 16.04
mvs customized patch and config files: <https://github.com/mvs-org/docs-mvs-org/tree/master/.appendix/mining_pool_setup>

# Setup steps
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

## 3. Build open-mining-pool frontend. 
before building please change ApiUrl: '//example.net/' in www/config/environment.js to match your domain name. Also don't forget to adjust other options.
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

# Note
1. This mining pool is modified based on open_mining_pool, which is suit to ethereum. Only getwork/submitwork are supported in the patch. If you need more functions, you shall develop them by yourself.
2. Remember `setminingaccount` first，otherwise `getwork` will fail.
3. MVS go SDK(in developing): https://github.com/mvshub/mvs_rpc_go.git

Test date: `2018-06-18`
By: `chengzhpchn@163.com`
Thanks UUPool.cn [http://www.uupool.cn/course/etp] for their mining software of `ETC ETH ETP原版软件v11.8.zip`.
MVS Wallet：0.8.1