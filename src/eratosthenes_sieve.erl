-module(eratosthenes_sieve).
%% Challenge 05: Eratosthenes sieve
-export([all/1]).

all(N) -> all(N, [], [], 2).

all(N, _Filtered, Res, Prime) when Prime > N -> lists:reverse(Res);
all(N, Filtered, Res, Prime) ->
  NewFiltered = filter(Prime, 2, N, Filtered),
  NextPrime = next(Prime + 1, Filtered),
  all(N, NewFiltered, [Prime|Res], NextPrime).

filter(Prime, I, N, Filtered) ->
  case Prime*I > N of
    true -> Filtered;
    false -> filter(Prime, I + 1, N, [Prime*I|Filtered])
  end.

next(Prime, Filtered) ->
  case lists:member(Prime, Filtered) of
    true -> next(Prime + 1, Filtered);
    false -> Prime
  end.
