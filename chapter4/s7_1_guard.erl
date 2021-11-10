-module(s7_1_guard).
-export([max/2]).

%% 关卡
max(X,Y)	when X > Y -> X;
max(_,Y)	-> Y.
