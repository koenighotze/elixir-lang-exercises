defmodule Chapter23.MoreCoolStuff1 do
  import String, only: [split: 3, split: 2]
  import Enum, only: [map: 2]

  def sigil_v(lines, _opt) do
    lines
    |> split("\n", trim: true)
    |> map( fn line -> split(line, ",") end )
  end
end
