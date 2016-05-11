defmodule Chapter20.MyIfTest do
  use ExUnit.Case

  import Chapter20.MyIf

  test "myif true" do
    res = myif(4 / 2 == 2, [ do: "yes", else: "no" ])
    assert res == "yes"
  end

  test "myif false" do
    outside = "do_not_change_me"

    res = myif(4 / 3 == 2, [ do:
      (outside = "changed"
      "yes"),
      else: "no" ])
    assert res == "no"
    assert outside == "changed"
  end

end
