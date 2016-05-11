defmodule Chapter12.ControlFlow1 do
  def fizz_buzz(z) when z > 0 do
    case z do
      z when rem(z, 3) == 0 and rem(z, 5) == 0 -> "fizzbuzz"
      z when rem(z, 3) == 0 -> "fizz"
      z when rem(z, 5) == 0 -> "buzz"
      z -> z
    end
  end

  def up_to(n) do
    1..n
    |> Enum.map(&fizz_buzz/1)
  end

end
