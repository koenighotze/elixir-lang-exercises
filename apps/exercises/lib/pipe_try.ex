defmodule TryThePipe do
  def dostuff(somelist) when is_list(somelist) do
    somelist
    |> Enum.map(&( &1 + 3 ))
    |> Enum.filter( &(rem(&1, 3) == 0 ) )
  end
end
