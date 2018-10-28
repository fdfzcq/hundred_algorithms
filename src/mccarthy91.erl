-module(mccarthy91).
%% challenge 11: mccarthy 91
-export([mccarthy91/1]).

mccarthy91(N) when N > 100 -> N - 10;
mccarthy91(N) -> mccarthy91(mccarthy91(N + 11)).
