defmodule Chapter10.ListAndRecursion7Test do
  use ExUnit.Case, async: true

  import ListsAndRecursion, [ 'myspan' ]
  import Chapter10.ListAndRecursion7, [ 'sieve']

  doctest Chapter10.ListAndRecursion7

  test "span" do
    res = myspan(4, 10)

    assert [4, 5, 6, 7, 8, 9, 10] == res
  end

  test "sieve of Eratosthenes" do
    res = sieve(10)
    assert [2, 3, 5, 7] == res
  end

end
