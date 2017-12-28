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

* ### Subscribe all transactions
```json
    {"event": "subscribe", "channel": "tx", "address":""}
```

* ### Subscribe transaction contains target address
```json
    {"event": "subscribe", "channel": "tx", "address":"MGqHvbaH9wzdr6oUDFz4S1HptjoKQcjRve"}
```

* ### UnSubscribe
```json
    {"event": "unsubscribe", "channel": "tx"}
```


## Testing
Open `{metaverse root dir}\test\test-ws\mvsd-ws.html` to test.
