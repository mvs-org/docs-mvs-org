title: API Usage
comments: false
---
This documentation provides more detailed information about the API and will be particularly helpful for people who want to build BaaS(Blockchain As A Service) appliacations. If you are interested in more basic usage of Metaverse, please refer to the [docs](../docs) instead.

Please note that this documentation is only valid for MVS FULL NODE.

You can refer to [Metaverse wiki](https://github.com/mvs-org/metaverse/wiki/Metaverse-API-Call-List) instead present.

## APIs Usage

*please replace '$parameter' with your own parameter as below.*

**All Json-rpc call POST HTTP request to '127.0.0.1:8820'**.

if we use
```bash
./mvs-cli $command $param1 $param2 ...
```
that should be equal as below in RPC-CALL case:

Build Json, then POST to 'http://127.0.0.1:8820/rpc'
```json
{
    "method":"$command",
    "params":["$param1", "$param2", ...]
}
```
Obviously, you should use help command for all commands.
```bash
# see all commands
./mvs-cli help
# see help message of this command
./mvs-cli help $command
```
Check here for the instance of source codes: <https://github.com/ViewBTC/mvs-exchange-tools> (keep updating).

Some [Documentation For Server Setup](http://blog.mvs.live/metaverse-setup-guide-for-service/) in Chinese.
