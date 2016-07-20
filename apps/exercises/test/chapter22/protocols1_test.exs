defmodule Chapter22.Protocols1Test do
  use ExUnit.Case, async: true

  import Chapter22.Protocols1

  test "encrypt list" do
    res = encrypt([1, 2, 3, 4, 5], 7)
    assert [8, 9, 10, 11, 12] == res
  end

  test "rot13 list" do
    res = rot13([1, 2, 3, 4, 5])
    assert [14, 15, 16, 17, 18] == res
  end

  test "encrypt binary" do
    res = encrypt("abcdez", 2)
    assert "cdefgb" == res
  end

  test "rot13 binary" do
    res = rot13("abcdez")
    assert "nopqrm" == res
  end
  
  test "rot13 any" do
    res = rot13(%{})
    assert %{} == res
  end

end
