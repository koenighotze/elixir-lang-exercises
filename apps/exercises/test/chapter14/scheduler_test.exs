defmodule Chapter14.SchedulerTest do
  use ExUnit.Case

  import Chapter14.Scheduler

  test "drive" do
    res = run(3, Chapter14.Fibsolver, :solve_fib, [ 5, 10, 7 ])

    assert [ {5, 5}, {7, 13}, {10, 55} ] == res
  end

end
