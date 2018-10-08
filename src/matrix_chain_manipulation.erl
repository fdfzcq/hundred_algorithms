-module(matrix_chain_manipulation).
%%challenge 02: matrix chain manipulation
-export([mcm/1]).

mcm([]) -> 0;
mcm([N]) -> N;
mcm(List) -> mcm(List, lists:flatlength(List), #{}, 2).


mcm(_List, N, Map, N) -> maps:get({1, N-1}, Map, 0);
mcm(List, N, Map, L) ->
  Map2 = mcm(List, N, Map, L, L),
  mcm(List, N, Map2, L + 1).

mcm(_List, N, Map, _L, N) -> Map;
mcm(List, N, Map, L, J) ->
  Map2 = mcm(List, N, Map, L, J, J + 1 - L),
  mcm(List, N, Map2, L, J + 1).

mcm(_List, _N, Map, _L, J, J) -> Map;
mcm(List, N, Map, L, J, K) ->
  I = J + 1 - L,
  V = maps:get({I, K}, Map, 0) + maps:get({K + 1, J}, Map, 0) +
    lists:nth(I, List) * lists:nth(K + 1, List) * lists:nth(J + 1, List),
  R = case maps:get({I, J}, Map, nil) of
    nil -> V;
    M -> M
  end,
  Map2 = case R > V of
    true -> maps:put({I, J}, V, Map);
    false -> maps:put({I, J}, R, Map)
  end,
  io:format("L: ~p J: ~p K: ~p I: ~p V: ~p Map: ~p~n", [L, J, K, I, V, Map2]), % 2 2 1 1
  mcm(List, N, Map2, L, J, K + 1).
