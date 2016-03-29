defmodule Chapter14.Fibsolver do

  def solve_fib(scheduler) do
    send scheduler, {:ready, self}

    receive do
      {:fib, sender, n } ->
        answer = fib(n)
        send sender, {:answer, n, answer, self}
        solve_fib(scheduler)
      {:shutdown } ->
        IO.puts("...shutting down #{inspect self}")
        exit(:normal)
    end
  end

  defp fib(0), do: 0
  defp fib(1), do: 1
  defp fib(n), do: fib(n - 1) + fib(n - 2)
end
