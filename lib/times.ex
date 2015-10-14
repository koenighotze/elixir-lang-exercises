defmodule Times do
  def double(n) do
    n * 2
  end

  def trice(n), do: n * 3

  def quadruple(n), do: (
    IO.puts "#{n} times 4"
    n * 4
  )
end
