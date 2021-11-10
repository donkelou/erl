-module(s8_1_case).

-export([filter/2]).

%% 使用case表达式实现filter函数
filter(F,[H|T])	->
	case F(H) of
		true	->	[H|filter(F,T)];
		false	->	filter(F,T)
	end;
filter(_,[])	->	[].
