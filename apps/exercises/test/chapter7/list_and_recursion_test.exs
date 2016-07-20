defmodule ListAndRecursion0Test do
  use ExUnit.Case, async: true

  import ListsAndRecursion, [:functions]

  def mysum([]), do: 0

  def mysum([h | t]), do: h + sum(t)

  test "sum without acc" do
    assert 9 == mysum([3, 2, 4])
  end

  test "ListAndRecursion-1 Empty" do
    assert mapsum([], &(&1 * &1)) == 0
  end

  test "ListAndRecursion-1" do
    assert mapsum([1, 2, 3], &(&1 * &1)) == 14
  end

  test "ListAndRecursion-2" do
    assert mymax([6, 5, 4, 7, 13, 10, 4, 12]) == 13
  end

  test "ListAndRecursion-3" do
    assert caesar('abcd', 3) == 'defg'
  end


  test "ListAndRecursion-4" do
    assert myspan(3, 3) == [3]

    assert myspan(3, 10) == [3, 4, 5, 6, 7, 8, 9, 10]
  end
end
