defmodule Chapter22.Protocols3 do
  import Enum, only: [reduce: 3]

  def each(list, func) do
    list
    |> reduce(nil, fn x, _acc ->
      func.(x)
    end)
  end

  def map(list, func) do
    list
    |> reduce([], fn x, acc ->
      acc ++ [ func.(x) ]
    end)
  end

  def filter(list, predicate) do
    list
    |> reduce([], fn x, acc ->
      if predicate.(x) do
        acc ++ [x]
      else
        acc
      end
    end)
  end
end
