defmodule Factorial do

  def factorial(0) do
    1
  end

  def factorial(n) when n > 0 do
    n * factorial(n - 1)
  end
end
