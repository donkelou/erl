-module(p2_tuple_to_list).

-export([my_tuple_to_list/1]).

my_tuple_to_list(T)	->
	[element(X,T)||X<-lists:seq(1,tuple_size(T))].
