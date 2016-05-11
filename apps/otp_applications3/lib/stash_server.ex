defmodule Chapter18.OtpApplications3.StashServer do
  use GenServer
  require Logger
  import Logger

  @name __MODULE__

  def start_link(init_stack \\ []) do
    info("Starting link on #{@name}")
    GenServer.start_link(@name, init_stack, [name: @name, debug: [:trace, :statistics]] )
  end

  def store_stack(stack) do
    GenServer.cast(@name, {:store, stack})
  end

  def fetch_stack do
    {:ok, result} = GenServer.call(@name, :fetch)
    result
  end

  #### Internal

  def init(init_stack) do
    info("Init with stack #{init_stack}")
    {:ok, init_stack}
  end

  def terminate(reason, _state) do
    info("Terminating because of #{inspect reason}")
  end

  def code_change(_version, _old_state, _extra) do
    info("Code change")

    new_state = nil
    {:ok, new_state}
  end

  def handle_call(:fetch, _sender, current_state) do
    {:reply, {:ok, current_state}, current_state}
  end

  def handle_cast({:store, stack}, _current_state) do
    info("Storing stack #{stack}")
    {:noreply, stack}
  end
end
