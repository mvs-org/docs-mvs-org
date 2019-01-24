title: Websocket
comments: false
---

## Description

Websocket provides developers those notifications when specified address transactions arrived.

Check `mvs.conf`, defaults websocket service enable:
```bash
    [server]
    websocket_listen = 127.0.0.1:8821
    websocket_service_enabled = true
```

## Methods 

1. Subscribe to all addresses:
```
{"event": "subscribe", "channel": "tx", "address":[]}
```
or
```
 {"event": "subscribe", "channel": "tx", "address":""}
```

2. Subscribe to one address:
```
{"event": "subscribe", "channel": "tx", "address":["MJNo92g6DavpaCZbYjrH45iQ8eAKnLqmms"]}
```
or
```
{"event": "subscribe", "channel": "tx", "address":"MJNo92g6DavpaCZbYjrH45iQ8eAKnLqmms"}
```

3. Subscribe to many addresses:
```
{"event": "subscribe", "channel": "tx", "address":["MJNo92g6DavpaCZbYjrH45iQ8eAKnLqmms", "MVk2n7kxKor1DqcxBNLLyXFbexq4kZ3rfp"]}
```

4. Publish information
Add topic to the publish information. The value of "topic" filed can be "all", a address or a list of addresses.
```
{
    "channel" : "tx",
    "event" : "publish",
    "result" : 
    {
        "hash" : "d0102c0b5c55398eaca7e75780e4c5f7bdd7d79ca3853dbd5ae7e6120cfe9ad6",
        "height" : 0,
        "inputs" : 
        [
            {
                "address" : "tJNo92g6DavpaCZbYjrH45iQ8eAKnLqmms",
                "previous_output" : 
                {
                    "hash" : "414aab9bbb2b7fdad4b80cf7c83ec97d9714114120107c114c9deb033508cb88",
                    "index" : 1
                },
                "script" : "[ 304402201f1b1a3bf217f609ff993a2213b4ef313feec436f27b589443b3526c41fe12ab02201ed05726d6e968893ac6b798e764ca34e4e597d5311641816c66dfe26af3672901 ] [ 0270ea1252af455e5d1ada1dfda9d47387dd0c483ead95f70e08a6379d03962453 ]",
                "sequence" : 4294967295
            }
        ],
        "lock_time" : "0",
        "outputs" : 
        [
            {
                "address" : "t7cFpPtYDSrR4w873wF2zKjbHgsHBUPnGC",
                "attachment" : 
                {
                    "type" : "etp"
                },
                "index" : 0,
                "locked_height_range" : 0,
                "script" : "dup hash160 [ 077fc0219517c6924ffd89a891a6e035d77db544 ] equalverify checksig",
                "value" : 1234
            },
            {
                "address" : "tJNo92g6DavpaCZbYjrH45iQ8eAKnLqmms",
                "attachment" : 
                {
                    "type" : "etp"
                },
                "index" : 1,
                "locked_height_range" : 0,
                "script" : "dup hash160 [ 7d9d74d3ca1f594f3e45416ca9509f77cd550f39 ] equalverify checksig",
                "value" : 79968766
            }
        ],
        "version" : "4"
    },
    "topic" : 
    [
        "tJNo92g6DavpaCZbYjrH45iQ8eAKnLqmms",
        "t7cFpPtYDSrR4w873wF2zKjbHgsHBUPnGC"
    ]
}
```

5. subscribe/unsubscribe to block
```
{"event": "subscribe", "channel": "block"}
{"event": "unsubscribe", "channel": "block"}
```

publish result:
```
{ 
    "channel" : "block", 
    "event" : "publish", 
    "result" : { 
        "bits" : "2826361", 
        "hash" : "cbf3df70d311ee35cf6aab0702268d65c31f44621c98b9d55c28f8ba1db62ebf", 
        "merkle_tree_hash" : "c65f2854fbaa1898dad356b7fba1fbfbc8b7c262f28d179ab8347a71771e4fa9", 
        "mixhash" : "77142106928542514581224679333144924973190017740408312606415185136453624431385", 
        "nonce" : "8618673295923534265", 
        "number" : 625776, 
        "previous_block_hash" : "80565132bbabd0a470aaddfe93a6bdc4d228910bec1bdd40a102cd50c6df3e84", 
        "timestamp" : 1534935094, 
        "transaction_count" : 1, 
        "transactions" : [ 
            { 
                "hash" : "c65f2854fbaa1898dad356b7fba1fbfbc8b7c262f28d179ab8347a71771e4fa9", 
                "inputs" : [ 
                    { 
                        "previous_output" : { 
                            "hash" : "0000000000000000000000000000000000000000000000000000000000000000", "index" : 4294967295 
                        }, 
                        "script" : "[ 03708c09 ]", 
                        "sequence" : 0 
                    } 
                ], 
                "lock_time" : "0", 
                "outputs" : [ 
                    { 
                        "address" : "tLpU3eqiACcqj8fp7DZEuHU1B3mKsCYGbL", 
                        "attachment" : { 
                            "type" : "etp" 
                        }, 
                        "index" : 0, 
                        "locked_height_range" : 0, 
                        "script" : "dup hash160 [ 986895cc5c2e644f65cf1b749397960ec488a957 ] equalverify checksig", "value" : 162108026 
                    } 
                ], 
                "version" : "1" 
            } 
        ], 
        "version" : 1 
    } 
}
```

6. subscribe/unsubscribe to height
```
{"event": "subscribe", "channel": "height"}
{"event": "unsubscribe", "channel": "height"}
```

publish result:
```
{ "channel" : "height", "event" : "publish", "result" : 625774 }
```

7. get version
request:
```
{"event": "version"}
```

response:
```
{"event" : "version", "result" : { "protocol" : "3", "wallet" : "0.8.3" } }
```

8. ping/pong
request:
```
{"event": "ping"}
```

response:
```
{"event" : "ping", "result" : "pong"}
```

## Testing
Open `{metaverse root dir}\test\test-ws\mvsd-ws.html` to test.
