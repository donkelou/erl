-module(s2_2_server).

-export([start_nano_server/0]).

start_nano_server() ->
	{ok,Listen} = gen_tcp:listen(2345,[binary,{packet,4},
						{reuseaddr,true},
						{active,false}]),
	{ok,Socket} = gen_tcp:accept(Listen),
	gen_tcp:close(Listen),
	loop(Socket).

loop(Socket) ->
	case gen_tcp:recv(Socket,N) of
		{ok,Bin} ->
			io:format("Server received binary = ~p~n",[Bin]),
			Str = binary_to_term(Bin),
			io:format("Server [unpacket] = ~p~n",[Str]),
			Reply = string2value(Str),
			io:format("Server Reply = ~p~n",[Reply]),
			gen_tcp:send(Socket,term_to_binary(Reply)),
			loop(Socket);
		{tcp_closed,Socket} ->
			io:format("Server socket closed~n")
	end.


string2value(Str) ->
    %% 按字符分解字符串
    {ok, Tokens, _} = erl_scan:string(Str ++ "."),
    %% 生成解析表达式
    {ok, Exprs} = erl_parse:parse_exprs(Tokens),
    Bindings = erl_eval:new_bindings(),
    %% 运行表达式
    {value, Value, _} = erl_eval:exprs(Exprs, Bindings),
    Value.
