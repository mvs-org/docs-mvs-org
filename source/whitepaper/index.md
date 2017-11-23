title: Metaverse White Paper
comments: false
---

## Metaverse Three Pillars

Metaverse is China’s leading open-source public blockchain and is committed to providing users with convenient and secure infrastructure services based on blockchain technology to establish a smart decentralized network. The three pillars of Metaverse are digital assets, digital identities and value intermediaries.

### Digital Assets

Digital assets refer to definable, editable assets that exist in the form of electronic data in Metaverse and are protected by blockchain encryption technology. Users can freely create and register digital assets in Metaverse and utilize a suite of functions including gifting, transfers, pledging and trading.

### Digital Identities (Avatar)

Digital identity is the general name given to an account’s profile information, corresponding to the master private key that belongs to a user. Each profile has a unique identifier called a DID (Digital Identity) in Metaverse. Digital assets are owned by individuals through digital identities. In turn, these digital identities are secured through mathematical concepts to ensure they cannot be forged. As a symbol of one’s online identity, Avatars can be used to represent oneself and hold digital assets on the blockchain. Digital identities enable users to create, endorse and verify their identities without relying on third parties, allowing digital identity holders to manage any type of asset easily.

### Value Intermediaries (Oracles)

As the Value Intermediary of the Metaverse ecosystem, Oracles are responsible for validating the authenticity and validity of data sources. Apart from individual identities, we have also introduced third parties such as trustees, regulators, and identity certification authorities to act as Oracles to endorse the authenticity of data. Additionally, Oracles also enrich the types of transactions available, increasing the value of blockchains.

## BaaS（Blockchain-as-a-Service）

The concept of BaaS (Blockchain as a Service) refers to allowing enterprises or individuals to customize blockchain services provided by blockchain solutions providers to cater to their actual needs.

As China’s leading open-source public blockchain, Metaverse will continue to improve its digital identity system and expand applicable infrastructure services in order to engage more third-party developers to build applications based on the Metaverse blockchain, increasing the ease of use of our asset and identity management services for ordinary users.

## Token Information

The token used by Metaverse is called ETP; it represents the rights and interests of Metaverse. The maximum total supply of ETP is 100 million, and the smallest fraction of ETP that can be sent is 1 x 10-8 ETP. ETP can be used to measure the value of smart properties in Metaverse or as collateral in financial transactions. Additionally, fees applied on Metaverse (to create new smart properties, register a new Avatar, designate yourself as an Oracle or invite trusted institutions to verify assets and identities on Metaverse) must be paid in ETP.

The Metaverse Project has distributed 25 million ETP in its first Initial Coin Offering (ICO). Another 25 million ETP will be used to set up the Metaverse Foundation to support blockchain ICO projects that benefit the Metaverse community, facilitate investment activities that enhance Metaverse’s ecosystem and reward major contributors to the community. Additionally, 30 million ETP will be distributed to the maintainers of the system as mining rewards.

Considering that token loss may occur and the possibility that a large amount of ETP may be pledged or hoarded, the ETP economic model we have designed requires the introduction of micro-inflation to meet the demand for ETP circulation. Metaverse incorporated a paid coinlock function at the system level while designing ETP’s economic model. This design is the first of its kind – it can be thought of as the tokenization of coin age, and it paves the way for a PoS-based economic model in the future as well as financial applications derived from the coinlock function. To obtain ETP rewards, users must take the initiative to use the coinlock function. This reward will be sent together with the principal amount to the user’s coinlock address through a coinbase transaction once the locking period ends. We will continue to release small amounts of ETP in an orderly fashion through coinlock rewards, with specific reward amounts determined by the total amount of coins deposited and the locking period chosen. ETP inflation rates will be fed back into the algorithm determining coinlock reward rates, allowing it to be dynamically adjusted.

This feedback mechanism enables the system to self-adjust and recover and will be upgraded in subsequent versions of Metaverse to be more robust. Our end goal is to realize more intuitive economic models and a more effective economic environment on the Metaverse platform.

## Consensus Mechanisms

### Basic Information

The blockchain consensus process refers to the process of objectively recording network transaction data in an immutable fashion. Consensus is mainly realized through consensus algorithms. For now, Metaverse will implement two consensus mechanisms. The details are as follows:

### First phase: PoW
In the first few years of the Metaverse system’s operations, GPU mining and a decentralized timestamp system will be employed to secure the system. The mining algorithm that Metaverse will adopt is still under development, but we will avoid Bitcoin’s SHA256 and Litecoin’s scrypt algorithms to avoid 51% attacks from Bitcoin and Litecoin mining pools. At the time of this writing, Metaverse plans to use the Ethash algorithm.

### Second phase: HBTH-DPoS

Although PoW mining can help safeguard Metaverse’s system security in its initial years, it has flaws such as energy waste and the tendency for mining centralization to emerge. 

Most cryptocurrencies choose to ignore Byzantine fault tolerant algorithms as they fail to resolve token distribution issues. Although Metaverse’s ETP is not a currency, as a repayment for their contribution to network safety, it will be distributed to nodes as repayment for their contribution to network safety.

The total amounts of full nodes is inadequate in the early phases of any blockchain project, making it more difficult to guarantee the entire network’s system security. Through the introduction of PoW mining, Metaverse will distribute ETP to mining nodes as block rewards, allowing the network to attract a large number of full nodes that can secure the system in its early stages. 

As the project matures in the future, the ETP distribution used to provide mining rewards will draw to a close and Metaverse will switch over to an improved DPoS consensus algorithm. This algorithm will consider “Token Height Destroyed” in its design.

Metaverse improved the DPoS consensus protocol by adding the concepts of Token-Height and HeartBeat. The basic model is as follows: 
-   Token-Height (TH) originates from the concept of Bitcoin Days Destroyed;
-   Bitcoin Days Destroyed = number of Bitcoins in a transaction * number of days since the Bitcoins were last spent;
-   TH = number of ETP in a transaction * number of blocks since the ETP was last spent * Metaverse constant

By using TH to weight votes in DPoS, Metaverse aims to avoid financial interference issues. If attackers were to temporarily acquire large amounts of ETP to influence voting, their TH value would be very small, thus giving them little influence over the voting process. To achieve their goal, attackers must either acquire more ETP from the market or hold the ETP for a sufficient amount of time to gather TH. Both methods significantly increase the cost of an attack.

In the DPoS phase, Metaverse will distribute ETP to ETP holders based on their prevailing stake, similar to other systems utilizing the PoS consensus protocol. However, the difference is that ETP holders will not receive ETP passively. Rather, they must send a “HeartBeat” to the system to indicate that they are still active. At the same time, this HeartBeat is equivalent to a digital signature from the owner's private key; ETP holders must choose to either replace or maintain their delegate when sending the HeartBeat. 

In the DPoS phase, we will also consider using an improved Power-DPOS algorithm.

## ETHASH algorithm

Metaverse uses Ethereum’s mining algorithm Ethash (aka Dashimoto/Dagger-Hashimoto). A feature of ETHASH is that mining efficiency is not linked to CPU performance, but rather is positively correlated with memory size and bandwidth. The ETHASH algorithm demands large memory sizes and bandwidths to prevent mining setups using shared memory systems from achieving linear or superlinear gains in mining efficiency. 

##Elliptic Curve Digital Signature Algorithm (ECDSA)

ECDSA is a cryptographic algorithm used to ensure that all the information of the exchange are recorded in each block and each block will generate its corresponding digital signature to verify the information validity. The security of ETP will be guaranteed by the ECDSA.

## Unspent Transaction Output (UTXO)

Unlike Ethereum, Metaverse’s native digital token ETP will use Bitcoin’s UTXO (Unspent Transaction Output) model in which all transactions are defined by a set of inputs and outputs, and contain the private key signatures of all current and previous owners of the ETP. These elements come together to form a new UTXO. Separately, we will be testing the use of the account model to handle smart assets. This can help reduce system complexity while retaining the benefits of the UTXO model.

The result of this design is that digital assets can be sent and received easily on Metaverse, just like Bitcoin. Smart contracts will only be required when the demand for more complex transactions arise.

