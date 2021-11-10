-module(s6_2_total).
-export([total/1]).

total(L)	->
	s5_1_sum:sum([s3_1_shop:cost(What)*N||{What,N}<-L]).
