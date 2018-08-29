title: 钱包常见问题
comments: true
---

## 钱包常见问题
***

## 1. 钱包类型
元界有桌面版全节点钱包、轻钱包两种。轻钱包又分为浏览器钱包[https://www.myetpwallet.com](https://www.myetpwallet.com/) 和手机 APP 钱包两种。访问浏览器钱包第三方轻钱包有云链钱包和比特购钱包，描述问题时请准确描述你的钱包类型。

## 2. 轻钱包地址与资产的关系
> 轻钱包默认提供 `10` 个地址，手机 APP 可以通过`帐户-收款-更新地址数量`生成更多地址，上限为 `50` 个地址。  
> 资产是存放在地址上的，因此某一笔交易中的资产是和特定地址关联的。  
> 轻钱包上显示的资产是轻钱包中所有地址上的资产汇总。  
> 如果某个地址没有在轻钱包生成，则该地址上的资产不会在轻钱包上汇总显示。  
> 如果使用的地址超过 `50` 个，请使用全节点钱包。  

## 3. 为什么我的钱包没有显示出正确的`ETP`数量？
1. 参考问题`2`。
2. 请先交叉验证`ETP`数量能通过其他方式正确显示，比如通过[区块链浏览器](https://explorer.mvs.org/#!/)，或通过手机`APP`，或通过全节点钱包，或通过[https://www.myetpwallet.com](https://www.myetpwallet.com/)能查询到正确的`ETP`。
3. 如果你使用的是浏览器钱包，请尝试不同的浏览器，推荐使用谷歌浏览器。
4. 如果你使用的是轻钱包，请尝试生成更多地址以便轻钱包能够显示这些地址上的`ETP`。

## 4. 怎样查看 `ETP` 存款到期时间？
用助记词登录[https://www.myetpwallet.com](https://www.myetpwallet.com/)，然后选择`ETP-查看历史-存款`，找到相应的存款记录，查看解锁高度。每跳动一个块高大约需要30秒，由此可以推算存款解锁的时间。因此：（解锁高度 - 当前高度）× 30 秒，就是还需要多久才可以解锁的时间。

## 5. 为什么`ETP`存款利息未到账？
在[区块链浏览器](https://explorer.mvs.org/#!/)中查询存款地址，蓝字白字“存款-利息”里有明确数量和到账时间。参考问题`4`。

## 6. 为什么我的轻钱包资产显示为`0`？
1. 用谷歌浏览器打开[https://www.myetpwallet.com](https://explorer.mvs.org/#!/blocks)
2. 选择从助记词创建钱包文件，输入助记词，导出钱包文件（默认名称为：mvs_keystore.json）
3. 用记事本打开钱包文件，将`index`后的地址数量修改为一个较大的值，如下示例修改为`200`
```js
{"algo":"aes","index":200,"mnemonic":
```
4. 重新访问[https://www.myetpwallet.com](https://app.myetpwallet.com/#/login)，选择“从文件打开钱包”，选择刚刚修改的钱包文件，点击重新同步。

## 7. 为什么全节点钱包访问`http:\\127.0.0.1:8820`时显示`Open failed`？
这是由于钱包的安装路径与网页访问路径不匹配导致的。`Windows`系统下，请先卸载当前钱包程序，然后使用默认安装路径为`C:\Program Files (x86)\Metaverse`，重新安装程序。

## 8. 全节点钱包安装与配置与数据文件路径默认在哪里？
Windows 系统：安装路径为 `C:\Program Files (x86)\Metaverse`，配置与数据文件路径为：`C:\Users\kesalin\AppData\Roaming\Metaverse`。

## 9. 如何修改默认配置？
请参考[配置文件](https://docs.mvs.org/zh-cn/docs/config-file.html)以及[配置选项](https://docs.mvs.org/zh-cn/docs/options.html)。

## 10. 如何联系第三方钱包客服？
云链钱包客服微信：h792567950，比特购钱包QQ客服：1903924553。
