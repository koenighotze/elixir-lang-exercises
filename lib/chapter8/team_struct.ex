
defmodule TeamStructure do
  defstruct name: "", mascot: "", est: 0, division: "Regionalliga"


  def aufstieg(team = %TeamStructure{division: "1. Bundesliga"}) do
    IO.puts "Deutscher Meister!!!"
    team
  end

  def aufstieg(team = %TeamStructure{division: "2. Bundesliga"}) do
    %{team | division: "1. Bundesliga"}
  end
end
