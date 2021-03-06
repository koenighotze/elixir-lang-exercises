defmodule Chapter14.WorkingWithProcesses9Test do
  use ExUnit.Case, async: true
  import Chapter14.WorkingWithProcesses9
  import Logger

  test "drive" do
    results = run("/etc/", "the")

    results
    |> Enum.each( fn {file, matches} -> debug("File: #{file} Matches: #{matches} ") end  )

    sum_of_matches = results
      |> Enum.map( fn {_, matches }  -> matches end )
      |> Enum.reduce(0, fn x, acc -> x + acc end)

    debug("Number of overall matches: #{sum_of_matches}")
  end

  test "grep returns number of matches" do
    num = grep("foo bb foo \n \t bar foo f oo", "foo")

    assert num == 3
  end

  test "grep returns 0 if no match" do
    num = grep("foo bb foo \n \t bar foo f oo", "qux")

    assert num == 0
  end
end
