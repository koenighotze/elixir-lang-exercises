defmodule Chapter22.Bitmap do
  use Bitwise

  defstruct value: 0

  @behaviour Access

  @lint {Credo.Check.Readability.ParenthesesInCondition, false}
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

  def get(container, _key, _value) do
    container
  end

  def pop(container, _key) do
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

    def reduce({_bitmap, -1}, {:cont, acc}, _fun) do
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

  defimpl Inspect do
    def inspect(%Chapter22.Bitmap{value: x}, _opts) do
      "Bitmap of #{x} is #{to_bitmap(x)}"
    end

    @lint {Credo.Check.Refactor.PipeChainStart, false}
    defp to_bitmap(value) do
      :io_lib.format("~.2B", [value]) |> to_string
    end
  end
end
