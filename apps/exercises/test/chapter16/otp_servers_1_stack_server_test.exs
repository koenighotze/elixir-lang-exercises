defmodule Chapter16.OptServers1Test do
  use ExUnit.Case, async: true

  setup do
    {:ok, pid} = GenServer.start_link(Chapter16.StackServer, [], [debug: [:trace, :statistics]])
    {:ok, pid: pid}
  end

  test "Poping returns the number", %{pid: pid} do
    assert [4, 5, 6] == GenServer.call(pid, {:init, [4, 5, 6] })

    assert 4 == GenServer.call(pid, :pop)

    assert 5 == GenServer.call(pid, :pop)
  end

  test "popping an empty stack return nil", %{pid: pid} do
    assert nil == GenServer.call(pid, :pop)
  end

  test "fetching the stats", %{pid: pid} do
    {:ok, data} = :sys.statistics pid, :get

    assert data[:messages_in] == 0

    GenServer.call(pid, :pop)

    {:ok, data} = :sys.statistics pid, :get

    assert data[:messages_in] == 1
  end

  test "get status", %{pid: pid} do
    {:status, ^pid, {:module, :gen_server}, _} = :sys.get_status pid
  end

end
