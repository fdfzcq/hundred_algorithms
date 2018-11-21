-module(perceptron).
%% challenge 17: perceptron
-export([train/3]).

train([], [], W) -> W;
train(X, Y, W) ->
  [Hx|Tx] = X,
  [Hy|Ty] = Y,
  H = perceptron(Hx, W),
  case H of
    Hy -> train(Tx, Ty, update_weight(Hy, Hx, W));
    _ -> train(Tx, Ty, W)
  end.

update_weight(1, Hx, Wx) -> lists:zipwith(fun(X, Y) -> X+Y end, Hx, Wx);
update_weight(_, Hx, Wx) -> lists:zipwith(fun(X, Y) -> Y-X end, Hx, Wx).

perceptron(X, W) -> perceptron(matrix_multiply(X, W, 0)).

perceptron(R) when R >= 0 -> 1;
perceptron(_) -> 0.

matrix_multiply([], [], R) -> R;
matrix_multiply([Hx|Tx], [Hw|Tw], R) -> matrix_multiply(Tx, Tw, R + Hx * Hw).
