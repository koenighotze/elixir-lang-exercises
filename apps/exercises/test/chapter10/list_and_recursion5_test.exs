defmodule ListAndRecursion5Test do
  use ExUnit.Case, async: true

  import Chapter10.ListAndRecursion5, [:functions]
  import Logger

  test "reimplementing all" do
    assert all?([1, 2, 3, 4 ,5], &( &1 > 3 )) == false
    assert all?([1, 2, 3, 4 ,5], &( &1 < 6 )) == true
  end


  test "reimplementing each" do
    res = each [1, 2, 3, 4 ,5], &( debug &1 )

    assert :ok = res
  end


  test "reimplementing filter" do
    fun = &( rem(&1, 2) == 0 )

    assert filter([], fun) == []

    res = [1, 2, 3, 4 ,5]
          |> filter(fun)

    assert [2, 4] == res
  end

  test "reimplementing split" do
    res = [1, 2, 3, 4 ,5]
          |> split(3)
    assert { [1, 2, 3], [4, 5] } == res
  end

  test "reimplementing take" do
    assert take([1, 2, 3], 0) == []


    res = [1, 2, 3, 4 ,5]
          |> take(2)
    assert [1, 2] == res
  end
end
