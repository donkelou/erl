-module(s2_1_area_server).
-export([loop/0,rpc/2]).

rpc(Pid,Request) ->
	Pid ! {self(),Request},
	receive
		Response ->
			Response
	end.

loop() ->
	receive
		{Form,{rectangle,Width,Ht}} ->
			sleep(),
			Form ! Width * Ht,
			loop();
		{Form,{square,Side}} ->
			sleep(),
			Form ! Side * Side,
			loop()
	end.

sleep() ->
	receive
	after 3000 ->
		true
	end.
