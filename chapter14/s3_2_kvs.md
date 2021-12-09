在同一台机器的不同节点上执行 **s3_1_kvs**模块

在节点1 node1 上启动服务端程序
```erlang
s3_1_kvs:start().
```



在节点2 node2 上启动客户端程序，通过

```erlang
rpc:call(node1,s3_1_kvs,store,[weather,fine]).

```
向服务端发送消息。

通过

```erlang
rpc:call(node1,s3_1_kvs,loopup,[weather]).
```
向服务端查询消息
