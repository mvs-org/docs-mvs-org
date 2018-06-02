title: Supernova new features
comments: false
---

# Avatars
## Create an Avatar
The first main feature introduced by Supernova is the Digital Identity, that is called on Metaverse 'Avatar'

To create an Avatar, simply go to the Avatar page, and click on Create Avatar

![createfirstavatar](https://i.imgur.com/WC3aN7f.png)

Choose an Avatar name and select the ETP address that will be linked to this address. Create an Avatar cost 1 ETP and this fee has to be payed with the selected address in order to prove that this address belongs to you. Please make sure to have at least 1 ETP on the selected address

![createavatar](https://i.imgur.com/l2zQbKH.png)

Once created, you can see all your Avatars and their information (Address history and Certificates) in the Avatar main page

![myavatars](https://i.imgur.com/zRm2FWb.png)

In the 'Addresses' page, you can easily recognize the addresses linked to an Avatar from the name and the logo associated

![myaddresses](https://i.imgur.com/gzDJWAE.png)

Finally, you can see all the Avatars created on the blockchain in the "All Avatars" page

![avatars_all](https://i.imgur.com/qkwJlAQ.png)

## Use your Avatar
Your avatar can be used as a Recipient to send and receive ETP or MST. Simply type the Avatar's name as the recipient, and it will be automatically detected as an Avatar if it is registered on the blockchain

![ETPtransfer](https://i.imgur.com/7BQelJ6.png)

On the confirmation page, you can see the address linked to this Avatar. You can double check this address in order to make sure your are sending your transaction to the right recipient

![ETPtransfer_summary](https://i.imgur.com/5TIXpt1.png)

# MST (Assets)
## Create a MST
From Supernova, a MST can only be issued from an Avatar, so please make sure to create an avatar first. It is also this Avatar that will receive the new MST created.

You now have the option to do Secondary Issue in the future. If you select this option, you, as owner and creator of this MST, will receive a certificate giving you the permission to issue more of this MST in the future, and so increase its maximum supply.

![createasset](https://i.imgur.com/4gu2sWU.png)

You can select the secondary issue rules between 3 type:
- Secondary issue impossible: The MST is not allowed to be secondary issued forever, the Maximum Supply is fix and cannot be changed. In that case, you will not receive any Secondary Issue certificate, since this option will not be available. This is the default option, and all the MST created before Supernova are in this category.
- No stacking restriction: The issuer of the MST will receive the Secondary issue certificate that will give him the permission to do a secondary issue at any time, as often as he wants, no matter how many token he owns
- 1 - 100%: This is the Secondary issue rate, the asset can be secondary issued only if the owner owns the Secondary issue certificate also owns at least this percentage of the Maximum supply of the MST

## Transfer a MST
Similarly to ETP, an Avatar can also be used as the recipient to send a MST.

You can also decide to freeze the asset, that you are sending to yourself or to someone else. Please note that at the opposite of ETP Deposit, freeze a MST does not generate an interest.

![assettransfer_model0](https://i.imgur.com/ZOFzKqv.png)

This option could for instance be used during an ICO for investors who would accept to have their MST frozen in exchange of a discount price to buy the MST.

You can also decide to use one of the Attenuation model, to gradually unlock the MST at a specified frequency.

![assettransfer_model1](https://i.imgur.com/P4KXmem.png)

Please make sure the model used match your expectations in the confirmation.

![assettransfer_model1_summary](https://i.imgur.com/ok3Hsqp.png)

You can see your frozen balance of each MST in the 'Home' or 'Assets' page

![home](https://i.imgur.com/orvIE7b.png)

Note that you can now also use a multi-signature address to send and receive a MST.

![assettransfer_multisig](https://i.imgur.com/QJN354o.png)

## Do a Secondary Issue

If you own the Secondary Issue certificate of a MST and match the required owning percentage (if specified at the asset creation), you can do a secondary issue by going to the MST page (click on its symbol in the 'Asset' page, or search for its name in the search section of the top bar).

There, you can see the general information of this MST and click on Secondary Issue if the option has been specified.

![asset](https://i.imgur.com/fWPcqtZ.png)

In the Secondary Issue page, you can specify which Avatar will receive the created MST and how many you want to issue. Please make sure to match the 3 conditions on the right:
- You need to own the secondary issue certificate of this asset
- The selected avatar need to own at least the secondary issue threshold of this MST
- The selected avatar need to have enough ETP to pay the transaction fee (minimum 0.0001 ETP)

![secondaryissue](https://i.imgur.com/QXeJd3O.png)

Similarly to a MST deposit, you can choose to freeze some of the created MST following one of the Attenuation model

Example with Attenuation model 1:
![secondaryissue_model1](https://i.imgur.com/hqxwQqB.png)

Example with Attenuation model 2:
![secondaryissue_model2](https://i.imgur.com/88JqT9U.png)

Always make sure in the confirmation page that the selected model match your expectations
![secondaryissue_model1_summary](https://i.imgur.com/ZGmB7N5.png)

# Certificates

## Check your Certificates

You can see your certificates per Avatar in the Avatar main page. There is 3 types of certificates:
- Secondary Issue: This certificate give you the permission to do a Secondary Issue on a specific Asset. The issuer of an asset automatically get this certificate if the Secondary Issue option has been specified.
- Domain: This certificate give you the ownership of a domain (i.e. if you own the Domain 'MVS', only you can create an asset whose name start with 'MVS.'). The issuer of an asset automatically get this certificate.
- Naming: This certificate give you the permission to create an asset for a specific name (i.e. if you own the Naming 'MVS.ASSET', you have the permission to create the Asset called 'MVS.ASSET' only). It can be created and sent by the Domain owner

## Transfer a Certificate

You can transfer any type of certificate from the 'Transfer Certificate' page

![transfercert](https://i.imgur.com/03p1CEE.png)

## Issue a Certificate

You can issue a certificate from the 'Transfer Certificate' page. Currently, only a Naming certificate can be issued since the Secondary Issue and Domain certificates are automatically generated at the Asset creation.

![issuecert](https://i.imgur.com/f8VDg5n.png)

# Other

## Export your account to a file

You can export your account to a key file via the option 'Export to file'. This file contains your backup words encrypted via your password.
It can be used to import your account to this wallet (full node wallet) on another computer or after an update for instance.
It is also compatible with the lightwallet (http://myetpwallet.com) and can be use to directly open your account in the lightwallet.

![export](https://i.imgur.com/bvlWoQ3.png)

## Export your account to MyETPWallet app

To export your account to the mobile application, simply click on 'Export to app' and scan this QRCode via MyETPWallet app. This QR Code contains your backup words encoded via your password, so your password will be asked in the app in order to decrypt it.

![export_QRCode](https://i.imgur.com/I422Ge5.png)
