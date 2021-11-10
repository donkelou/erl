-module(s3_2_shop).
-export([total/1]).

total([{What,N}|T])	->	s3_1_shop:cost(What) * N + total(T);
total([])		->	0.
