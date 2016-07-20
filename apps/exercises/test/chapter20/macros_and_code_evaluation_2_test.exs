defmodule Chapter20.MacrosAndCodeEvaluation2Test do
    use ExUnit.Case, async: true
    require Chapter20.MacrosAndCodeEvaluation2

    Chapter20.MacrosAndCodeEvaluation2.times_n(3)
    Chapter20.MacrosAndCodeEvaluation2.times_n(5)

    test "times" do
      assert 9 == times_3(3)
      assert 15 == times_5(3)
    end

end
