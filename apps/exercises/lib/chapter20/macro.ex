defmodule Chapter20.Macro do
  import Logger

  defmacro macro(somecode) do
    IO.inspect somecode
    somecode
  end

  defmacro unquote_tryout(somecode) do
    debug "somecode: #{inspect somecode}"

    quote do
      # does not work...
      #3 == somecode
      debug "unquoted somecode: #{inspect unquote(somecode)}"
      3 == unquote(somecode)
    end
  end
end
