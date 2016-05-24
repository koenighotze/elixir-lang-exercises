defmodule Chapter23.MoreCoolStuff2 do
  import String, only: [split: 3, split: 2]
  import Enum, only: [map: 2]

  def sigil_v(lines, _opt) do
    lines
    |> split("\n", trim: true)
    |> map( fn line -> split(line, ",") |> map( &convert_if_possible/1 ) end  )
  end

  def convert_if_possible(value) do
    case Float.parse(value) do
      :error -> value
      {float, ""} -> float
    end
  end
end
