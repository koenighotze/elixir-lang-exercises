defmodule Chapter15.Ticker do

  @interval 2000 # seconds
  @name :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [ [] ])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register, client_pid }
  end

  def generator(clients) do
    receive do
      {:register, client_pid} ->
        IO.puts("Registering client #{inspect client_pid}")
        generator([client_pid | clients])
      after @interval ->
        IO.puts "Tick..."
        clients
        |> Enum.each fn client ->
            send client, {:tick}
          end
        generator(clients)
    end
  end

end
