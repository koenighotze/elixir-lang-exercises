defmodule Chapter5Test do
  use ExUnit.Case


  test "functions-2" do
    fun = fn
      0, 0, _ -> "FizzBuzz"
      0, _, _ -> "Fizz"
      _, 0, _ -> "Buzz"
      _, _, a -> a
    end

    assert fun.(0, 0, 1) == "FizzBuzz"
    assert fun.(0, 1, 1) == "Fizz"
    assert fun.(1, 0, 1) == "Buzz"
    assert fun.(1, 1, 3) == 3
  end


  test "functions-3" do
    fun = fn
      0, 0, _ -> "FizzBuzz"
      0, _, _ -> "Fizz"
      _, 0, _ -> "Buzz"
      _, _, a -> a
    end


    fun2 = fn x -> fun.(rem(x, 3), rem(x, 5), x) end

    assert fun2.(10) == "Buzz"
    assert fun2.(11) == 11
    assert fun2.(12) == "Fizz"
    assert fun2.(13) == 13
    assert fun2.(14) == 14
    assert fun2.(15) == "FizzBuzz"
    assert fun2.(16) == 16
  end

  test "functions-4" do
    prefix = fn astring ->
      fn another ->
        "#{astring} #{another}"
      end
    end


    mrs = prefix.("Mrs")

    assert mrs.("Smith") == "Mrs Smith"

    elixir = prefix.("Elixir")

    assert elixir.("rocks") == "Elixir rocks"
  end


  test "function-5a" do
    res = Enum.map [1, 2, 3, 4], fn x -> x + 2 end

    assert res == Enum.map [1, 2, 3, 4], &(&1 + 2)
  end

  test "function-5b" do
    Enum.map [1, 2, 3, 4], fn x -> IO.inspect x end

    Enum.map [1, 2, 3, 4], &IO.inspect/1
  end

end
