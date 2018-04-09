---
title: 关于元界input/output限制以及零钱归整
date: 2017-02-16 23:44:21
tags: Metaverse
categories: Design
---

元界使用UTXO模型，在UTXO模型中，input/output的个数是有限制的。

在比特币中，前向input以及生成一个out约占用161~250 bytes [点击获取引用出处](http://bitcoin.stackexchange.com/questions/35570/what-is-the-maximum-number-of-inputs-outputs-a-transaction-can-have)。
在比特币中将小于100kb的交易称为标准交易，超过100kb的称为非标准交易。
所以在比特币中，大约的inputs/ouputs的最大数目限制为  100KB/161B ~= 600个。

而在元界中，也是类似的交易大小限制，但由于提供了资产发行的功能，所以将在inputs/ouputs个数限制在333个左右。
对普通用户来说，大量的小额(input)应该不会经常出现。如果有，可以手动发送归整（换大额面钞）的交易，如：
您有900个input，每个input包含1个ETP，当你想归整这900个ETP，最好用分成三笔交易，即每笔转移300个ETP到同一个地址A，地址A将包含3个inputs，每个input包含300ETP。
对矿工来说，也是一样的，每个coinbase只生成3个ETP。

也就是说，矿工除了挖矿外，还将承担大部分的币归整的工作，将琐碎的ETP更换成较大面额的ETP，最后归整后的ETP才能进入市场流通。
考虑330个左右的限制，每次交易可以归整1000 ETP。
比方说矿工地址上挖矿有20,000个ETP，则需要大约20个归整交易到一个地址（即20个输入，后面可正常交易）。
