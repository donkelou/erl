-module(s1_name_server3).
-export([init/0,add/2,find/1,handle/2]).
-import(s1_server3,[rpc/2]).
%% 回调函数模块

%% 操作函数
add(Name,Place) -> rpc(name_server,{add,Name,Place}).

find(Name) -> rpc(name_server,{find,Name}).

%% 初始化
init() -> dict:new().

%% 间接处理操作函数
handle({add,Name,Place},Dict) ->{ok,dict:store(Name,Place,Dict)};
handle({find,Name},Dict) -> {dict:find(Name,Dict),Dict}.