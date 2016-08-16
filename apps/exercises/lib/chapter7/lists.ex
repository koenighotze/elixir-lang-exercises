defmodule ListsAndRecursion do
  def len([]), do: 0
  def len([_ | t]), do: 1 + len(t)

  def squares([]), do: []
  def squares([h | t]), do: [ h * h | squares(t) ]


  def map([], func) when is_function(func), do: []
  def map([h | t], func) when is_function(func), do: [ func.(h) | map(t, func)  ]


  def sum(list) when is_list(list), do: _sum(list, 0)
  defp _sum([], acc), do: acc
  defp _sum([h | t], acc), do: _sum(t, acc + h)


  def reduce([], init, func) when is_function(func), do: init

  def reduce([h | t], val, func), do: reduce(t, func.(h, val), func)


  def mapsum(list, func) do
    mapsum(0, list, func)
  end

  defp mapsum(acc, [], _) do
    acc
  end

  @lint {Credo.Check.Refactor.PipeChainStart, false}
  defp mapsum(acc, [h | t], func) do
    func.(h) + acc
    |> mapsum(t, func)
  end

  def mymax([h|t]) do
    _max(h, t)
  end

  defp _max(current, []) do
    current
  end

  defp _max(current, [h | t]) when current < h do
    _max(h, t)
  end

  defp _max(current, [h | t]) when current >= h do
    _max(current, t)
  end


  def caesar(list, n) do
    _caesar([], list, n)
  end

  defp _caesar(acc, [], _) do
    acc
  end

  defp _caesar(acc, [h | t], n) do
    _caesar(acc ++ [h + n], t, n)
  end


  def swap([]), do: []
  def swap([a, b | t]), do: [b, a | swap(t)]
  def swap([ _ ]), do: raise "Boom"

  def myspan(from, to) when from > to, do: []
  def myspan(from, to) do
    [from | myspan(from + 1, to)]
  end


end
