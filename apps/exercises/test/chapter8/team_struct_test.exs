defmodule TeamStructTest do
  use ExUnit.Case, async: true


  test "creating a team" do
    teamA = %TeamStructure{}
    assert teamA == %TeamStructure{name: "", mascot: "", est: 0, division: "Regionalliga"}

    teamB = %TeamStructure{name: "Fortuna 1895", est: 1895, division: "2. Bundesliga"}
    assert teamB == %TeamStructure{name: "Fortuna 1895", mascot: "", est: 1895, division: "2. Bundesliga"}
  end

  test "field access" do
    teamB = %TeamStructure{name: "Fortuna 1895", est: 1895, division: "2. Bundesliga"}

    assert "Fortuna 1895" == teamB.name

    %{est: est} =  teamB

    assert 1895 == est
  end

  test "updates" do
    teamB = %TeamStructure{name: "Fortuna 1895", est: 1895, division: "2. Bundesliga"}

    teamB = %TeamStructure{teamB | division: "1. Bundesliga"}

    assert teamB.division == "1. Bundesliga"
  end


  test "methods" do
    teamB = %TeamStructure{name: "Fortuna 1895", est: 1895, division: "2. Bundesliga"}

    res = teamB
          |> TeamStructure.aufstieg

    assert res.name == teamB.name and res.division == "1. Bundesliga"
  end

end
