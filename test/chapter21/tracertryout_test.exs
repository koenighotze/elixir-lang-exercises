defmodule Chapter21.TracerTryoutTest do
  use ExUnit.Case

  import Chapter21.TracerTryout

  test "tryout" do
    assert 5 == puts_sum_tree(1, 2, 2)
  end

end
