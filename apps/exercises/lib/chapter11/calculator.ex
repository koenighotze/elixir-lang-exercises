defmodule Chapter11.Calculator do
  def clean_exp(exp), do: Enum.filter(exp, fn(x) -> x in ~C{0123456789+-/*}  end)

  def calculate(exp), do: exp |> clean_exp |> _calculate(0)

  def _calculate([], value), do: value

  def _calculate([h | t], result) when h in ?0..?9 do
      _calculate(t, result * 10 + h - ?0)
  end

  def _calculate([h | t], result) when h == ?+ do
    result + _calculate(t, 0)
  end

  def _calculate([h | t], result) when h == ?- do
    result - _calculate(t, 0)
  end

  def _calculate([h | t], result) when h == ?* do
    result * _calculate(t, 0)
  end

  def _calculate([h | t], result) when h == ?/ do
    result / _calculate(t, 0)
  end
end
