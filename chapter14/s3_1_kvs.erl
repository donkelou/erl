-module(s3_1_kvs).
-export([start/0,store/2,loopup/1]).

start() -> register(kvs,spawn(fun()->loop() end)).

store(Key,Value) -> rpc({store,Key,Value}).
loopup(Key) -> rpc({loopup,Key}).

rpc(Q) ->
	kvs ! {self(),Q},
	receive
		{kvs,Reply} ->
			Reply
	end.


loop() ->
	receive
		{From,{store,Key,Value}} ->
			put(Key,{ok,Value}),
			From ! {kvs,true},
			loop();
		{From,{loopup,Key}} ->
			From ! {kvs,get(Key)},
			loop()
	end.
