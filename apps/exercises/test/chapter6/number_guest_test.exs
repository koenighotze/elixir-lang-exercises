defmodule NumberGuessTest do
    use ExUnit.Case, async: true

    test "modules-and-functions-6" do
        NumberGuess.guess(10, 1..20)
    end
end
