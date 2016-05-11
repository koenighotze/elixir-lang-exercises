defmodule Chapter20.SimpleMacroTest do
  use ExUnit.Case

  test "simple if" do
    foo = if 4 / 2 == 2 do
      "yes"
    else
      "no"
    end

    assert foo == "yes"
  end

  test "blocks are keyword lists" do
    foo = if(4 / 2 == 2, [ do: "yes", else: "no" ])
    assert foo == "yes"
  end


end
