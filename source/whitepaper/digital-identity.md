title: Digital Identity
comments: false
---

## The Essence of Digital Identity
  Digital Identities in Metaverse are unique because their modules are embedded in Metaverse’s protocols and supporting applications have been developed for them. Users have a defined autonomous identity - they are in full control of their identities, and hence need not rely on any central entity or third party for identity verification. They can create, sign, and verify claims and make transactions, while other people who interact with users can help the user prove their identities. In addition, users with autonomous digital identities can selectively
disclose their information.
  Digital identities are an integral part of the virtual world and can take many forms, such as that of individuals or value intermediaries (institutions and entities).  Therefore, individuals can have different digital identities in different scenarios (workplace or other places), but all in fact will be supported by their true identities.

## Use Cases

  There are many use cases for identity systems embedded within a blockchain
protocol.
  If a person owns multiple digital identities and wants to open an account at Bank B, then he can indicate that he has already had an account at Bank A. Because of this, Bank B will authorize him to open an account at their bank. This use case can be replicated at multiple banks within the same legal jurisdiction.  In addition, digital identity is also applicable in the field of digital rights. Digital assets that are issued by a digital identity and possess multiple credentials will be more valuable in the market, thereby facilitating the transfer of different types of value other than from encrypted digital currencies. End users will be able to use their digital identity to claim copyrights and other assets. Apart from authorizing certification information, users can also authorize others to access their private data (such as reputation and credit data).

## The Operating Procedure of Digital Identities

* **Creation**
  Any user can create a digital identity and bind it with his/her master private key.  If a user creates a digital identity but does not bind it to any master private key, this DID will be regarded as an unauthenticated account and will not be able to access to any of its functionalities or applications.  Master private key holders who have registered their asset on the Metaverse blockchain can also choose not to bind any digital identities. Users must take initiative, because Metaverse does not automatically create digital identities for any user. The decision to bind a DID lies with the master private key’s holder.

* **Verification**
  Profiles can provide effective chains of proof that demonstrate objective facts of any specified digital identity. For users, they first need to prove that a digital identity belongs to them by binding the transaction to the DID (since the transaction domain contains DID information).

* **Authorization**
  First, we should clarify the situations that would require authorization: authorization is often related to transactions. Assume A requests to inspect B’s digital identity information (asset information) before providing any services.  There are two possibilities:
1. B has large amounts of assets on-chain, more than 1 million ETP. B can simply disclose his asset information to A.
2. B has few on-chain assets, but many off-chain assets. The traditional approach is for B to convert assets to ETP for authorization. Currently, Metaverse recommends that users issue their assets and get them verified by an Oracle, after which they will be registered as valid assets belonging to one’s digital identity.

- Authorization process:
  A sends a request to B which triggers a script that verifies the asset information of the target account, then sends A’s encrypted result back. B is unable to know which result contains information corresponding to the asset verification.  Additionally, the initial request is also encrypted. Thus, B does not know the specific request of A, only what information was requested. Personal transaction and asset records can be accessed after permission is given on8 chain, but the basic principle remains unchanged.  Personal customized fields are similar to assets that undergo Oracle authentication (information that has not been approved by an Oracle can still be authorized, but this is not recommended).  If the personal customized field contains nonpublic information such as mailbox and phone numbers, no Oracle authentication is required. However, if the information is certified (such as schooling records), then Oracle authentication
will be required.

- Authentication process:
  The authentication of personal customized information An Oracle’s data-feed is used for endorsement. An Oracle is introduced as a third party and publishes all Profiles on the blockchain for public inquiry and supervision. Oracles are usually organizations, and these organizations should publish their own profile and DID information on the official website.  Firstly, B fills in the customizable field with information that needs to be proved.  The Oracle must then use its master private key to sign the information and employ a larger sum of coindays to endorse it.  A can make a request for the field’s information (including the Oracle endorsement) on-chain. If A is convinced that B’s information is valid, he can continue providing services to B.

* **Query**
  Since the concept of DIDs has been introduced by digital identities at the beginning, DIDs can be used to conduct over-the-counter (OTC) trades with its ability to create transactions in the trading market.  We can query a DID’s current transaction requests and past transactions in the open market by entering the DID into the address query bar in the trading market. Conversely, a DID’s behavior and records in the market can be used as data to build digital identities.
