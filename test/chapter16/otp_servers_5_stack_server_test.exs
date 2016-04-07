defmodule Chapter16.OptServers5Test do
  use ExUnit.Case

  import Chapter16.StackServer

  test "Terminate server" do
    start_link

    push 3
    assert 3 == pop
    kill_server
  end
end
