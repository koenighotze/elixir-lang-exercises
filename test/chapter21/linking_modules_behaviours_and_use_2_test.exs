defmodule Chapter21.LinkingModulesBehavioursAndUse2Test do
  use ExUnit.Case

  import Chapter21.TracerTryout
  
  test "ansitest" do
    assert 5 == puts_sum_tree(1, 2, 2)
    assert 5 == add_list([1, 2, 2])
  end
end
