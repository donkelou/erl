-module(s1_1_tcp).
-import(lists,[reverse/1]).
-export([nano_get_url/0]).


nano_get_url() ->
	nano_get_url("192.168.0.143").

nano_get_url(Host) ->
	%% 二进制模式打开套接字，把请求数据用二进制传给程序
	%% 把未经修改得TCP数据直接传给应用程序
	{ok,Socket} = gen_tcp:connect(Host,80,[binary,{packet,0}]),
	ok = gen_tcp:send(Socket,"GET / HTTP/1.0\r\n\r\n"),
	receive_data(Socket,[]).

receive_data(Socket,SoFar) ->
	receive
		{tcp,Socket,Bin} ->
			receive_data(Socket,[Bin|SoFar]);
		{tcp_closed,Socket} ->
			string:tokens(SoFar," ")
			%% io:format("~p~n",[SoFar])
			%% list_to_binary(reverse(SoFar))
	end.

