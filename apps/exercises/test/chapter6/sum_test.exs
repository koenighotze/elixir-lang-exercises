defmodule SumTest do
  use ExUnit.Case, async: true

  test "sum of empty list is 0" do
    assert Sum.of([]) == 0
  end


  test "sum of non empty list" do
    assert Sum.of([3, 4, 5]) == 12
  end
end
