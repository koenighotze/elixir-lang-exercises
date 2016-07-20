defmodule MySumTest do
  use ExUnit.Case, async: true

  import Chapter8.Sum, [:functions]
  import Enum, only: [into: 2]

  test "sum a hashdict - single line" do
    # note the higher precendence of |>
    res = [one: 1, two: 2, three: 3] |> into(HashDict.new) |> sum_of_values

    assert res == 6
  end


  test "sum a hashdict" do
    data = [one: 1, two: 2, three: 3] |> into(HashDict.new)

    res = data |> sum_of_values

    assert res == 6
  end

  test "playfield" do
    kwords = [name: "Bratislav", team: "Fortuna 95", from: "Duesseldorf"]

    assert kwords[:name] == "Bratislav"

    assert Dict.drop(kwords, [:name]) == [team: "Fortuna 95", from: "Duesseldorf"]

    map = %{ name: "Bratislav", favorite_dish: "Stadion Wurst" }

    assert Dict.merge(map, kwords) == %{name: "Bratislav", team: "Fortuna 95", from: "Duesseldorf", favorite_dish: "Stadion Wurst"}
    assert Dict.merge(kwords, map) == [name: "Bratislav", team: "Fortuna 95", from: "Duesseldorf", favorite_dish: "Stadion Wurst"]

    assert "Fortuna 95" == Dict.get kwords, :team
  end



end
