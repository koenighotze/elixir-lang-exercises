defmodule Chapter20.MacrosAndCodeEvaluation3Test do
    use ExUnit.Case
    require Chapter20.MacrosAndCodeEvaluation3

    test "lang conversion" do
      res = explain do: 2 + 3 * 4

      assert "multiply 3 and 4 then add 2" == res
    end

end
