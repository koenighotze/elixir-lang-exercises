defmodule Chapter14.MultimessageTest do
  use ExUnit.Case

  test "Receive single message" do

    pid = spawn(Chapter14.Multimessage, :greet, [])
    send pid, { self, "Bratislav" }

    receive do
      { :ok, text } ->
        assert text == "Hello, Bratislav"
    end
  end

  test "Multimessage" do
    pid = spawn(Chapter14.Multimessage, :greet, [])

    send pid, { self, "Bla"}
    receive do
      { :ok, text } ->
        assert text == "Hello, Bla"
    end

    send pid, { self, "Blubb"}
    receive do
      { :ok, text } ->
        assert text == "Hello, Blubb"
      after 400 ->
        flunk("Server went away")
    end
  end
end
