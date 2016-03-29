defmodule Chapter14.WorkingWithProcesses do
  import :timer, only: [sleep: 1]


  def boom_child(parent, dur) do
    sleep(dur)
    boom_child(parent)
  end
  def boom_child(parent) do
    send parent, {:ok, "Message"}
    raise("boom")
  end

  def ping_child(parent, dur) do
    ping_child(parent)
    sleep(dur)
  end

  def ping_child(parent), do: send(parent, {:ok, "Message"})

  def receive_all_messages, do: receive_all_messages([])

  defp receive_all_messages(agg) do
    receive do
      msg ->
        IO.puts("#{inspect msg}")
        receive_all_messages([msg | agg])
    after 1000 -> agg
    end
    |> Enum.reverse
  end
end
