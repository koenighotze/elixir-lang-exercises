defmodule Chapter17.StackSupervisor do
  use Supervisor

  def start_link do
    result = {:ok, sup_pid} = Supervisor.start_link(__MODULE__, [])
    # {:ok, _} = Supervisor.start_child(sup_pid, worker(Chapter17.StackServer, []))
    result
  end

  def init(_) do
    IO.puts("Initialising StackSupervisor")
    supervise [ worker(Chapter17.StackServer, []) ], strategy: :one_for_one
    # supervise [  ], strategy: :one_for_one
  end
end
