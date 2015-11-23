defmodule Chapter10.ListAndRecursion7 do
  use ExUnit.Case

  import Chapter10.ListAndRecursion7, [:functions]

  test "span for primes" do
    res = span(10)

    assert res = [1, 2, 3, 5, 7]
  end

end
