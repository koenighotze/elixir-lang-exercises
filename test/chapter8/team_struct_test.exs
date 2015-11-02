defmodule TeamStructTest do
  use ExUnit.Case


  alias Chapter8.TeamStructure

  test "creating a team" do
    teamA = %TeamStructure{}
    assert teamA == %TeamStructure{name: "", mascot: "", est: 0, division: "Regionalliga"}

    teamB = %TeamStructure{name: "Fortuna 1895", est: 1895, division: "2. Bundesliga"}
    assert teamB == %TeamStructure{name: "Fortuna 1895", mascot: "", est: 1895, division: "2. Bundesliga"}
  end

end
