-module(huffman_codes).
%% challenge 14: huffman codes
-export([encode/1]).

encode(Msg) ->
  Frequency = get_freq(lists:sort(Msg), []),
  Sorted = sort(Frequency),
  [Tree] = to_tree(Sorted),
  prt(Tree, []).

get_freq([], List) -> List;
get_freq([H|T], [{F, H}|T2]) -> get_freq(T, [{F + 1, H}|T2]);
get_freq([H|T], List) -> get_freq(T, [{1, H}|List]).

to_tree([{F1, C1}, {F2, C2}|T]) ->
  NewTree = [{F1 + F2, {{F1, C1}, {F2, C2}}}|T],
  to_tree(sort(NewTree));
to_tree(Tree) -> Tree.

sort(FreqList) ->
  Fun = fun({F, C1}, {F, C2}) when is_number(C1), is_number(C2) -> C1 < C2;
  		   ({F1, _}, {F2, _}) -> F1 < F2 end,
  lists:sort(Fun, FreqList).

prt({_, {Left, Right}}, Index) ->
  prt(Left, [$0|Index]),
  prt(Right, [$1|Index]);
prt({_, C}, Index) -> io:format("~p ~p~n", [[C], lists:reverse(Index)]).
