defmodule MyTimes do
  def double(n) do
    n * 2
  end

  def trice(n), do: n * 3

  def quadruple(n), do: (
    n * 4
  )

  def quadruple(n) do
    double(double(n))
  end
end
