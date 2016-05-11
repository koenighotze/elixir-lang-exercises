defmodule Chapter15.CircularListTest do
  use ExUnit.Case
  import Chapter15.CircularList

  test "an empty list return no next elem" do
    assert nil == next([])
  end

  test "next" do
    list = 1..3 |> Enum.to_list

    assert 1 == next(list)
  end

  test "circle empty" do
    assert {nil, []} = circle([])
  end

  test "circle" do
    list = 1..3 |> Enum.to_list

    assert {1, [2, 3, 1]} = circle(list)
  end
end
