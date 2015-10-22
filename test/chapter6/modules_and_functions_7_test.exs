defmodule ModulesAnFunctions7 do
  use ExUnit.Case

  import String, only: [split: 2, starts_with?: 2]
  import Enum, only: [map: 2, filter: 2, take: 2]


  test "convert a float to a string" do
    res = :io_lib.format("~.2f", [ 12.235 ] )
    # {:ok, "12.23"}
    IO.puts res
  end

  test "get os env variable" do
    assert String.contains?(System.get_env("PATH"), "/usr/local/")
  end

  test "return extension of a file" do
    assert Path.extname("/ld.so.conf") == ".conf"
  end

  test "return cwd" do
    assert System.cwd() != "" # obviously I cannot test the real path
  end

  test "convert json to elixir and back" do
    {:ok, "{\"result\":\"some text\"}"} = JSON.encode [result: "some text"]

    {:ok, %{ "result" => "some text" } }  = JSON.decode("{\"result\":\"some text\"}")
  end

  test "execute shell command" do
    {res, 0} = System.cmd "find", ["/etc"]

    res
    |> split("\n")
    |> take(10)
    |> filter(&( !starts_with?(&1, ".") ))
    |> map(&( starts_with?(&1, "/etc")))
    |> assert
  end
end
