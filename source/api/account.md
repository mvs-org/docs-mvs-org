title: Account
comments: false
---

### Description

MVS Account is based on [Hierarchical Deterministic, BIP32](https://bitcoin.org/en/glossary/hd-protocol).
It's unnecessary to reserve your random-private-keys, only one master-key that is mnemonic for 24 words needs to be backed up.
**It's extremely crucial and important to backup your master-key's mnemonic phrase. If you ever lose it, all assets will be gone.**

ccount:
generate new account from MVS. Consider accountname/password as your master key's alias.
```
./mvs-cli getnewaccount testaccount testaccount
```
```json
{
    "mnemonic": "grass proud sight meat normal quarter diagram explain slush mansion dawn gravity catalog task survey kiss major brick suit tenant version symptom lecture trial",
    Ut3do46xpaJm8n9haF",
        "tFC4cgNbf5YhmezpPQaRw6jiURn2dZmWom",
        "tFQEpwNCLZ1HBGDotcV9GwB96YeqdsVBqo",
        "tPi2ELoUcetnripJezMR7EtGmSuJzNuHX4",
        "tH51xDR4WTQvhfHD9wc393YnvkQZVMywDS"
    ]
}
```

### changepasswd
```bash
./mvs-cli changepasswd testaccount testaccount -p newpassword
```

}
```

### getaccount
Show some existed account. Please see help message for details.
```
./mvs-cli getaccount testaccount testaccount trial
```
```json
{
    "name": "testaccount",
    "mnemonic-key": "grass proud sight meat normal quarter diagram explain slush mansion dawn gravity catalog task survey kiss major brick suit tenant version symptom lecture trial",
    "address-count": "1",
    "user-status": "2"
}
```

### importaccount
```
./mvs-cli importaccount -n importaccount -p importaccountpasswd -i 10 grass proud sight meat normal quarter diagram explain slush mansion dawn gravity catalog task survey kiss major brick suit tenant version symptom lecture trial
```
```json
{
    "name": "importaccount",
    "mnemonic": "grass proud sight meat normal quarter diagram explain slush mansion dawn gravity catalog task survey kiss major brick suit tenant version symptom lecture trial",
    "hd_index": "10",
    "addresses": [
        "tVXYCvbGxqgKFhhfBp6KpqH7wfoYvSwbPr",
        "tDFbSYVpNsAkQ4aG84HZhtAGHWJq75r39w",
        "tK4bRgUT42MGXFTnRgSnz3KfByPz6fvfsG",
        "tHnWqhZP2mn8iib9LtisjiKzkTBjsek67s",
        "tCExdKzkiQX4YgkCV4YPqQdSqNVqRyGibt",
        "tRxqhHcd3
