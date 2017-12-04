title: API Usage
comments: false
---
This documentation provides more detailed information about the **API(JSON-RPC)** list and will be particularly helpful for people who want to build BaaS(Blockchain As A Service) appliacations. If you are interested in more basic usage of Metaverse, please refer to the [docs](../docs) instead.

Please note that this documentation is only valid for MVS FULL NODE.
You can refer to [Metaverse wiki](https://github.com/mvs-org/metaverse/wiki/Metaverse-API-Call-List) instead as well.

## APIs Usage

*please replace '$parameter' with your own parameter as below.*

**POST HTTP request to '127.0.0.1:8820/rpc' for All JSON-RPC**.

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

## NOTICE
MVS full node uses boost library - property_tree to build json format response.However, we found a problem [ptree write_json does not conform to JSON standard](https://svn.boost.org/trac10/ticket/9721) on boost once again.`The Boost write_json method puts quotes around all values, not just strings.`

So we will provide [JSON-RPC 2.0 calls](/jsonrpc2) to support json-rpc 2.0 standard response , and more commands in version **0.7.3**.

