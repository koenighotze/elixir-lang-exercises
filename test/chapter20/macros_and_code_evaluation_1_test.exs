defmodule Chapter20.MacrosAndCodeEvaluation1Test do
    use ExUnit.Case

    import Chapter20.MacrosAndCodeEvaluation1

    test "myunless true" do
      a = 3
      b = 1

      res = myunless a > b do
        raise "boom"
      else
        :ok
      end

      assert :ok == res
    end

end
