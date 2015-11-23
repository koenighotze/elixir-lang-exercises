defmodule Chapter10.ListAndRecursion7 do
  import Chapter10.ListAndRecursion5, [:functions]

  def span(n) do
    for x <- 1..n, y <- 1..x
  end

end
