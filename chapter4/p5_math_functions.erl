-module(p5_math_functions).
-export([odd/1,even/1,filter/2,split/1,split_2/1]).

%% 奇数
odd(X)	->
	case X rem 2 of
		0	->	false;
		1	->	true
	end.

%% 偶数
even(X)	->
	case X rem 2 of
		0	->	true;
		1	->	false
	end.

%% filter函数
filter(F,[H|T])->
	case F(H) of
		true	->	[H|filter(F,T)];
		false	->	filter(F,T)
	end;
filter(_,[])->
	[].
	
%% 归集器实现列表一分为二		
split(L)->
	split_acc(L,[],[]).

split_acc([H|T],Odds,Evens)->
	case (H rem 2) of
		1 -> split_acc(T,[H|Odds],Evens);
		0 -> split_acc(T,Odds,[H|Evens])
	end;
split_acc([],Odds,Evens)->
	{Odds,Evens}.

%% 使用filter函数实现列表一分为二
split_2(L)->
	{filter(fun(X)->(X rem 2)=:=1 end,L),
	filter(fun(X)->(X rem 2)=:=0 end,L)}.
