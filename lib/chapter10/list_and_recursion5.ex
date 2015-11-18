defmodule Chapter10 do
  defmodule ListAndRecursion5 do

    def all?([], _), do: true

    def all?([h | t], pred) do
      if pred.(h) do
        all?(t, pred)
      else
        false
      end
    end


    def each([], _), do: :ok

    def each([h | t], fun) do
      fun.(h)
      each(t, fun)
    end

    def filter([], _), do: []

    def filter([h | t], pred) do
      if pred.(h) do
        [h | filter(t, pred)]
      else
        filter(t, pred)
      end
    end

    def take([], _), do: []
    def take(_, 0), do: []
    def take([h | t], num) do
      [h | take(t, num - 1)]
    end


    def split([], _), do: []

    def split(list, at), do: _split(list, at, [])

    defp _split([h | t], at, acc) do
      if at == 1 do
        { acc ++ [ h ] , t }
      else
        _split(t, at - 1, acc ++ [h] )
      end
    end

  end
end
