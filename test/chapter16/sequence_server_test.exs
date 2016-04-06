defmodule Chapter16.SequenceServerTest do
  use ExUnit.Case

  import Chapter16.SequenceServer

  test "sequence returns next number" do
    res = handle_call(:next_number, self, 10)

    assert {:reply, 10, 11} == res
  end

end
