defmodule Chapter12.FizzBuzzCond do
  def fizz_buzz(n) when n < 1, do: raise("n must be greater than 0")

  def fizz_buzz(n) do
    cond do
      rem(n, 3) == 0 and rem(n, 5) == 0 ->
        "fizzbuzz"
      rem(n, 3) == 0 ->
        "fizz"
      rem(n, 5) == 0 ->
        "buzz"
      true ->
        n
    end
  end

  def up_to(n) when n > 0 do
    # _up_to(1, n, [])
    #_down_to(n, [])

    1..n
    |> Enum.map(&fizz_buzz/1)
  end

  def _down_to(0, agg), do: agg

  def _down_to(n, agg) do
    _down_to(n - 1, [fizz_buzz(n) | agg])
  end

  def _up_to(n, to, agg) when n == to do
    [fizz_buzz(n) | agg]
    |> Enum.reverse
  end

  def _up_to(n, to, agg) do
    ans = fizz_buzz(n)

    _up_to(n + 1, to, [ans | agg])
  end


end
