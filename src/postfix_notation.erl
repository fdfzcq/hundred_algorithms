-module(postfix_notation).
%% challenge 06: postfix notation

-export([postfix/1]).

postfix(Expressions) -> postfix(Expressions, []).

postfix([], [N]) -> N;
postfix([H|T], Numbers) ->
  case is_integer(H) of
    true -> postfix(T, [H|Numbers]);
    false -> NewNumbers = calculate(H, Numbers),
             io:format("notation: ~p, Numbers: ~p~n",[H, Numbers]),
             postfix(T, NewNumbers)
  end.

calculate(Notation, List = [A, B|T]) when is_list(List) -> [calculate(Notation, A, B)|T].

calculate('+', A, B) -> B + A;
calculate('-', A, B) -> B - A;
calculate('*', A, B) -> B * A;
calculate('/', A, B) -> B / A.
