defmodule Chapter14.Chain do
  def counter(next_pid) do
    receive do
        n -> send next_pid, n + 1
    end
  end

  def spawn_counter(receiver_pid) do
    spawn(Chapter14.Chain, :counter, [ receiver_pid ])
  end

  def create_processes(n) do
    # create a chain of n chained processes
    last_pid = Enum.reduce(1..n, self, fn(_, receiver_pid) -> spawn_counter(receiver_pid) end)

    send last_pid, 0

    receive do
      n -> n
      after 5000 ->
        raise "Timeout waiting"
    end
  end

  @doc """
  Run like 'elixir -r lib/chapter14/chain.ex -e "Chapter14.Chain.load(100000)"'

  elixir -r lib/chapter14/chain.ex -e "Chapter14.Chain.load(400_000)"

  elixir --erl "+P 1000000" -r lib/chapter14/chain.ex -e "Chapter14.Chain.load(400_000)"
  """
  def load(num_procs) do
    {micros, _} = :timer.tc(Chapter14.Chain, :create_processes, [ num_procs ])
    millis = micros / 1000
    IO.puts "Execution of #{num_procs} processes took #{millis} milliseconds (#{millis / 1000} secs)"
  end
end
