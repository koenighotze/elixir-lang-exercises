defmodule Chapter21.LinkingModulesBehavioursAndUse3Test do
  use ExUnit.Case, async: true

  import Chapter21.LinkingModulesBehavioursAndUse3

  test "guard test" do
    assert 6 == add_three(3)
  end
end
