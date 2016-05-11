defmodule Chapter17.MainSupervisor do
  use Supervisor

  def start_link(initial_stack \\ [32, 44, 1895]) do
    result = {:ok, sup_pid} = Supervisor.start_link(__MODULE__, [])

    start_workers(sup_pid, initial_stack)

    result
  end

  def start_workers(supervisor_pid, initial_stack) do
    {:ok, _} = Supervisor.start_child(supervisor_pid, worker(Chapter17.Stash, [ initial_stack ]))
    {:ok, _} = Supervisor.start_child(supervisor_pid, worker(Chapter17.StackServer, [ ]))
  end

  def init(_) do
    IO.puts("Initialising MainSupervisor")
    supervise [], strategy: :one_for_one
  end
end
