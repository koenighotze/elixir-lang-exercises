defmodule Chapter14.Link1 do
  import :timer, only: [ sleep: 1 ]

  def fun do
    sleep 500
    exit(:boom)
  end

  def run_ignore do
    spawn(Chapter14.Link1, :fun, [])

    receive do
      msg -> IO.puts "Received #{inspect msg}"
    after 1000 -> IO.puts "Nothing..."
    end
  end

  def run_linked do
    spawn_link(Chapter14.Link1, :fun, [])

    receive do
      msg -> IO.puts "Received #{inspect msg}"
    after 1000 -> IO.puts "Nothing..."
    end
  end


  def run_linked_trap do
    Process.flag(:trap_exit, true)
    spawn_link(Chapter14.Link1, :fun, [])

    receive do
      msg -> IO.puts "Received #{inspect msg}"
    after 1000 -> IO.puts "Nothing..."
    end
  end
end
