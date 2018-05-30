title: Digital Identity(Avatar) Usage

---

# Digital Identity (did) introduction

The digital identity is bound with the user's private key, it has a unique identifier in the network. It is bound to the address of the user and can be transferred between different addresses in the same account. You can send etp and assets to other did(or addresses) through did.
***
##1. Create and issue did


* ### 1.1 Create and issue did
    
    >*issuedid ACCOUNTNAME ACCOUNTAUTH ADDRESS SYMBOL*
    > ADDRESS belongs to current account;
    SYMBOL consists of alphabets, numbers, and special characters ("@", ".", "_", "-"), case-sensitive, and the maximum length cannot exceed 64;
    SYMBOL cannot be a valid address nor repeated on the chain;
    SYMBOL cannot be the keyword "BLACKHOLE", "BLACKHOLE" is case-insensitive, ie "BLACKHOLE", "blockhole", "BlockHole" etc. are forbidden;
    issuedid need at least 1 etp

* ### 1.2 Query dids

    >*listdids*
    list dids on the chain
    >
    >*listdids ACCOUNTNAME ACCOUNTAUTH*
    list dids under the current account

* ### 1.3 Transfer did to other address 
    
    >*didmodifyaddress ACCOUNTNAME ACCOUNTAUTH TOADDRESS SYMBOL*
    TOADDRESS belongs to the current account and didn't be bound with other did
 
* ### 1.4 List history addresses of did
    >*listdidaddresses ACCOUNTNAME ACCOUNTAUTH SYMBOL*


##2. did transaction

* ### 2.1 Send etp to other did (or address)
    >*didsend ACCOUNTNAME ACCOUNTAUTH TODID/TOADDRESS AMOUNT*
    The target can be either did or address

* ### 2.2 Send etp from current did (or address) to other did (or address)
    >*didsendfrom ACCOUNTNAME ACCOUNTAUTH FROMDID/FROMADDRESS TODID/TOADDRESS AMOUNT*
    FROMDID/FROMADDRESS is the current account's did or address

* ### 2.3 send to multiple did (or address)
    >*didsendmore ACCOUNTNAME ACCOUNTAUTH -r did1/address1:AMOUNT1 -r did2/address2:AMOUNT2 -m did3*
    The "-r" option specifies the recive did (or address) and amount, supports multiple reviver;
    The "-m" option specifies did or address for change

* ### 2.4 Send assets to other did (or address)
    >*didsendasset ACCOUNTNAME ACCOUNTAUTH TODID/TOADDRESS AMOUNT*
    The target can be either did or address

* ### 2.5 Send assets from current did (or address) to other did (or address)
    >*didsendfrom ACCOUNTNAME ACCOUNTAUTH FROMDID/FROMADDRESS TODID/TOADDRESS AMOUNT*
    FROMDID/FROMADDRESS is the current account's did or address
***
####For more details of did API, please refer to: https://docs.mvs.org/api_v2/identity.html

