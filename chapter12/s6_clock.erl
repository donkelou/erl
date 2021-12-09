-module(s6_clock).
-export([start/2,stop/0]).

%% 使用注册进程实现定时器

start(Time,Fun) ->
	register(clock,spawn(fun()-> tick(Time,Fun) end)).

stop() -> clock ! stop.
%% 时钟函数，不停的滴答作响，直到停止它
tick(Time,Fun) ->
	receive
		stop ->
			void
	after Time ->
		Fun(),
		tick(Time,Fun)
	end.
