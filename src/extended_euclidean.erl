-module(extended_euclidean).
%% challenge 13: extended euclidean algorithm
-export([gcd/2]).

gcd(X, Y) -> gcd(1, 0, 0, 1, X, Y).

%% 3, 5
%% 1, 0, 0, 1, 3, 5 -> Q = 0 -> gcd(0, 1, 1, 0, 5, 3) ->
%%					   Q = 1 -> gcd(1, 0, -1, 1, 3, 2) ->
%%					   Q = 1 -> gcd(-1, 1, 0, -1, 2, 1) ->
%%					   Q = 2 -> gcd(0, -1, _, _, 1, 0)
%% {1, 0, -1}
gcd(U0, V0, _, _, X, 0) -> {X, U0, V0};
gcd(U0, V0, U1, V1, X, Y) ->
	Q = X div Y,
	gcd(U1, V1, U0 - Q * U1, V0 - Q * V1, Y, X rem Y).
