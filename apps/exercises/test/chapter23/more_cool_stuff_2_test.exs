defmodule Chapter23.MoreCoolStuff2Test do
  use ExUnit.Case

  import Chapter23.MoreCoolStuff2

  test "more cool stuff - 2" do
    csv = ~v"""
    1,2,3.14
    cat,dog
    """

    assert csv == [[1, 2, 3.14 ], ["cat", "dog"]]
  end

end
