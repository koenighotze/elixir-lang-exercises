defmodule Chapter18.OtpApplications3 do
  use Application
  import Logger

  def start(_type, _args) do
    info("Starting application")
    {:ok, _pid} = Chapter18.OtpApplications3.MainSupervisor.start_link []
  end
end
