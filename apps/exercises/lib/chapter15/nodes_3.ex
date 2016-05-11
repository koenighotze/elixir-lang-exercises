defmodule Chapter15.Nodes3 do
  defmodule Server do
    @name :ticker
    @interval 2000

    def start do
      pid = spawn(__MODULE__, :ticker, [ [] ])
      :global.register_name(@name, pid)
    end

    def register_client(client_pid) do
      send :global.whereis_name(@name), { :register, client_pid }
    end

    def ticker(clients) do
      receive do
        {:register, client_pid} ->
          ticker([client_pid | clients])
        after @interval ->
          inform_clients(clients)
      end
    end

    def inform_clients([]) do
      IO.puts("...no clients")
      ticker([])
    end
    def inform_clients(clients) do
      IO.puts "Tick..."

      next = List.last(clients)
      send next, {:tick}
      ticker([ next | List.delete_at(clients, -1) ])
    end
  end

  defmodule Client do
    def start do
      pid = spawn(__MODULE__, :tocker, [])
      Chapter15.Nodes3.Server.register_client(pid)
    end

    def tocker do
      receive do
        {:tick} ->
          IO.puts "Tock"
          tocker
      end
    end
  end


end
