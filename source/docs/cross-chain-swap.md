title: Cross-chain Token Swap Instruction
comments: true
---

## Function introduction

Cross-chain service enables to swap assets between Ethereum `ERC20` tokens and equivalent Metaverse `MST`.

## Link Ethereum with Metaverse Avatar or address

### Get transaction data of address to be linked

#### Full-node wallet
1. Open the address page and choose the Avatar or address to be linked; Click `Link to Ethereum`
![Link to Ethereum address][image-1]

2. Click `Generate data`
![Generate data][image-2]

3. Click `Copy data`
![Copy data][image-3]

#### myetpwallet
TODO

### Execute the smart contract to link Ethereum address with Metaverse avatar or address
Open Ethereum wallet which supports sending raw transaction data, such as [`myetherwallet`][1] or [`imtoken`][2]，and start a ETP transferring transaction. The recipient address should be the address of binding ETP address contract：`0xa52b0a032139e6303b86cfeb0bb9ae780a610354`. The value to send is ：`0 ether`，click `Advance` options，paste the copied data to `hex raw data` field. Then click `Next` to finish the transaction. 
![Link Ethereum address with Metaverse Avatar][image-4]


## Swap from Ethereum ERC20 token to Metaverse `MST`

### Send `ERC20` token to the Ethereum address of ETP-Swap center
Open Ethereum wallet and choose the `ERC20` token to be swapped and send them to the Ethereum address of ETP-Swap center: `0xc1e5fd24fa2b4a3581335fc3f2850f717dd09c86`.
![Send `ERC20` token to the Ethereum address of ETP-Swap center][image-5]

### Query
Please be patient and wait for the token swap. It takes a little bit longer time to process transactions on two chains. You could query the swapped MST assets in the [`myetpwallet`](https://www.myetpwallet.com/) or [blockchain explorer](https://explorer.mvs.org/avatar) and the name of this `MST` starts with `ERC20.` by default.

## Swap from Metaverse `MST` to Ethereum `ERC20` token

### Full-node wallet

Choose the `MST` to be swapped and click `Transfer`
![Choose MST][image-6]

Choose `I want to swap this MST to its ERC20 equivalent` on the transfer page and fill the swap amount and the recipient Ethereum address. The fee of swaping token is `1 ETP`.

![Swap asset][image-7]


### myetpwallet
TODO


[1]:	https://www.myetherwallet.com/
[2]:	https://token.im/

[image-1]:	https://i.imgur.com/VassbtZ.png
[image-2]:	https://i.imgur.com/TRFpo1R.png
[image-3]:	https://i.imgur.com/oY35rZq.png
[image-4]:	https://i.imgur.com/e5AacIV.jpg
[image-5]:	https://i.imgur.com/EEageNY.jpg
[image-6]:	https://i.imgur.com/ocwQjsf.png
[image-7]:	https://i.imgur.com/quGQeU7.png
