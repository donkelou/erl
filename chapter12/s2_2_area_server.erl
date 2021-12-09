-module(s2_2_area_server).
-export([loop/0,rpc/2]).

rpc(Pid,Request) ->
	Pid ! {self(),Request},
	receive
		{Pid,Response} ->
			Response
	end.

loop() ->
	receive
		{Form,{rectangle,Width,Ht}} ->
			Form ! {self(),Width * Ht},
			loop();
		{Form,{square,Side}} ->
			Form ! {self(),Side * Side},
			loop()
	end.
