-module(binary_addition_FSA).
%% challenge 07: binary addition finite state automation
-export([add/2]).

add(B1, B2) ->
  case lists:flatlength(B1) > lists:flatlength(B2) of
  	true -> do_add(B1, B2);
  	false -> do_add(B2, B1)
  end.

do_add(B1, B) ->
  L2 = lists:flatlength(B1) - lists:flatlength(B),
  B2 = lists:duplicate(L2, 0) ++ B,
  do_add(lists:reverse(B1), lists:reverse(B2), [], p0c0).

do_add([], [], Res, State) ->
	NewState = get_state(0, 0, State),
	case get_value(NewState) of
	  1 -> [1|Res];
	  0 -> Res
	end;
do_add([H1|T1], [H2|T2], Res, State) ->
  NewState = get_state(H1, H2, State),
  Value = get_value(NewState),
  do_add(T1, T2, [Value|Res], NewState).

get_state(0, 0, State) when State == p0c0; State == p1c0 -> p0c0;
get_state(1, 0, State) when State == p0c0; State == p1c0 -> p1c0;
get_state(0, 1, State) when State == p0c0; State == p1c0 -> p1c0;
get_state(1, 1, State) when State == p0c0; State == p1c0 -> p0c1;
get_state(0, 0, _) -> p1c0;
get_state(1, 0, _) -> p0c1;
get_state(0, 1, _) -> p0c1;
get_state(1, 1, _) -> p1c1.

get_value(p0c0) -> 0;
get_value(p1c0) -> 1;
get_value(p0c1) -> 0;
get_value(p1c1) -> 1.
