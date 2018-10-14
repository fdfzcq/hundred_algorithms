-module(counting_one_bits).
%% challenge 04: counting 1 bits
-export([count/1]).

count(Value) -> count(Value, 0).

count(1, N) -> N + 1;
count(0, N) -> N;
count(Value, N) -> count(Value, Value rem 2, N).

count(Value, 0, N) -> count(Value div 2, N);
count(Value, 1, N) -> count(Value div 2, N + 1).
