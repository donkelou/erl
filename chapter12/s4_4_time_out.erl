-module(s4_4_time_out).
-export([start/2,cancel/1]).

% start(Time,Fun) ->spawn(s4_4_time_out,timer,[Time,Fun]).
start(Time,Fun) -> spawn(fun() -> timer(Time,Fun) end).
cancel(Pid) -> Pid ! cancel.

timer(Time,Fun) ->
	receive
		cancel ->
			void
	after Time ->
		Fun()
	end.
