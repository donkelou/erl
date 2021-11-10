-module(s4_1_error).

-export([sqrt/1]).

%% 参数开方前，先判断是否小于0
sqrt(X) when X < 0 ->
	error({squareRootNegativeArgument,X});

sqrt(X) ->
	math:sqrt(X).
