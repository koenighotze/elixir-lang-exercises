defmodule Chapter16.OptServers2Test do
  use ExUnit.Case, async: true

  setup do
    {:ok, pid} = GenServer.start_link(Chapter16.StackServer, [])
    {:ok, pid: pid}
  end

  test "numbers can be pushed to an empty stack", %{pid: pid} do
    GenServer.cast(pid, {:push, 7})

    assert 7 == GenServer.call(pid, :pop)
  end

  test "numbers can be pushed to an nonempty empty stack", %{pid: pid} do
    assert [4, 5, 6] == GenServer.call(pid, {:init, [4, 5, 6] })

    GenServer.cast(pid, {:push, 7})

    assert 7 == GenServer.call(pid, :pop)
  end
end
