defmodule Chapter14.WorkingWithProcesses5Test do
  use ExUnit.Case, async: true
  import Chapter14.WorkingWithProcesses

  test "ping_child" do
    spawn_monitor(Chapter14.WorkingWithProcesses, :ping_child, [ self, 200 ])

    [{:ok, _}, {:DOWN, _, _, _, :normal}] = receive_all_messages
  end

  test "boom_child" do
    spawn_monitor(Chapter14.WorkingWithProcesses, :boom_child, [ self, 500 ])

    [{:ok, _}, {:DOWN, _, _, _, _}] = receive_all_messages
  end
end
