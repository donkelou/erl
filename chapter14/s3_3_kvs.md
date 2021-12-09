在同一局域网内的两台机器上执行 **s3_1_kvs**模块

在机器1（192.168.0.111）的node1节点上启动服务端程序（代码只在此机器上）

```erlang
erl -name node1@192.168.0.111 -setcookie abc

s3_1_kvs:start().
```

在机器2（192.168.0.143）的node2节点上发送消息（存储和查询）

```erlang
erl -name node2@192.168.0.143 -setcookie abc

rpc:call('node1@192.168.0.111',s3_1_kvs,store,[weather,fine]).

rpc:call('node1@192.168.0.111',s3_1_kvs,loopup,[weather]).
```

cookie系统使得两个节点安全的建立通信，可以通过以下两个方法设置和查询节点的cookie

```erlang
erlang:get_cookie().

erlang:set_cookie(node(),atomValue).

```



