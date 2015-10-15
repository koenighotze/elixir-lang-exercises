defmodule Chapter6Test do
  use ExUnit.Case

  # i can define modules within modules...
  # defmodule Times do
  #   def tripple(n), do: ( n * 3 )
  # end

  test "modules_and_functions-1" do
    assert Times.trice(3) == 9
  end

  test "modules_and_functions-2" do
    # nothing to do ...
  end

  test "modules_and_functions-3" do
    assert Times.quadruple(4) == 16
  end

  test "modules_and_function-4" do
    assert Sum.of(5) == 5 + 4 + 3 + 2 + 1
  end


  test "modules_and_function-5" do
    assert Gcd.of(12, 4) == 4

    assert Gcd.of(1, 1) == 1

    assert Gcd.of(5, 20) == 5

    assert Gcd.of(12, 42) == 6
  end

end
