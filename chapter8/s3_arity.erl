-module(s3_arity).

-export([sum/1]).

sum(L) -> sum(L,0).

sum([],N) -> N.
sum([H|T],N) -> sum(T,H+N).
