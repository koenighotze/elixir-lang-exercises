defmodule StackTest do
  use ExUnit.Case

  test "the stash and the stackserver are started" do
    stash_pid = Process.whereis Chapter17.Stash
    assert Process.alive? stash_pid

    stack_pid = Process.whereis Chapter17.StackServer
    assert Process.alive? stack_pid

    Chapter17.StackServer.push 7
    assert 7 == Chapter17.StackServer.pop

    assert [] != Chapter17.Stash.fetch_stack
  end

  test "killing the stackserver stores the data to the stash" do
    stack = 5..10
      |> Enum.to_list

    stack
    |> Enum.each(fn i -> Chapter17.StackServer.push i end)

    catch_exit (Chapter17.StackServer.kill_server :hammertime)

    stored = Chapter17.Stash.fetch_stack
             |> Enum.take(length(stack))

    assert (Enum.reverse stack) == stored
  end

  test "a killed stackserver gets restarted" do
    [current_top | _ ] = Chapter17.Stash.fetch_stack

    catch_exit (Chapter17.StackServer.kill_server :hammertime)

    # wait for restart
    :timer.sleep 500

    stack_pid = Process.whereis Chapter17.StackServer
    assert Process.alive? stack_pid
  end
end
