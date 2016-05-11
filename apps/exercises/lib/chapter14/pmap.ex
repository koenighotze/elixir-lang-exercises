defmodule Chapter14.Pmap do
  import Enum, only: [ map: 2 ]

  :random.seed(:os.timestamp())

  defp spawn_and_apply(elem, fun) do
    parent = self

    spawn_link fn ->
      :timer.sleep( :random.uniform(100) )
      send(parent, {self, fun.(elem)} )
    end
  end

  def pmap(col, fun) do
    col
    |> map( &( spawn_and_apply(&1, fun)  ) )
    |> map fn pid ->
      receive do
        {^pid, res} -> res
        after 5000 -> raise("unexpected")
      end
    end
  end
end
