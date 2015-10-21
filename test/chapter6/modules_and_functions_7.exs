defmodule ModulesAnFunctions7 do
  use ExUnit.Case

  test "convert a float to a string" do
    assert :io.format("~.2f", [ 12.235 ] ) == "12.23"
  end

  test "get os env variable" do
    assert String.contains?(System.get_env("PATH"), "/usr/local/")
  end

  test "return extension of a file" do
    assert false
  end

  test "return cwd" do
    assert false
  end

  test "convert json to elixir" do
    assert false
  end

  test "execute shell command" do
    assert false
  end
end
