defmodule Chapter17.StackSupervisor do
  use Supervisor

  def start_link do
    result = {:ok, _sup_pid} = Supervisor.start_link(__MODULE__, [])
    result
  end

  def init(_) do
    IO.puts("Initialising StackSupervisor")
    supervise [ worker(Chapter17.StackServer, []) ], strategy: :one_for_one
  end
end
