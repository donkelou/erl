-module(s1_2_server).

-export([start_nano_server/0]).

start_nano_server() ->
	{ok,Listen} = gen_tcp:listen(2345,[binary,{packet,4},{reuseaddr,true},{active,true}]),
	{ok,Socket} = gen_tcp:accept(Listen),
	gen_tcp:close(Listen),
	loop(Socket).

loop(Socket) ->
	receive
		{tcp,Socket,Bin} ->
			io:format("Server received binary = ~p~n",[Bin]),
			Str = binary_to_term(Bin),
			io:format("Server [unpacket] = ~p~n",[Str]),
			%% Reply = lib_misc:string2value(Str),
			Reply = list_to_tuple(Str),
			io:format("Server Reply = ~p~n",[Reply]),
			gen_tcp:send(Socket,term_to_binary(Reply)),
			loop(Socket);
		{tcp_closed,Socket} ->
			io:format("Server socket closed~n")
	end.
