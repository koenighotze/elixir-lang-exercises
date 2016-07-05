defmodule Chapter16.OptServers3And4Test do
  use ExUnit.Case

  import Chapter16.StackServer

  setup_all do
    start_link
    :ok
  end

  test "Poping returns the number" do
    push 1
    assert 1 == pop
  end

  test "popping an empty stack return nil" do
    prune_stack(pop)
    assert nil == pop
  end

  test "numbers can be pushed to an empty stack" do
    prune_stack(pop)
    push(6)
    assert 6 == pop
  end

  test "numbers can be pushed to an nonempty empty stack" do
    push(1)
    push(6)
    assert 6 == pop
    assert 1 == pop
  end

  defp prune_stack(nil) do
      nil
  end

  defp prune_stack(_last) do
    prune_stack(pop)
  end
end
