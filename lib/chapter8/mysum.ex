defmodule Chapter8 do
  defmodule Sum do
    import Enum, only: [sum: 1]
    def sum_of_values(dict) do
      dict
      |> Dict.values
      |> sum
    end
  end
end
