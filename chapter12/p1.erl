-module(p1).
-export([start/2]).

start(AnAtom,Fun) ->
	register(AnAtom,spawn(fun()->Fun() end)).

