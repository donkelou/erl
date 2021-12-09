-module(s2_3_area_server).
-export([loop/0,eare/2,start/0]).

start() ->
	spawn(s2_3_area_server,loop,[]).

eare(Pid,What) ->
	rpc(Pid,What).

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
		{Form,{circle,R}} ->
			Form ! {self(),R*R*3.14159},
			loop();
		{Form,{square,Side}} ->
			Form ! {self(),Side * Side},
			loop()
	end.
