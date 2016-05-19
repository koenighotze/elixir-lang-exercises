defmodule Chapter22.Protocols3Test do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import Chapter22.Protocols3

  test "each" do
    out = capture_io(fn ->
      1..3
      |> each(&( IO.puts(&1) ))
    end)

    assert out == "1\n2\n3\n"
  end

  test "filter" do
    res = 1..10
    |> filter(&( &1 > 5))

    assert [6, 7, 8, 9, 10] == res
  end

  test "map" do
    res = 1..5
    |> map(&( &1 + 5))

    assert [6, 7, 8, 9, 10] == res
  end
end
