defmodule Chapter20.MacroHygiene do
  defmacro hygiene do
    local = "before quote"

    res = quote do
      local = "in quote"
      IO.puts "In Quote local: #{local}"
    end

    IO.puts "End of macro local: #{local}"
    res
  end
end
