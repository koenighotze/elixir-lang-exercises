defmodule Chapter11.StringsAndBinaries5Test do
  use ExUnit.Case, async: true

  import Chapter11.StringsAndBinaries5, [:functions]

  test "simple center" do
    assert center(["foo"]) == "foo"
  end

  test "center" do
    assert center(["cat", "zebra", "elephant"]) == "  cat\n zebra\nelephant"
  end

  test "center - with unicode" do                                                            
    assert center(["∂⊃⊋∨≩≲≻", "⊋∨≩≲≻∂⊃⊋∨≩", "∂⊃⊋∨≩≲≻∂⊃⊋∨≩≲≻"]) == "   ∂⊃⊋∨≩≲≻\n  ⊋∨≩≲≻∂⊃⊋∨≩\n∂⊃⊋∨≩≲≻∂⊃⊋∨≩≲≻"
  end

  test "find max length - empty" do
    assert max_length([]) == 0
  end

  test "find max length - single" do
    assert max_length(["foo"]) == 3
  end

end
