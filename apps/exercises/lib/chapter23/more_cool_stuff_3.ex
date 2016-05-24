defmodule Chapter23.MoreCoolStuff3 do
  import String, only: [split: 3, split: 2, strip: 1]
  import Enum, only: [map: 2, zip: 2, drop: 2]
  import Chapter23.MoreCoolStuff2, only: [convert_if_possible: 1]

  def sigil_v(lines, _opt) do
    splitted = lines |> split("\n", trim: true)
    headers = splitted |> List.first |> extract_header

    splitted
    |> drop(1)
    |> map(fn line ->
      line
      |> split(",")
      |> map(&strip/1)
      |> construct_line(headers)
    end)
  end

  def construct_line(items, header) do
    zip(header, items)
    |> map( fn {k, v} -> {String.to_atom(k), convert_if_possible(v)} end)
  end

  def extract_header(lines) do
    lines
    |> split(",")
    |> map(&strip/1)
  end
end
