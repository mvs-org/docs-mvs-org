title: MST mining
comments: false
---

# How does it work?

## Issue a MST with mining parameters

The first step for the MST issuer consists in specifying that this MST can be mined, during the MST creation. It’s also at the creation that the parameters to calculate the reward per block are defined:

> (1) the initial reward per block (i.e. 3 ETP for Metaverse, and 50 BTC for Bitcoin)
> (2) the block reward decrease interval (i.e. every 500,000 blocks for ETP, and every 210,000 blocks, 4 years, for BTC)
> (3) the decrease speed per interval (i.e. 0.95 for ETP, or 0.5, halving, for BTC)

In simple words, if we keep the example of ETP, it means that (1) the initial block of ETP had a reward of 3 ETP to the miner, (2) this reward decreases every 500,000 blocks and (3) it decreases by 5% (it is multiplied by 0.95) at the end of each period.

![MST creation](/images/i/mst_mining_creation.png)


You can easily calculate the total supply that will be created via the following formula:

```
TOTAL_MINED= INTERVAL*STARTING_AMOUNT*(1/(1-ATTENUATION))
```

However this amount will be reached only if 100% of the miners decide to mine this MST, which has a very little chance of happening. So the real TOTAL_MINED value will probably be much lower, according to how many miners decide to mine this MST.

Of course, not all the total supply has to be created via mining. The MST creator can decide to issue X amount directly at the MST creation to himself and Y additional tokens that will be slowly created from mining.


## Mine a MST

For PoS mining, you can simply choose the MST that you want to mine in the list of MST that can be mined:


![MST mining](/images/i/mst_mining_pos_mining.png)


For PoW mining, you can setup your mining account using setminingaccount, and add there the optional parameter -s to mine the specified MST.


```
Usage: mvs-cli setminingaccount [-h] [--symbol value] ACCOUNTNAME        
ACCOUNTAUTH PAYMENT_ADDRESS                                              

Info: setminingaccount when pool mining.                                 

Options (named):

-h [--help]          Get a description and instructions for this command.
-s [--symbol]        Mine Asset with specified symbol. Defaults to empty.

Arguments (positional):

ACCOUNTNAME          Account name required.                              
ACCOUNTAUTH          Account password(authorization) required.           
PAYMENT_ADDRESS      the payment did/address of this account.            
```


Once you find a block, you can then see in your transaction history that each block mined is rewarded by both ETP and the selected MST.

![Optimize votes transaction](/images/i/mst_mining_history.png)


It is also important to notice that PoS mining provides a much lower ETP reward per block than PoW mining: the ETP PoS mining reward is around 10% of the ETP PoW reward. However, the MST mining reward is the same for both types of mining. This means that PoW miners’ reward in MST might be small in value compare to the ETP reward, whereas PoS miners might be much more interested in the MST reward.