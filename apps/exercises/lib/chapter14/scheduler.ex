defmodule Chapter14.Scheduler do
  import Enum, only: [empty?: 1]

  def drive do
    IO.puts "Driving"
    Enum.each 1..10, fn num_processes ->
      {time, _res} = :timer.tc(Chapter14.Scheduler, :run, [num_processes, Chapter14.Fibsolver, :solve_fib, [ 37, 37, 37, 37, 37, 37 ]])

      IO.puts("Num Proc #{num_processes} took #{time/1_000_000} secs")
    end
  end

  def run(num_processes, module, function, queue) do
    1..num_processes
    |> Enum.map( fn(_) -> spawn(module, function, [ self ]) end )
    |> schedule(queue, [])
  end

  defp schedule([], _, results), do: results |> Enum.sort(fn {n1, _}, {n2, _} -> n1 <= n2 end  )

  defp schedule(processes, queue, results) do
    IO.puts("Active processes #{inspect processes}")
    IO.puts("Queue #{inspect queue}")

    receive do
      {:ready, pid} when length(queue) > 0 ->
        schedule_fib(pid, processes, queue, results)
      {:ready, pid} ->
        shutdown_pid(pid, processes, queue, results)
      {:answer, n, fib, _pid} ->
        IO.puts("Received answer fib(#{n})==#{fib}")
        schedule(processes, queue, [ {n, fib} | results ])
    end
  end

  def schedule_fib(pid, processes, queue, results) do
    IO.puts "#{inspect pid} is ready for action"

    [h | t] = queue
    send pid, {:fib, self, h}

    schedule(processes, t, results)
  end

  def shutdown_pid(pid, processes, queue, results) do
    IO.puts "Shutting down #{inspect pid}"
    send pid, {:shutdown}
    if empty?(processes) do
      IO.puts "Finished processing...exiting"
      schedule([], [], results)
    else
      schedule(List.delete(processes, pid), queue, results)
    end
  end
end
