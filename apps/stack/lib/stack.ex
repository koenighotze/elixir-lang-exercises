defmodule Stack do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do

    #
    # children = [
    #   # Define workers and child supervisors to be supervised
    #   worker(Chapter17.MainSupervisor, [[3, 4, 5]])
    # ]
    #
    # # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # # for other strategies and supported options
    # opts = [strategy: :one_for_one, name: Sequence.Supervisor]
    # Supervisor.start_link(children, opts)

    IO.puts "initial_stack is #{Application.get_env(:stack, :initial_stack)}"

    {:ok, _pid} = Chapter17.MainSupervisor.start_link Application.get_env(:stack, :initial_stack)
  end
end
