-module(s1_server).
-export([start/2,rpc/2]).
%% 行为模块


%% 注册进程号
%% 初始化回调函数
start(Name,Mod) ->
	register(Name,spawn(fun() -> loop(Name,Mod,Mod:init()) end)).

%% 客户端接口，被调用
%% 发送消息给服务端
rpc(Name,Request) ->
	Name ! {self(),Request},
	receive
			{Name,Response} -> Response
	end.

%% 服务端，接收消息
%% 回调函数
loop(Name,Mod,State) ->
	receive
		{From,Request} ->
			{Response,State1} = Mod:handle(Request,State),
			From ! {Name,Response},
			loop(Name,Mod,State1)
	end.

