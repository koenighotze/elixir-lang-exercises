defmodule FactorialTest do
  use ExUnit.Case, async: true

  test "factorial of 0" do
    assert Factorial.factorial(0) == 1
  end

  test "factorial of 5" do
    assert Factorial.factorial(5) == 5 * 4 * 3 * 2 * 1
  end
end
