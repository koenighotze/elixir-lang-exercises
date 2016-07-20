defmodule Chapter20.MacroBindingTest do
  use ExUnit.Case, async: true

  import Chapter20.MacroBinding

  test "binding" do
    res = 1..3
    |> Enum.map(&bind(&1 == 1))

    assert res == [ :ok, :nok, :nok]
  end


end
