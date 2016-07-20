defmodule Chapter19.FibTest do
  use ExUnit.Case, async: true

  import Chapter19.Fib
  import Logger

  test "sync" do
    assert 55 == of(10)
  end


  test "run as task" do
    worker = Task.async fn -> of(10) end

    debug "Waiting for worker..."

    result = Task.await(worker)

    assert 55 == result
  end

  test "run task with different syntax" do
    worker = Task.async(Chapter19.Fib, :of, [10])
    debug("#{inspect worker}")
    assert 55 = Task.await(worker)
  end
end
