defmodule Chapter20.MacrosAndCodeEvaluation3Test do
    use ExUnit.Case
    import Chapter20.MacrosAndCodeEvaluation3

    test "explain 1 + 2" do
      assert "add 1 to 2" == explain(1 + 2)
    end

    test "explain 1 + 2 + 4" do
      assert "add 1 to 2, then add 4" == explain(1 + 2 + 4)
    end

    test "explain 1 + 2 + 4 + 5" do
      assert "add 1 to 2, then add 4, then add 5" == explain(1 + 2 + 4 + 5)
    end

    test "explain 1 * 2" do
      assert "multiply 1 and 2" == explain(1 * 2)
    end

    test "explain 1 / 2" do
      assert "divide 1 by 2" == explain(1 / 2)
    end

    test "explain 1 - 2" do
      assert "subtract 2 from 1" == explain(1 - 2)
    end

    @tag ignore: true
    test "lang conversion" do
      res = explain do: 2 + 3 * 4

      assert "multiply 3 and 4 then add 2" == res
    end

end
