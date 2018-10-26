-module(karatsuba_multiplication).
%% challenge 10: karatsuba multiplication
-export([karatsuba/2]).

%% TODO: revisit and refactor??

karatsuba(A, B) when is_integer(A), is_integer(B) ->
	lists:reverse(karatsuba(lists:reverse(integer_to_list(A)), lists:reverse(integer_to_list(B))));
karatsuba([A], [B]) -> lists:reverse(integer_to_list((A -  48)* (B - 48)));
karatsuba(A, B) ->
	case lists:flatlength(A) == lists:flatlength(B) of
		true -> calculate(A, B);
		false -> ensure_same_length(A, B)
	end.

ensure_same_length(A, B) ->
	case lists:flatlength(A) < lists:flatlength(B) of
		true -> karatsuba(A ++ [$0], B);
		false -> karatsuba(A, B ++ [$0])
	end.

%% (A + B)(C + D) - AC - BD
calculate(A, B) ->
	L = lists:flatlength(A),
	{A1, A2} = lists:split(L div 2, A),
	{B1, B2} = lists:split(L div 2, B),
	Z1 = karatsuba(A1, B1), %% AC
	Z2 = karatsuba(A2, B2), %% BD
	Z3 = karatsuba(add(A1, A2), add(B1, B2)), %% (A + B)(C + D)
	Z = lists:reverse(integer_to_list(
		list_to_integer(lists:reverse(Z3)) -
		list_to_integer(lists:reverse(Z2)) -
		list_to_integer(lists:reverse(Z1)))),
	add(
		add(Z1, lists:duplicate(L div 2 * 2, $0) ++ Z2),
		lists:duplicate(L div 2, $0) ++ Z
	).

add(A, B) ->
	io:format("add A: ~p, B: ~p~n", [A, B]),
	lists:reverse(integer_to_list(list_to_integer(lists:reverse(A)) + list_to_integer(lists:reverse(B)))).
