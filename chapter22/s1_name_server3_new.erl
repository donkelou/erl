-module(s1_name_server3_new).
-export([init/0,add/2,find/1,delete/1,all_names/0,handle/2]).
-import(s1_server3,[rpc/2]).
%% 回调函数模块

%% 操作函数
all_names() 	-> rpc(name_server,allNames).
add(Name,Place) -> rpc(name_server,{add,Name,Place}).
delete(Name) 	-> rpc(name_server,{delete,Name}).
find(Name) 		-> rpc(name_server,{find,Name}).

%% 初始化
init() -> dict:new().

%% 间接处理操作函数
handle(allNames,Dict) 			-> {dict:fetch_keys(Dict),Dict};
handle({add,Name,Place},Dict) 	-> {ok,dict:store(Name,Place,Dict)};
handle({delete,Name},Dict) 		-> {ok,dict:erase(Name,Dict)};
handle({find,Name},Dict) 		-> {dict:find(Name,Dict),Dict}.