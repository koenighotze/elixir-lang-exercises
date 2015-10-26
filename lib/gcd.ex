defmodule Gcd do

  def of(x, 0) do
    x
  end

  def of(x, y) do
    y
    |> of(rem(x, y))
  end
end
