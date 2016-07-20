defmodule Chapter17.MainSupervisorTest do
  use ExUnit.Case, async: true

  import Chapter17.MainSupervisor

  test "supervisor starts the stash" do
    Chapter17.Stash.store_stack([1, 2, 3])

    assert [] != Chapter17.Stash.fetch_stack

    assert 0 < Chapter17.StackServer.pop
  end

end
