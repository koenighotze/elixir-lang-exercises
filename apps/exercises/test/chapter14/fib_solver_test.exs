defmodule Chapter14.FibsolverTest do
  use ExUnit.Case, async: true

  test "the solver sends ready to the scheduler" do
    spawn_link(Chapter14.Fibsolver, :solve_fib, [ self ])

    assert_receive {:ready, _ }
  end

  test "shutdown message stops the solver" do
    {pid, _} = spawn_monitor(Chapter14.Fibsolver, :solve_fib, [ self ])
    assert_receive {:ready, _ }

    send pid, {:shutdown}
    assert_receive {:DOWN, _, :process, ^pid, :normal}
  end

  test "fib message sends back the answer to the client" do
    pid = spawn_link(Chapter14.Fibsolver, :solve_fib, [ self ])
    assert_receive {:ready, _ }

    send pid, { :fib, self, 10 }

    assert_receive {:answer, 10, 55, ^pid }
  end

end
