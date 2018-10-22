-module(binary_search).
%% challenge 08: binary search
-export([search/2]).

%% lists:nth/2 in erlang has time complexity of O(N),
%% this can be theoretically improved by using maps,
%% note that erlang maps are not hashmaps therefore
%% the time complexity still won't be as optimised as O(1)
%% maps:get has complexity of O(N) when number of items is < 32
%% and when it's over 32 items, it is structured into a trie,
%% making get/2 complexity down to O(logN)
search(Data, Item) when is_list(Data) -> search(to_map(Data, 0, []), Item);
search(Data, Item) -> search(Data, Item, 0, maps:size(Data) - 1).

search(Data, Item, Start, End) when Start =:= End ->
  case maps:get(Start, Data) == Item of
    true -> Start;
    false -> -1
  end;
search(Data, Item, Start, End) when Start > End -> -1;
search(Data, Item, Start, End) ->
  Index = (Start + End) div 2,
  case maps:get(Index, Data) == Item of
    true -> Index;
    false ->
      case maps:get(Index, Data) > Item of
        true -> search(Data, Item, Index + 1, End);
        false -> search(Data, Item, Start, Index - 1)
      end
  end.

to_map([], _, List) -> maps:from_list(List);
to_map([H|T], Key, List) -> to_map(T, Key + 1, [{Key, H}|List]).
