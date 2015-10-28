defmodule MySumTest do
  use ExUnit.Case

  import Chapter8.Sum, [:functions]
  import Enum, only: [into: 2]

  test "sum a hashdict" do
    res = [one: 1, two: 2, three: 3]
    |> into HashDict.new

  end

end
