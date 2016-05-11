defmodule Chapter17.StackServerTest do
  use ExUnit.Case

  import Chapter17.StackServer

  test "Poping returns the number" do
    push 1
    assert 1 == pop
  end

  defp prune_stack(nil), do: nil
  defp prune_stack(last) do
    pop
    |> prune_stack
  end

  test "popping an empty stack return nil" do
    assert nil == prune_stack(pop)
  end

  test "numbers can be pushed to an empty stack" do
    push 6

    assert 6 == pop
  end

  test "numbers can be pushed to an nonempty stack" do
    push 1
    push 6

    assert 6 == pop
    assert 1 == pop
  end
end
