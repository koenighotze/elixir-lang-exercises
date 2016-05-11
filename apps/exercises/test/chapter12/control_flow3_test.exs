defmodule Chapter12.ControlFlow3Test do
  use ExUnit.Case

  import Chapter12.ControlFlow3, [:functions]

  doctest Chapter12.ControlFlow3

  test "ok! on ok" do
    assert [1, 2, 3] == ok!({:ok, [1, 2, 3]})
  end

  test "ok! on error" do
    try do
      ok! ({:error, ["foo"]})
      assert false
    rescue
      e in RuntimeError -> e # todo check details
    end
  end
end
