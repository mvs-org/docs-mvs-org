title: Address
comments: false
---

### Description

generate new address from specified account.
* **main-net address begin as 'M': MSCc2y6fyu31fkX4dAwp2qsAPuurcc86rM**
* **test-net address begin as 't': tDFbSYVpNsAkQ4aG84HZhtAGHWJq75r39w**

We show examples here with testnet address.

### getnewaddress
```bash
./mvs-cli getnewaddress -n 2 testaccount testaccount
{
    "addresses": [
        "tDFbSYVpNsAkQ4aG84HZhtAGHWJq75r39w",
        "tVXYCvbGxqgKFhhfBp6KpqH7wfoYvSwbPr"
    ]
}
```

### listaddresses
```bash
./mvs-cli listaddresses testaccount testaccount
```
```json
{
    "addresses": [
        "tDFbSYVpNsAkQ4aG84HZhtAGHWJq75r39w",
        "tVXYCvbGxqgKFhhfBp6KpqH7wfoYvSwbPr"
    ]
}
```
