defmodule Chapter21.TracerTryoutTest do
  use ExUnit.Case, async: true

  import Chapter21.TracerTryout

  test "tryout" do
    assert 5 == puts_sum_tree(1, 2, 2)

    assert 5 == add_list([1, 2, 2])
  end

end