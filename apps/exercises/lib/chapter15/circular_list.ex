defmodule Chapter15.CircularList do
  def next([]), do: nil
  def next([h | _]), do: h

  def circle([]), do: {next([]), []}
  def circle([h | _] = list) do
    {h, List.insert_at(List.delete_at(list, 0), -1, h)}
  end
end
