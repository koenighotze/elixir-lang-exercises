defmodule Chapter20.CodeEvalTest do
  use ExUnit.Case, async: true

  test "hygienic eval" do
    a = 7

    frag = quote do
      a = 3
      a + 3
    end

    {res, _} = Code.eval_quoted frag
    assert res == 6
    assert a == 7
  end

  test "bind var for outside access" do
    a = 7

    frag = quote do
      var!(a) = 3
      var!(a) + 3
    end

    {res, _} = Code.eval_quoted frag, [a: a]

    assert res == 6
    assert a == 7
  end
end
