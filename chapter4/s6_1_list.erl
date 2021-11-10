-module(s6_1_list).
-export([test/1]).

%% 列表推导
test(L)	->
	[X*2||X<-L].
