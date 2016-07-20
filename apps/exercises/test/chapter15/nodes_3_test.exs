defmodule Chapter15.Nodes3Test do
  use ExUnit.Case, async: true

  import Chapter15.Nodes3

  test "starting the server registers a global name" do
    Chapter15.Nodes3.Server.start
    assert :global.whereis_name(:ticker)
  end

  test "server sends ticks" do
    Chapter15.Nodes3.Server.start

    Chapter15.Nodes3.Server.register_client(self)

    assert_receive({:tick}, 3000, "Expected a tick")
  end
end
