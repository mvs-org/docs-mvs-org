title: JSON-RPC 2.0 Usage
comments: false
---

由于历史遗留问题，MVS并不支持JSONRPC2.0标准的**返回数据**；
核心开发者经过讨论，决定更换boost库json相关的代码, 并且根据命令的使用习惯，重新设计了一版新的API(JSONRPC2.0)，旧的主要接口依然保留，废弃的接口移除；
新的API将在v0.7.3发布；

## 命令表

## APIs使用方法
为保证兼容性，我们暂时未更改请求(Request)的格式，依然如下：

*please replace '$parameter' with your own parameter as below.*

**POST HTTP request to '127.0.0.1:8820/rpc2'**.

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
