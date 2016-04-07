defmodule Chapter16.OptServers5Test do
  use ExUnit.Case

  import Chapter16.StackServer

  @tag ignore: true
  test "Terminate server" do
    start_link

    push 3
    assert 3 == pop
    kill_server(:hammertime)
  end
end
