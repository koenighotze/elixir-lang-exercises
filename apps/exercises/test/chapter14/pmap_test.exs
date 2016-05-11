defmodule Chapter14.PmapTest do
  use ExUnit.Case

  import Chapter14.Pmap

  test "simple" do
    res = 1..100
          |> Enum.to_list
          |> pmap(&( &1 + 5))

    expected = 6..105 |> Enum.to_list
    assert expected == res
  end
end
