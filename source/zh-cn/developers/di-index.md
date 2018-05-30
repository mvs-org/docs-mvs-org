title: 数字身份
comments: false
---

#数字身份(简称did)使用说明

数字身份与用户所拥有的主私钥绑定,在全网中拥有唯一标识，它同该用户下的地址一一绑定，并且可以在同一账户的不同地址间转移。可以通过did直接发送etp和资产到其他did(或地址)。

***
##1. 创建和查询did


* ### 1.1 创建发行did
    
    >*issuedid ACCOUNTNAME  ACCOUNTAUTH  ADDRESS SYMBOL*
    >ADDRESS属于当前账户;
    SYMBOL由字母、数字和("@",".","_","-")特殊字符组成，大小写敏感，最大长度不能超过64;
    SYMBOL不能为有效地址并且在链上不能重复;
    SYMBOL不能为关键字"BLACKHOLE","BLACKHOLE"大小写不敏感，即"BLACKHOLE","blockhole","BlockHole"等形式都是无效的SYMBOL;
    发行did至少需要1个etp

* ### 1.2 查看did列表

    >*listdids*
    查看链上已发行的所有did
    >
    >*listdids  ACCOUNTNAME  ACCOUNTAUTH*
    查看当前账户下的所有的did

* ### 1.3 did地址转移
    
    >*didmodifyaddress ACCOUNTNAME ACCOUNTAUTH TOADDRESS SYMBOL*
    TOADDRESS只能属于当前账户并且未绑定其他did
 
* ### 1.4 查看历史地址
    >*listdidaddresses ACCOUNTNAME ACCOUNTAUTH SYMBOL*


##2. did交易

* ### 2.1 发送etp到其他did(或地址)
    >*didsend ACCOUNTNAME ACCOUNTAUTH DID/ADDRESS AMOUNT*
    目标可以为did或address

* ### 2.2 从当前did(或地址)发送etp到其他did(或地址)
    >*didsendfrom ACCOUNTNAME ACCOUNTAUTH FROMDID/FROMADDRESS TODID/TOADDRESS AMOUNT* 
    FROMDID/FROMADDRESS为当前账户下的did或者地址

* ### 2.3 发送到多个did(或地址)
    >*didsendmore ACCOUNTNAME ACCOUNTAUTH -r todid1/toaddress1:AMOUNT1 -r todid2/toaddress2 -m did3
    "-r" 选项指定目的did(或地址)和金额,可以添加多个;
    "-m" 选项指定找零的did或地址;

* ### 2.4 发送资产到其他did(或地址)
    >*didsendasset ACCOUNTNAME ACCOUNTAUTH TODID/TOADDRESS AMOUNT*
    目标可以为did或address

* ### 2.5 从当前did(或地址)发送资产到其他did(或地址)
    >*didsendfrom ACCOUNTNAME ACCOUNTAUTH FROMDID/FROMADDRESS TODID/TOADDRESS AMOUNT* 
    FROMDID/FROMADDRESS为当前账户下的did或者地址

***

####did API的更多详情，请参考：https://docs.mvs.org/api_v2/identity.html

