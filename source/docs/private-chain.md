title: Build Private Chains
comments: false
---

## Refer to [Compiling] and [options]
With reference to the above document, we can build private chains based on Metaverse by setting configuration files without the need to change the code.


```bash
# mvs configuration file exmaple

[network]
# The magic number for message headers
identifier = 0x6d73766d
# The port for incoming connections, defaults to 5251 (15251 for testnet).
inbound_port = 5251
```

By modifying the `identifier`, we can implement different blockchain instances.
Developers don’t have to be worried even it runs in the main network mode, because block generation speed is very fast and they can use the CPU to continue mining test.

