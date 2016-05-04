defmodule Chapter21.LinkingModulesBehavioursAndUse3Test do
  use ExUnit.Case

  import Chapter21.LinkingModulesBehavioursAndUse3

  test "guard test" do
    assert 6 == add_three(3)
  end
end
