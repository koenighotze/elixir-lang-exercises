defmodule Chapter21.LinkingModulesBehavioursAndUse3 do
  use Chapter21.Tracer

  def add_three(x) when x < 5, do: x + 3
  # def add_three(x), do: x + 3
end
