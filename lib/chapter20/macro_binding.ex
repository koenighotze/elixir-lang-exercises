defmodule Chapter20.MacroBinding do

  defmacro bind(arg) do
    quote do
        if unquote(arg), do: :ok, else: :nok
    end
  end

end
