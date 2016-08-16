defmodule Chapter19.Fib do
  def of(0), do: 0
  def of(1), do: 1
  def of(n), do: of(n - 1) + of (n - 2)



end
