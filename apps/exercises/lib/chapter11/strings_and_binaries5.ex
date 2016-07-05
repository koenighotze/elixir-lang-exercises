defmodule Chapter11.StringsAndBinaries5 do
  def center([]), do: ""

  def center(list), do: _center(list, max_length(list), "")
  def _center([], _width, aggregator), do: String.rstrip(aggregator, ?\n)
  def _center([h | t], width, aggregator) do
    pad = String.duplicate(" ", (width - String.length(h))  / 2 |> Float.floor |> round)

    # todo use ljust(subject, len, padding)
    padded = if String.length(h) == width do
      h
    else
      "#{pad}#{h}"
    end

    _center(t, width, "#{aggregator}#{padded}\n")
  end

  def max_length([]), do: 0
  def max_length([h | t]), do: _max_length(t, String.length(h))

  defp _max_length([], current_max), do: current_max
  defp _max_length([h | t], current_max), do: _max_length(t, max(current_max, String.length(h)))
end
