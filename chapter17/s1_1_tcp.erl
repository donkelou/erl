-module(s1_1_tcp).
-export([nano_get_url/1,nano_get_url/0]).


nano_get_url() ->
	nano_get_url("192.168.0.143").

nano_get_url(Host) ->
	{ok,Socket} = gen_tcp:connect(Host,80,[binary,{packet,0}]),
	ok = gen_tcp:send(Socket,"GET / HTTP/1.0\r\n\r\n"),
	receive_data(Socket,[]).

receive_data(Socket,SoFar) ->
	receive
		{tcp,Socket,Bin} ->
			receive_data(Socket,[SoFar|Bin]);
		{tcp_close,Socket} ->
			list_to_binary(SoFar)
	end.
