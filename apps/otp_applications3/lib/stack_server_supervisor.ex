defmodule Chapter18.OtpApplications3.StackServerSupervisor do
  use Supervisor
  import Logger

  def start_link do
    result = {:ok, pid} = Supervisor.start_link(__MODULE__, [])

    {:ok, _} = Supervisor.start_child(pid, worker(Chapter18.OtpApplications3.StackServer, []))

    result
  end


  def init(_) do
    info("Initializing #{__MODULE__}")
    supervise [], strategy: :one_for_one
  end
end
