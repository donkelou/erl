-module(s5_1_sum).
-export([sum/1]).


sum([H|T])	->	H + sum(T);
sum([])		->	0.
