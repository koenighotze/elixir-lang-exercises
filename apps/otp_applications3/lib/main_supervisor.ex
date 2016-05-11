defmodule Chapter18.OtpApplications3.MainSupervisor do
  use Supervisor
  import Logger

  def start_link(initial_stack) do
    result = {:ok, pid} = Supervisor.start_link(__MODULE__, [])

    {:ok, _} = Supervisor.start_child(pid, worker(Chapter18.OtpApplications3.StashServer, initial_stack))
    {:ok, _} = Supervisor.start_child(pid, worker(Chapter18.OtpApplications3.StackServerSupervisor, []))

    result
  end


  def init(_) do
    info("Initializing Main Supervisor")
    supervise [], strategy: :one_for_one
  end
end
