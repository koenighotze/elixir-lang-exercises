defmodule Chapter20.MacroTest do
  use ExUnit.Case

  import Chapter20.Macro

  test "simple macro" do
    res = macro(if "foo" == "bar", do: raise("strange"), else: 2)

    assert res == 2
  end

  test "unquote tryout" do
    a = 4
    b = 1

    assert unquote_tryout(a - b)
  end

end
