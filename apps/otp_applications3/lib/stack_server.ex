defmodule Chapter18.OtpApplications3.StackServer do
  use GenServer
  import Logger

  import Chapter18.OtpApplications3.StashServer

  @name __MODULE__

  def start_link do
    info("Starting link on #{@name}")
    GenServer.start_link(@name, fetch_stack, [name: @name, debug: [:trace, :statistics]] )
  end

  def push(number) do
    info("Pushing #{number}")
    GenServer.cast(@name, {:push, number})
  end

  def pop do
    info("Popping")
    {:ok, result} = GenServer.call(@name, :pop)
    result
  end

  def pop(how_many) do
    info("Popping #{how_many} entries")
    {:ok, result} = GenServer.call(@name, {:pop, how_many})
    result
  end

  def sepuko() do
    info("Ritual suicide incoming")
    GenServer.cast(@name, :shame)
  end

  #### Internal

  def init(initial_stack \\ []) do
    {:ok, initial_stack}
  end

  def terminate(reason, state) do
    info("Terminating because of #{inspect reason}")
    store_stack(state)
  end

  def code_change(_version, _old_state, _extra) do
    info("Code change")

    new_state = nil
    {:ok, new_state}
  end

  def handle_call(:pop, _sender, [h | t]) do
    {:reply, {:ok, h}, t}
  end

  def handle_call({:pop, how_many}, _sender, current_state) do
    {:reply, {:ok, current_state |> Enum.take(how_many)}, current_state |> Enum.drop(how_many)}
  end

  def handle_cast({:push, number}, current_state) do
    {:noreply, [number | current_state]}
  end

  def handle_cast(:shame, _) do
    warn("Shame incoming...")
    raise "Shame!!!!"
  end
end
