defmodule ListAndRecursion0Test do
  use ExUnit.Case

  def sum([]), do: 0

  def sum([h | t]), do: h + sum(t)

  test "sum without acc" do
    assert 9 == sum([3, 2, 4])
  end

end
