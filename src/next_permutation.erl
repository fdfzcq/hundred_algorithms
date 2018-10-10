-module(next_permutation).
%%challenge 03: next permutation

-export([next/1]).

next([]) -> nil;
next([N]) -> [N];
next(List) -> next(List, lists:reverse(List)).

next(List, [H|T]) -> next(List, T, H).

next(List, [], _Last) -> lists:sort(List);
next(List, [H|T], Last) when Last < H -> next(List, T, H);
next(List, [H|_], _Last) -> replace(List, H, []).

replace([Pivot|T], Pivot, Res) -> replace2(T, Res, Pivot);
replace([H|T], Pivot, Res) -> replace(T, Pivot, [H|Res]).

% replace2([N], Res, Pivot) -> lists:reverse([Pivot|Res]);
% replace2([H|T], Res, Pivot) -> replace2(T, [H|Res], Pivot).
replace2([H|T], Res, Pivot) when Pivot < H -> replace2(lists:sort(fun(A, B) -> A < B end, [Pivot|T]), [H|Res]);
replace2([H|T], Res, Pivot) -> replace2(T, [H|Res], Pivot).

replace2([], Res) -> lists:reverse(Res);
replace2([H|T], Res) -> replace2(T, [H|Res]).
