defmodule ListAndRecursion6Test do
  use ExUnit.Case

  import Chapter10.Streams, [:functions]
  import Stream, [:functions]

  test "read /etc/hosts" do
    read_file()
  end


  test "composing streams" do
    res = Stream.map 1..5, &( &1 + 3 )

    # IO.inspect(res)

    three = res
            |> Stream.take 3

    # IO.inspect(three)

    final = three |> Enum.to_list

    assert final == [ 4, 5, 6 ]
  end

  test "reading word dict" do
    longestA = File.open!("/etc/hosts")
                |> IO.stream(:line)
                |> Enum.max_by &String.length/1

    longestB = File.stream!("/etc/hosts")
                |> Enum.max_by &String.length/1

    assert longestA == longestB
  end

  test "infinite stream" do
    # slow...
    # Enum.map(1..1_000_000, &( &1 +1 )) |> Enum.take(5)

    assert Stream.map(1..1_000_000, &( &1 +1 )) |> Enum.take(5) == [2, 3, 4, 5, 6]
  end


  test "cycle" do
    cycle(~w{foo bar})
    |> zip(1..1_000_000)
    |> map(fn { s, i } -> ~s{ The current value of #{s} would be #{i}  } end)
    |> Enum.take(3)
    |> IO.puts
  end

  test "repeat" do
    repeatedly(fn -> :random.uniform() end )
    |> Enum.take 10
  end

  test "iterate" do
    res = iterate("a", fn prev -> if prev == "a" do "b" else "a" end end)
          |> Enum.take 5
    assert ["a", "b", "a", "b", "a"] == res


    res = iterate("a",
                    fn prev ->
                      if String.last(prev) == "a" do
                        "#{prev}b"
                      else
                        "#{prev}a"
                      end
                    end)
          |> Enum.take 4
    assert [ "a", "ab", "aba", "abab" ] == res
  end
end
