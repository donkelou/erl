-module(s10_1_accumulator).
-export([odds_and_evens2/1]).

%% 归集器
odds_and_evens2(L)	->
	odds_and_evens_acc(L,[],[]).

odds_and_evens_acc([H|T],Odds,Evens)	->
	case (H rem 2) of
		1 -> odds_and_evens_acc(T,[H|Odds],Evens);
		0 -> odds_and_evens_acc(T,Odds,[H|Evens])
	end;

odds_and_evens_acc([],Odds,Evens)	->
	[Odds,Evens].
		
