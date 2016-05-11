defmodule Chapter14.WorkingWithProcesses4Test do
  use ExUnit.Case

  @tag ignore: true
  test "child_with_exception" do
    spawn_link(Chapter14.WorkingWithProcesses, :boom_child, [ self ])
    # will exit this process, thus we ignore the test
  end
end
