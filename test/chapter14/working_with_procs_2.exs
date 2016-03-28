defmodule Chapter14.WorkingWithProcesses2Test do
  use ExUnit.Case


  def echo do
    receive do
      {sender, token} -> send sender, token
    end
  end


  test "echo echoes token" do
    pid = spawn(Chapter14.WorkingWithProcesses2Test, :echo, [])

    send pid, {self, "token"}

    res = receive do
      token -> token
      after 500 -> flunk("timeout")
    end

    assert "token" == res
  end


  def receive_all_tokens(agg) do
    receive do
      token -> receive_all_tokens([token | agg])
      after 1000 -> agg
    end
    |> Enum.reverse
  end

  test "Working with procs 2" do
    first = spawn(Chapter14.WorkingWithProcesses2Test, :echo, [])
    second = spawn(Chapter14.WorkingWithProcesses2Test, :echo, [])

    send first, { self, "firsttoken" }
    send second, { self, "secondtoken" }

    tokens = receive_all_tokens([])

    assert ["firsttoken", "secondtoken"] == tokens
  end

end
