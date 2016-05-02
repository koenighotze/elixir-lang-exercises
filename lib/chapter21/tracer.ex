defmodule Chapter21.Tracer do
  import Logger

  defmacro def({fname, _, _} = definition, do: content) do # simple pattern match on body
    IO.inspect(definition)

    quote do
      Kernel.def unquote(definition) do
        # debug("Calling #{fname}")

        res = unquote(content)

        # debug("Result #{res}")
        res
      end
    end
  end
end
