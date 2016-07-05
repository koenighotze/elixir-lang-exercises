defmodule Chapter21.Tracer do
  import Logger

  import IO.ANSI

  def dump_args(args) do
    res = args
    |> Enum.map(&inspect/1)
    |> Enum.map(fn s -> red() <> s <> white() end)
    |> Enum.join(",")
    res <> cyan()
  end

  def dump_functionname(fname) do
    white() <> "#{fname}" <> cyan()
  end

  defmacro def(_definition = {_fname, _, _args}, [when: _condition, do: content]) do # simple pattern match on body
    quote do
      unquote(content)
    end
  end

  defmacro def(definition = {fname, _, args}, [do: content]) do # simple pattern match on body
    IO.inspect(definition)

    quote do
      Kernel.def unquote(definition) do
        debug("==> Calling #{Chapter21.Tracer.dump_functionname(unquote(fname))} (#{Chapter21.Tracer.dump_args(unquote(args))})")

        res = unquote(content)

        debug("<== Result " <> white() <> "#{inspect res}" <>cyan())
        res
      end
    end
  end

  defmacro __using__(_opts) do
    quote do
      import Kernel, except: [def: 2] # override def
      import unquote(__MODULE__), only: [def: 2]
    end
  end
end
