defmodule Chapter10.ListAndRecursion6 do
  @doc """
  Flattens a list

  ## Examples

  iex> flatten([1, [2, 3, [4]], 5, [[[6]]]])
  [1, 2, 3, 4, 5, 6]
  """
  def flatten([]), do: []

  def flatten([h | t]) when is_list(h) do
    flatten(h) ++ flatten(t)
  end

  def flatten([h | t]) do
    [h | flatten(t)]
  end
end
