defmodule Chapter15.Nodes4 do
  defmodule Registry do
    @registry :registry

    def start do
      pid = spawn_link(__MODULE__, :registry_master, [ nil, nil, [] ])
      :global.register_name(@registry, pid)
    end

    def inform_clients(new_client_pid, next_pid, first_pid) do
      send new_client_pid, {:next, next_pid}
      send first_pid, {:next, new_client_pid}
    end

    def registry_master(head, first, clients) do
      receive do
        {:register, client_pid} ->
          new_first = if is_nil(first) do client_pid else first end
          inform_clients(client_pid, head, new_first)

          registry_master(client_pid, new_first, [ client_pid | clients ])
        {:start_ticking} when [] != clients ->
          send head, { :tick, self }
          registry_master(head, first, clients)
        {:status, sender} ->
          registry_status = %{clients: clients, head: head, first: first}
          IO.puts "Sending status #{inspect registry_status}"
          send sender, registry_status
          registry_master(head, first, clients)
      end
    end

    def status do
      send :global.whereis_name(@registry), {:status, self}
    end

    def start_ticking do
      send :global.whereis_name(@registry), {:start_ticking}
    end
  end

  defmodule Client do
    def ticker(next) do
      receive do
        {:next, pid} ->
          IO.puts "Next for #{inspect self} is #{inspect pid}"
          ticker(pid)
        {:tick, _} when next != nil ->
          :timer.sleep 5000
          IO.puts "Tick #{inspect self} -> #{inspect next}"
          send next, {:tick, self}
          ticker(next)
      end
    end

    def spawn_client do
      client_pid = spawn_link(__MODULE__, :ticker, [ nil ])
      send :global.whereis_name(:registry), {:register, client_pid}
    end
  end

  def init do
    Chapter15.Nodes4.Registry.start

    1..5
    |> Enum.to_list
    |> Enum.each( fn _ -> Chapter15.Nodes4.Client.spawn_client end)

    Chapter15.Nodes4.Registry.start_ticking
  end
end
