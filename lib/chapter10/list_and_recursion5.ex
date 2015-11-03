defmodule Chapter10 do
  defmodule ListAndRecursion5 do

    def all?([], _) do
      true
    end

    def all?([h | t], pred) do
      if pred.(h) do
        all?(t, pred)
      else
        false
      end
    end


    def each([], _) do
      :ok
    end

    def each([h | t], fun) do
      fun.(h)
      each(t, fun)
    end

    def filter([], _) do
      []
    end

    def filter([h | t], pred) do
      if pred.(h) do
        [h | filter(t, pred)]
      else
        filter(t, pred)
      end
    end

    def take([], _) do
      []
    end

    def take(_, 0) do
      []
    end

    def take([h | t], num) do
      [h | take(t, num - 1)]
    end

    


    def split(list, at) do

    end

  end
end
