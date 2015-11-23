defmodule Chapter10.ComprehensionsPlayground do
  use ExUnit.Case

  test "generate squares" do
    res = for x <- 1..5, do: x * x
    assert [1, 4, 9, 16, 25] == res
  end

  test "generate square of odd numbers" do
    res = for x <- 1..5, rem(x, 2) != 0, do: x * x

    assert [1, 9, 25] == res
  end

  test "list products of numbers from 1..8 that is at least 10" do
    res = for x <- 1..5, y <- 1..5, x * y >= 10, do: {x, y}

    assert [ {2, 5}, {3, 4}, {3, 5}, {4, 3}, {4, 4}, {4, 5}, {5, 2},  {5, 3}, {5, 4}, {5, 5} ] == res
  end

  test "generate binary" do
    res = for << ch <- "hello" >>, do: <<ch>>
    assert ["h", "e", "l", "l", "o"] == res
  end

  test "comprehension has own local scope" do
    orig = "foo"

    for orig <- ["bar", "baz"], do: String.length(orig)

    assert orig == "foo"
  end

  test "create a map" do
    res = for v <- ["qux", "bazbaz"], into: %{}, do: {v, String.length(v)}
    assert res == %{ "qux" => 3, "bazbaz" => 6  }
  end
end
