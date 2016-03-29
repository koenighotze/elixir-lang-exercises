defmodule Chapter14.WorkingWithProcesses3Test do
  use ExUnit.Case
  import Chapter14.WorkingWithProcesses
  import :timer, only: [ sleep: 1 ]

  test "WorkingWithProcesses3Test" do
    spawn_link(Chapter14.WorkingWithProcesses, :ping_child, [ self ])

    sleep 500

    assert_received {:ok, _ }
  end
end
