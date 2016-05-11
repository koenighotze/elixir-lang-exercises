defmodule Sum do
  def of([]) do
    0
  end

  def of([h | t]) do
    h + of(t)
  end

  #integer version
  def of(0) do
    0
  end

  def of(n) do
    n + of(n-1)
  end
end
