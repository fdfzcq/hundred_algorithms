-module(no_condition_swap).
%% challenge 16: no condition swap
-export([swap/2]).

swap(X, Y) -> swap(X, Y, 0).

%% X < Y
swap(0, Y, N) -> {N, Y + N};
%% X > Y
swap(X, 0, N) -> {N, X + N};
swap(X, Y, N) -> swap(X - 1, Y - 1, N + 1).
