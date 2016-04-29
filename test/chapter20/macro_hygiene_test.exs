defmodule Chapter20.MacroHygieneTest do
  use ExUnit.Case

  import Chapter20.MacroHygiene

  test "hygiene" do
    local = "foo"
    res = hygiene
    assert res == :ok
    assert local == "foo"
  end
end
