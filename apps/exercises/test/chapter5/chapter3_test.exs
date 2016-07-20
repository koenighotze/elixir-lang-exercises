defmodule Chapter3Test do
  use ExUnit.Case, async: true

  test "list concat concats two lists" do
    list_concat = fn a, b -> a ++ b end

    assert list_concat.([:a, :b], [:c, :d]) == [:a, :b, :c, :d]
  end

  test "a pair tuple is returned as a list" do
    pair_tuple_to_list = fn {t1, t2} -> [t1, t2] end

    assert pair_tuple_to_list.({:a, :b}) == [:a, :b]
  end

  test "sum adds all passed args" do
    sum = fn a, b, c -> a + b + c end

    assert sum.(1, 2, 3) == 6
  end
end
