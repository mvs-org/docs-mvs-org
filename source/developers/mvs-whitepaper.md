title: Metaverse White Paper (brief)
comments: false
---

## Abstract
Metaverse is a blockchain project that provides a foundational infrastructure for social and enterprise needs. Our goal is to construct a universe where digital assets (Metaverse Smart Token, or MST) and digital identities (Avatar) build the basis for asset transactions with the help of a value intermediary (Oracle), thus establishing a new blockchain ecosystem that will transform human society and allow us to enter the New Reality.

Unlike other blockchain projects that use technology as an entry point, Metaverse started from an enterprise value creation perspective, with the relationships between people, people and assets as the core foundations of our project. We describe this relationship through the use of BISC (Built-in Smart Contract), which can reduce the technical risks of commercial applications during development and usage.

Through BISC, Metaverse provides functionalities in digital assets (MST), digital identities (Avatar), Oracles, and MST exchanges. Through the use of MST, users reap the advantages of blockchain technology, such as the power to generate and distribute their own cryptocurrency. The digital identity Avatar reflects the relationship between people, people and assets, and this Avatar can be linked to MST. Through the use of Avatars, anyone can become value intermediary Oracles, and Oracles can help construct an immutable decentralized system (Reputation). MST can resolve fundamental liquidity issues in asset trading, thus solving a critical problem in any financial system.

MST and Avatar are utilized under blockchain technology that is fundamentally integrated with IT systems. This process can be described as BaaS (Blockchain as a Service). BaaS is a quick and convenient way to build blockchain applications. 

### Digital Assets (MST)

Digital assets on Metaverse can be characterized as the Metaverse Smart Token, or MST. MST reemphasizes the importance of digital assets, that for smart contracts to work, they need digital assets and not the other way around. 

Currently, Metaverse has made technical extensions to Bitcoin's UTXO model. Bitcoin's UTXO features will be added to MST, including security, traceability, and ACID features. MST gives everyone the ability to issue Bitcoin at the same price. MST can be used for peer-to-peer payments and also supports a variety of financial instruments such as asset additions and asset replacements.

### Digital Identities (Avatar)

Unlike assets such as gold, we are unable to take physical possession of digital assets. Instead, the ownership of digital assets is controlled by individuals through digital identities and secured through mathematical proofs that ensure these identities cannot be forged. As a symbol of a user's online identity, an Avatar can be used to represent oneself and hold digital assets on the blockchain.

Creating an Avatar is far more than giving your public key an alias, just as ID cards and mobile numbers are not an alias for your name. Various pieces of valuable information will be attached to each Avatar’s unique index and encrypted to ensure data privacy. Unless the Avatar’s owner grants authorization (by providing the private key signature, initiating a special transaction, or using smart contracts), users will not have access to encrypted or unencrypted information. Hence, zero-knowledge proofs and homomorphic encryption play a vital role in allowing Avatars to retrieve information such as credit scores and validation results without revealing the contents of a message.

Although the Bitcoin system allows a user to hold Bitcoin anonymously using public and private keypairs, most activities in the real world require us to provide some form of personal information: for example, you must provide your age and gender to join a young female entrepreneur’s club. 

We call the digital identity on the Metaverse Blockchain the Metaverse Avatar.

### Value Intermediaries (Oracles)

As the Value Intermediary of the Metaverse ecosystem, Oracles are responsible for validating the authenticity and validity of data sources. Apart from individual identities, we have also introduced third parties such as trustees, regulators, and identity certification authorities to act as Oracles to endorse the authenticity of data. Additionally, Oracles also enrich the types of transactions available, increasing the value of blockchains.

## BaaS（Blockchain-as-a-Service）

The concept of BaaS (Blockchain as a Service) refers to allowing enterprises or individuals to customize blockchain services provided by blockchain solutions providers to cater to their actual needs.

As China’s leading open-source public blockchain, Metaverse will continue to improve its digital identity system and expand applicable infrastructure services in order to engage more third-party developers to build applications based on the Metaverse blockchain, increasing the ease of use of our asset and identity management services for ordinary users.

## Consensus Mechanisms

### Basic Information

The blockchain consensus process refers to the process of objectively recording network transaction data in an immutable fashion. Consensus is mainly realized through consensus algorithms. For now, Metaverse will implement two consensus mechanisms. The details are as follows:

### First phase: PoW
Considering ASIC's centralized mining pool, we chose the ETHASH algorithm as the mining algorithm for Metaverse. The PoW mechanism will be maintained for some time.
Metaverse uses Ethereum’s mining algorithm Ethash (aka Dashimoto/Dagger-Hashimoto). A feature of ETHASH is that mining efficiency is not linked to CPU performance, but rather is positively correlated with memory size and bandwidth. The ETHASH algorithm demands large memory sizes and bandwidths to prevent mining setups using shared memory systems from achieving linear or superlinear gains in mining efficiency. 

### Second phase: HBTH-DPoS
Although PoW mining can help safeguard Metaverse’s system security in the initial years, it has flaws such as energy waste and the tendency for mining centralization.  The DPoS algorithm implemented from Graphene can contribute to a high performing blockchain system. 


## Elliptic Curve Digital Signature Algorithm (ECDSA)

ECDSA is a cryptographic algorithm used to ensure that all the information of the exchange are recorded in each block and each block will generate its corresponding digital signature to verify the information validity. The security of ETP will be guaranteed by the ECDSA.

## Unspent Transaction Output (UTXO)

Unlike Ethereum, Metaverse’s native digital token ETP will use Bitcoin’s UTXO (Unspent Transaction Output) model in which all transactions are defined by a set of inputs and outputs, and contain the private key signatures of all current and previous owners of the ETP. These elements come together to form a new UTXO. Separately, we will be testing the use of the account model to handle smart assets. This can help reduce system complexity while retaining the benefits of the UTXO model.

The result of this design is that digital assets can be sent and received easily on Metaverse, just like Bitcoin. Smart contracts will only be required when the demand for more complex transactions arise.

