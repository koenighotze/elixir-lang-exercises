defmodule Chapter12.ControlFlow1Test do
  use ExUnit.Case, async: true

  import Chapter12.ControlFlow1, [:functions]

  doctest Chapter12.ControlFlow1


  test "1" do
    assert fizz_buzz(1) == 1
  end

  test "3" do
    assert fizz_buzz(3) == "fizz"
  end

  test "4" do
    assert fizz_buzz(4) == 4
  end

  test "5" do
    assert fizz_buzz(5) == "buzz"
  end

  test "15" do
    assert fizz_buzz(15) == "fizzbuzz"
  end

  test "up_to(1)" do
    assert up_to(1) == [1]
  end

  test "up_to(3)" do
    assert up_to(3) == [1, 2, "fizz"]
  end

  test "up_to(5)" do
    assert up_to(5) == [1, 2, "fizz", 4, "buzz"]
  end

  test "up_to(15)" do
    assert up_to(15) == [1, 2, "fizz", 4, "buzz", "fizz", 7, 8, "fizz", "buzz", 11, "fizz", 13, 14, "fizzbuzz"]
  end

end
