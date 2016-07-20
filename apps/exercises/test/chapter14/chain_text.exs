defmodule Chapter14.ChainTest do
  use ExUnit.Case, async: true
  import Chapter14.Chain

  test "run" do
    res = create_processes(10)
    assert 10 == res
  end

  test "counter" do
    pid = spawn(Chapter14.Chain, :counter, [ self ])
    send pid, 2

    receive do
      n -> assert 3 == n
      after 500 -> flunk("Timeout waiting for counter")
    end
  end

  

end
