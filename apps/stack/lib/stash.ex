defmodule Chapter17.Stash do
  use GenServer

  def store_stack(stack) do
    GenServer.call(__MODULE__, {:store_stack, stack})
  end

  def fetch_stack do
    GenServer.call(__MODULE__, :fetch_stack)
  end

  def start_link(initial_stack \\ []) do
    IO.puts("Initialising Stash")
    {:ok, _pid} = GenServer.start_link(__MODULE__, initial_stack, [ name: __MODULE__, debug: [:trace, :statistics] ])
  end

  def handle_call(:fetch_stack, _, stack) do
    {:reply, stack, stack}
  end

  def handle_cast({:store_stack, stack}, _, _) do
    IO.puts "Storing #{inspect stack}"
    {:reply, :ok, stack}
  end

end
