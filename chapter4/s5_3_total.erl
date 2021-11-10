-module(s5_3_total).
-export([total/1]).

total(L)	->
	s5_1_sum:sum(s5_2_map:map(fun({What,N})->s3_1_shop:cost(What)*N end,L)).
