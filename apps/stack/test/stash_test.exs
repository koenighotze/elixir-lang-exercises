defmodule Chapter17.StashTest do
  use ExUnit.Case

  import Chapter17.Stash

  test "smoke test" do
    Chapter17.Stash.store_stack [1, 2, 3]
    assert [1, 2, 3] == fetch_stack

    store_stack [4, 5, 6]

    assert [4, 5, 6] == fetch_stack
  end
end
