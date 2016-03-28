defmodule Chapter14.Multimessage do
  def greet do
    receive do
      { sender, msg } ->
        send sender, { :ok, "Hello, #{msg}" }
        greet
    end
  end
end
