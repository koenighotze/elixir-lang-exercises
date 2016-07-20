defmodule Chapter20.FinalMyIfTest do
  use ExUnit.Case, async: true

  import Chapter20.FinalMyIf

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
    assert outside == "do_not_change_me"
  end

  test "my if written as expected" do
    res = myif 4 / 2 == 2 do
       "yes"
     else
       "no"
     end
    assert res == "yes"
  end

end
