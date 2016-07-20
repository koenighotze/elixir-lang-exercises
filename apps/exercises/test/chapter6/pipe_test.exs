defmodule TestThePipe do
    use ExUnit.Case, async: true


    test "naive" do
      assert TryThePipe.dostuff([1, 2, 3, 4, 5]) == [6]
    end
end
