defmodule Chapter15.TickerClient do
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Chapter15.Ticker.register(pid)
  end

  def receiver do
    receive do
      {:tick} -> IO.puts("Tock")
      receiver
    end
  end

end
