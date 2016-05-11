defmodule Chapter17.StackServer do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], [ name: __MODULE__, debug: [:trace, :statistics] ])
  end

  def push(number) do
    GenServer.cast __MODULE__, {:push, number}
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def kill_server(how \\ :boom) do
    GenServer.call __MODULE__, { :kill, how }
  end

  def init(_) do
    IO.puts("Initialising Stackserver")
    stack = Chapter17.Stash.fetch_stack
    {:ok, stack}
  end

  def terminate(reason, stack) do
    IO.puts "terminated because of #{inspect reason}"
    Chapter17.Stash.store_stack stack
  end

  def handle_call({:init, data}, _from, _), do: {:reply, data, data}

  def handle_call(:pop, _from, []), do: {:reply, nil, []}
  def handle_call(:pop, _from, [h | t]), do: {:reply, h, t}

  def handle_call({:kill, how}, _, state) do
    IO.puts "Should kill myself because of #{inspect how}"
    case how do
     :boom ->
        raise "PENG"
      :hammertime ->
        IO.puts "Stopping #{inspect __MODULE__}"
        {:stop, :normal, state}
    end
  end

  def handle_cast({:push, elem}, stack) do
    {:noreply, [elem | stack ]}
  end
end
