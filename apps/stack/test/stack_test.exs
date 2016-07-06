defmodule StackTest do
  use ExUnit.Case

  import Chapter17.Stash, only: [ store_stack: 1, fetch_stack: 0 ]
  import Chapter17.StackServer, only: [ pop: 0, push: 1, kill_server: 1 ]

  setup do
    store_stack([])

    on_exit fn ->
      store_stack([])
    end

    :ok
  end

  test "the stash and the stackserver are started" do
    stash_pid = Process.whereis Chapter17.Stash
    assert Process.alive? stash_pid

    stack_pid = Process.whereis Chapter17.StackServer
    assert Process.alive? stack_pid

    push 7
    assert 7 == pop

    assert [] == fetch_stack
  end

  test "killing the stackserver stores the data to the stash" do
    stack = 5..10
      |> Enum.to_list

    stack
    |> Enum.each(fn i -> push i end)

    catch_exit (kill_server :hammertime)

    stored = fetch_stack
             |> Enum.take(length(stack))

    assert (Enum.reverse stack) == stored
  end

  test "a killed stackserver gets restarted" do
    store_stack(1..10 |> Enum.to_list)
    [current_top | _ ] = fetch_stack

    catch_exit (kill_server :hammertime)

    # wait for restart
    :timer.sleep 500

    stack_pid = Process.whereis Chapter17.StackServer
    assert Process.alive? stack_pid
  end
end
