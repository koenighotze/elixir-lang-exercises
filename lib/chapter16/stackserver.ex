defmodule Chapter16.StackServer do
  use GenServer

  def start_link(init \\ []) do
    GenServer.start_link(__MODULE__, init, name: __MODULE__)
  end

  def push(number) do
    GenServer.cast __MODULE__, {:push, number}
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def handle_call({:init, data}, _from, _), do: {:reply, data, data}

  def handle_call(:pop, _from, [h | t] = stack), do: {:reply, h, t}

  def handle_call(:pop, _from, _), do: {:reply, nil, []}

  def handle_cast({:push, elem}, stack) do
    {:noreply, [elem | stack ]}
  end
end
