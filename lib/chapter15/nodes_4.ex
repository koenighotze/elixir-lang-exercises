defmodule Chapter15.Nodes4 do
  import Chapter15.CircularList

  def start do
    pid = spawn(__MODULE__, :client_tick, [[]])
  end

  def register_client(pid) do

  end

  def client_tick(clients) do
    receive do
      {:register, pid} ->
        client_tick([pid | clients])
      {:status, self} ->
        send self, %{clients: clients}
        client_tick(clients)
    end
  end
end
