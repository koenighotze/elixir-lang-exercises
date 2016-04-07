defmodule Chapter16.OptServers3And4Test do
  use ExUnit.Case

  import Chapter16.StackServer

  test "Poping returns the number" do
    start_link [1, 2, 3]

    assert 1 == pop
  end

  test "popping an empty stack return nil" do
    start_link

    assert nil == pop
  end

  test "numbers can be pushed to an empty stack" do
    start_link

    push(6)

    assert 6 == pop
  end

  test "numbers can be pushed to an nonempty empty stack" do
    start_link [1, 2, 3]

    push(6)
    assert 6 == pop
    assert 1 == pop
  end
end
