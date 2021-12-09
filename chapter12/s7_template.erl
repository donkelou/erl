-module(s7_template).
-compile(export_all).

start() ->
	spawn(?MODULE,loop,[]).

rpc(Pid,Request) ->
	Pid ! Request,
	receive
		{Pid,Response} ->
			Response
	end.

loop(X) ->
	receive
		Any ->
			io:format("Received:~p~n",[Any]),
			loop()
	end.
