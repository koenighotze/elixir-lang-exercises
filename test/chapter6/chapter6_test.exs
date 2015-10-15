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

end
