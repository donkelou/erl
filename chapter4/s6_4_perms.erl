-module(s6_4_perms).
-export([perms/1]).

%% 回文构词
perms([])	->	[[]];
perms(L)	->	[[H|T] || H<-L,T<-perms(L -- [H])].
