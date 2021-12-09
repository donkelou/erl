-module(s4_2_time_out).
-export([flush_buffer/0]).

flush_buffer() ->
	receive
		_Any ->
			flush_buffer()
	after 0 ->
		true
	end.
