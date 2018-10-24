-module(monte_carlo).
%% challenge 09: monte carlo
-export([pi/1]).

pi(N) -> calc(trunc(math:pow(10, N + 3)) div 1000, 0, 0).

calc(0, Pos, Sum) -> (Pos/Sum) * 4;
calc(P, Pos, Sum) ->
  X = rand:uniform(1000)/1000,
  Y = rand:uniform(1000)/1000,
  A = math:pow(X, 2) + math:pow(Y, 2),
  case A =< 1 of
    true -> calc(P - 1, Pos + 1, Sum + 1);
    false -> calc(P - 1, Pos, Sum + 1)
  end.
