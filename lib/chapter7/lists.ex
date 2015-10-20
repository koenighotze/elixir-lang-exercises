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
end
