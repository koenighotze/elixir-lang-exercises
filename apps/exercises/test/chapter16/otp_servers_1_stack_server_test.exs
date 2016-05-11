defmodule Chapter16.OptServers1Test do
  use ExUnit.Case

  setup do
    {:ok, pid} = GenServer.start_link(Chapter16.StackServer, [], [debug: [:trace, :statistics]])
    {:ok, pid: pid}
  end

  test "Poping returns the number", context do
    pid = context[:pid]

    assert [4, 5, 6] == GenServer.call(pid, {:init, [4, 5, 6] })

    assert 4 == GenServer.call(pid, :pop)

    assert 5 == GenServer.call(pid, :pop)
  end

  test "popping an empty stack return nil", context do
    pid = context[:pid]

    assert nil == GenServer.call(pid, :pop)
  end

  test "fetching the stats", context do
    pid = context[:pid]
    {:ok, data} = :sys.statistics pid, :get

    assert data[:messages_in] == 0

    GenServer.call(pid, :pop)

    {:ok, data} = :sys.statistics pid, :get

    assert data[:messages_in] == 1
  end

  test "get status", context do
    pid = context[:pid]

    {:status, ^pid, {:module, :gen_server}, _} = :sys.get_status pid
  end

end
