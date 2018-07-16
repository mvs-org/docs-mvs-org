title: Frequently Asked Questions and answers about wallet
comments: true
---

## Top Frequently Asked Questions
***

## 1. Why ETP balances are not displayed correctly on my wallet?
1. Please try [online explorer](https://explorer.mvs.org/#!/), [myetpwallet](https://www.myetpwallet.com/), or full node wallet to verify ETP balances.  
2. If you are using a browser wallet, try a different browser and recommend using Google Chrome.
3. If you are using a light wallet, try to generate enough addresses so that the light wallet can display `ETP` on those addresses. 

## 2. How to add addresses to light wallet?
1. Open Chrome explorer, go to [myetpwallet](https://app.myetpwallet.com/#/login). 
2. Create wallet file with your memonic words, export it as "mvs_keystore.json". 
3. Open the wallet file with notepad, edit the number after "index:" with a larger one, eg.  
	```js
	{"algo":"aes","index":200,"mnemonic":
	```
4. Save the wallet file, and then relogin to [myetpwallet](https://app.myetpwallet.com/#/login) with the edited wallet file. 
5. Resync data.
