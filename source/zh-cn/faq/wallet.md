title: 钱包常见问题
comments: true
---

## 钱包常见问题
***

## 1. 钱包类型
元界有桌面版全节点钱包、浏览器轻钱包、myetpwallet钱包[myetpwallet](https://www.myetpwallet.com/)，第三方钱包有云链钱包和比特购钱包，描述问题时请准确描述你的钱包类型。

## 2. 为什么我的钱包没有显示出正确的`ETP`数量？
1. 请先交叉验证`ETP`数量能通过其他方式正确显示，比如通过[区块链浏览器](https://explorer.mvs.org/#!/)，或通过手机`APP`，或通过全节点钱包，或通过[myetpwallet](https://www.myetpwallet.com/)能查询到正确的`ETP`。
2. 如果你使用的是浏览器钱包，请尝试不同的浏览器，推荐使用谷歌浏览器。
3. 如果你使用的是轻钱包，请尝试生成许多地址以便轻钱包能够显示这些地址上的`ETP`。

## 3. 为什么`ETP`存款到期未解锁？
在[区块链浏览器](https://explorer.mvs.org/#!/)中查询存款地址，解锁高度=锁仓高度+解锁高度，每跳动一个块高大约需要`30`秒，由此可以推算存款解锁的时间。

## 4. 为什么`ETP`存款利息未到账？
在[区块链浏览器](https://explorer.mvs.org/#!/)中查询存款地址，蓝字白字“存款-利息”里有明确数量和到账时间。参考问题`3`。

## 5. 为什么我的轻钱包资产显示为`0`？
从轻钱包导出秘钥文件，用记事本打开秘钥文件，将index后的地址数量修改为一个较大的值重新登录。参考问题`2`。

## 6. 全节点钱包安装与配置与数据文件路径默认在哪里？
Windows 系统：安装路径为 `C:\Program Files (x86)\Metaverse`，配置与数据文件路径为：`C:\Users\kesalin\AppData\Roaming\Metaverse`。

## 7. 如何修改默认配置？
请参考[配置文件](https://docs.mvs.org/zh-cn/docs/config-file.html)以及[配置选项](https://docs.mvs.org/zh-cn/docs/options.html)。
