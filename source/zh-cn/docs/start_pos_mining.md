title: Start PoS mining
comments: false
---

# How does it work?
First you will need to create an Avatar if you don’t already have one, since it is necessary for the different steps of PoS mining. Then you can start mining using the full node wallet (also called desktop wallet), in the Mining section.

![PoS mining page](/images/i/pos_mining_page.png)

There are 2 requirements in order to be able to create a block:

## 1: Lock ETP
You need to lock at least 1,000 ETP, for at least 24,000 blocks (approximately 1 week). It’s important to note that these 1,000 ETP have to be locked in 1 time: doing several locks of 500 ETP will not validate this requirement. It requires 1 lock transaction of 1,000 ETP or more.
Also the last 1,000 blocks before the unlock are excluded. It means that if you lock your ETP for 24,000 blocks, you will only be able to mine during the 23,000 first blocks. If you lock for 48,000 blocks, you will be able to mine for 47,000 blocks etc…

![Lock ETP](/images/i/pos_mining_lock_etp.png)

Finally, the ETP previously locked via the deposit function do not validate this condition: those ETP were already rewarded by the deposit interests, and can’t be used for PoS mining. Only ETP locked via the new lock function introduced in MPC, without interests, can validate it.


## 2: Votes

Then your chances to mine a block are defined by the number of outputs you have that are more than 1,000 ETP, that we call “Votes”. Outputs are basically the ETP you receive, so if you receive 2 transactions of 500 ETP you will have 2 outputs available to spend. But in that case you will not have any votes, since none of the outputs reach the 1,000 ETP threshold. At the opposite, if you receive 1 transaction of 2,000 ETP, you will only have 1 vote whereas you could have 2 votes with this amount.

It’s also important to notice that 1 output of 2,000 ETP will give a bit more chances to find a block than 1 output of 1,000 ETP, but less than 2 outputs of 1,000 ETP . Indeed, the chances to mine a block vary according to the value of the output, but this calculation is not proportional and decreases rapidly. So the best chances to mine PoS are to keep as many outputs as possible just above 1,000 ETP.

This is what the “Optimize” option of the wallet will do for you. It will simply send your ETP to yourself but split into outputs of exactly 1,000 ETP, to guarantee the highest efficiency. It will show you the number of votes you currently have, and how many you can get by reorganizing your outputs.

![Optimize your votes](/images/i/pos_mining_votes.png)

You probably also noticed that there are “pending votes”. A pending vote is a vote that has been spent recently, in a range going from 500 to 1,000 blocks (from 4 to 8 hours). So if an output is spent, if you just received the transaction for instance, its aging will go to 0 and it will be displayed as a pending vote. After 500 to 1,000 blocks, it will become available to mine again. 

The exact aging requirement depends on the PoS difficulty: when there are more PoS miners it will increase till the maximum of 1,000 blocks, while when there are less PoS miners it will decrease to the minimum of 500 blocks.
It’s also important to note that optimizing your votes will send all your ETP to yourself, so this will set back the aging of all your votes to 0. You will then have to wait a few hours to be able to mine again. So try not to use this option too often, and keep this option for when it is really worth it.

![Optimize votes transaction](/images/i/pos_mining_votes_tx.png)

Mining a PoS block will also bring back the aging of the vote used to 0, so after finding a block, this one vote will not be available for mining for the next few hours.

These 2 conditions bring the very minimum amount of ETP required to do PoS mining to 2,000 ETP: 1,000 locked and 1,000 available to have at least 1 vote.


# Start mining

Once the requirements are reached, the description on the right will show you till which block the first requirement is fulfilled, and the number of votes you have. After clicking on Start mining, you will see the mining information of your Avatar. Don’t forget to select a MST to mine, it does not cost you anything and you will receive both ETP and the selected MST as a reward when you find a block.

![Mining started](/images/i/pos_mining_start.png)

Since finding a block creates a new transaction in your wallet, you will receive a new transaction notification each time you find a PoS block.