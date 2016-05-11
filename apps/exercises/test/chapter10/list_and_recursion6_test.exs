defmodule ListAndRecursion6Test do
  use ExUnit.Case

  import Chapter10.ListAndRecursion6, [:functions]

  doctest Chapter10.ListAndRecursion6

  test "flatten empty list" do
    assert [] == flatten([])
  end

  test "simple case" do
    assert [1, 2, 3] == flatten([ [1], 2, 3 ])
  end

  test "flatten nested empty lists" do
    assert [] == flatten([ [], [[[[[]]], []]]])
  end

  test "flatten non empty list" do
    assert [1, 2, 3, 4, 5, 6] == flatten([1, [2, 3, [4]], 5, [[[6]]]])
  end
end
