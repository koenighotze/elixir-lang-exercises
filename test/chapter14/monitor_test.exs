defmodule Chapter14.MonitorTest do
  use ExUnit.Case

  test "monitoring proc gets a DOWN message" do
    { proc_pid, proc_ref } = spawn_monitor(Chapter14.Link1, :fun, [])

    receive do
      { :DOWN, ^proc_ref, :process, ^proc_pid, :boom } -> assert true
    after 1000 -> flunk("expected a down message")
    end

  end
end
