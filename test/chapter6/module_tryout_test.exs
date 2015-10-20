defmodule ModuleTryoutTest do
  use ExUnit.Case


  test "atom works" do
    assert is_atom TopLevel.Importer
  end

  test "call via atom syntax" do
   :"Elixir.TopLevel.Importer".useTheImport
  end

  test "Call erlang module" do
     :io.format("Result ~3.1f~n", [7.151517])
  end
end
