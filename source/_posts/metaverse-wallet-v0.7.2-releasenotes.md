title: Full Node Wallet v0.7.2 Release Notes
---

Metaverse Full Node Wallet 0.7.2 release note：
1.	Added an offline transaction signing function. This function is unavailable through the MVSD GUI; It is only available for createrawtx/ signrawtx/ decoderawtx/ sendrawtx RPC calls.

2.	 Accounts are no longer created when users input incorrect mnemonic words.

3.	 Network performance optimization

4.	 Users are no longer given a time estimate when using the freezing function. Instead, the period required to unlock one’s deposit is displayed in blocks. 

5.	 Optimized performance of the getnewaddress RPC call. Irrelevant to the MVSD GUI.

6.	 Added “locked_height_range” fields during transaction output of RPC calls to distinguish freezing transactions

7.	 Fixed peer connection problem in the configuration file

8.	 Display transaction message on homepage

9.	 Users must now type in their backup words (mnemonic passphrase) upon registration to confirm that they have made a backup.

10.	 Fixed WebSocket in the “advanced” function on the Internet Explorer browser

11.	 Optimized the UI

Download：[https://mvs.org](https://mvs.org)


