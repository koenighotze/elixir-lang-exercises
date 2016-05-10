defmodule Chapter22.Bitmap do
  use Bitwise

  defstruct value: 0

  @behaviour Access

  def fetch(%Chapter22.Bitmap{value: x}, which_bit) do
    res = if (x &&& (1 <<< which_bit)) == 0 do
      0
    else
      1
    end
    {:ok, res}
  end

  def get_and_update(container, _key, _fun) do
    container
  end

  defimpl Enumerable do
    def count(%Chapter22.Bitmap{value: x}) do
      # is the exponent of the smallest power of two greater than your number
      {:ok, trunc(:math.log(x) / :math.log(2)) +1}
    end

    def member?(col, x) do
      {:ok, 1 == col[x]}
    end

    def reduce({bitmap, -1}, {:cont, acc}, _fun) do
      {:done, acc}
    end

    def reduce({bitmap, bitnumber}, {:cont, acc}, fun) do
      reduce({bitmap, bitnumber - 1}, fun.(bitmap[bitnumber], acc), fun)
    end

    def reduce(bitmap, {:cont, acc}, fun) do
      reduce({bitmap, Enum.count(bitmap)}, {:cont, acc}, fun)
    end
  end

  defimpl String.Chars do
    def to_string(bitmap) do
      bitmap
      |> Enum.join
    end
  end

end
