defmodule Chapter16.SequenceServer do
  use GenServer

  def handle_call(:next_number, _from, current_number) do
    { :reply, current_number,current_number + 1 }
  end

  def start_server do
    {:ok, pid} = GenServer.start_link(__MODULE__, 100)
    pid
  end

  def call_server(pid) do
    GenServer.call(pid, :next_number)
  end
end
