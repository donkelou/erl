-module(s4_1_for).
-export([for/2]).
-export([for/3]).

for(Max,Max) -> [Max];
for(I,Max) -> [I|for(I+1,Max)].

for(Max,Max,F) -> [F(Max)];
for(I,Max,F) -> [F(I)|for(I+1,Max,F)].
