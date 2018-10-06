-module(hanoi_tower).
%% challenge 01: hanoi tower
-export([hanoi/1]).

hanoi(InitNumber) -> move(InitNumber, left, mid, right).

move(1, From, _Aux, Dest) -> io:format("Moving one disk from ~p to ~p~n", [From, Dest]);
move(InitNumber, From, Aux, Dest) ->
  move(InitNumber - 1, From, Dest, Aux),
  move(1, From, Aux, Dest),
  move(InitNumber - 1, Aux, From, Dest).
