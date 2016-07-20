defmodule ListsAndRecursionTest do
  use ExUnit.Case, async: true

  import ListsAndRecursion, [:functions]

  test "list construction" do
    assert [1, 2, 3] == [ 1 | [2 | [3 | []]]]
  end


  test "list pattern match" do
    [head | tail] = [1, 2, 3, 4]
    assert head == 1
    assert tail == [2, 3, 4]
  end

  test "len of list" do
  assert 0 == len([])
    assert 3 == len([1, 3, 4])
  end

  test "build square list" do
    assert [4, 9, 16] == squares([2, 3, 4])
  end

  test "map" do
    assert [3, 4, 5] == map([2, 3, 4], &(&1 + 1))
  end

  test "sum" do
    assert 9 == sum([2, 3, 4])
  end

  test "reduce" do
    assert 9 == reduce([2, 3, 4], 0, &(&1 + &2))
  end


  test "swap" do
    assert [1, 2, 3, 4] = swap([2, 1, 4, 3])
  end
end
