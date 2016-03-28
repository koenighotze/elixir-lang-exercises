defmodule Chapter14.SimpleSendReceive do
  def greet do
    receive do
      { sender, msg } ->
        send sender, { :ok, "Hello, #{msg}" }
    end
  end

  def client do
    pid = spawn(Chapter14.SimpleSendReceive, :greet, [])
    send pid, { self, "Bratislav!" }

    receive do
      { :ok, text } ->
        IO.puts "Received: #{text}"
      after 500 ->
        IO.puts "The greeter is unavailable"
    end
  end
end
