defmodule Chapter21.TracerTryout do
  # use Chapter21.Tracer
  import Kernel, except: [def: 2] # override def
  import Chapter21.Tracer, only: [def: 2]

  def puts_sum_tree(a, b, c), do: IO.inspect(a + b + c)

  def add_list(list), do: Enum.reduce(list, 0, &( &1 + &2 ))
end
