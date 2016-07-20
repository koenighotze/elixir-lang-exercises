defmodule Chapter18.OtpApplications3.StackServerTest do
  use ExUnit.Case, async: true
  import Chapter18.OtpApplications3.StackServer

  test "push pop" do
    push 8
    assert 8 = pop
  end

  test "push pop multiple" do
    push 8
    push 5
    assert [5, 8] = pop 2
  end
end
