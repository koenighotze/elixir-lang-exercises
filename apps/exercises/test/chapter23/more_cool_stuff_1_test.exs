defmodule Chapter23.MoreCoolStuff1Test do
  use ExUnit.Case, async: true

  import Chapter23.MoreCoolStuff1

  test "more cool stuff - 1" do
    csv = ~v"""
    1,2,3
    cat,dog
    """

    assert csv == [["1", "2", "3" ], ["cat", "dog"]]
  end

end
