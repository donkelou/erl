-module(s4_1_time_out).
-export([sleep/1]).

sleep(T) ->
	receive
	after T ->
		true
	end.
