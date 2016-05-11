defmodule Chapter11.PlaygroundTest do
  use ExUnit.Case

  import Chapter11.Playground, [:functions]


  test "interpolation" do
    val = "foo"
    assert "foo Foo" == "#{val} #{String.capitalize val}"
  end


  test "sigils" do
    # assert ['a', 'b', 'c'] == ~C{a b c}
    assert "Foo \#{1 + 2}" == ~S/Foo #{1 + 2}/

    assert "Foo 3" == ~s/Foo #{1 + 2}/

    assert [ "Foo", "Bar", "Baz" ] == ~W/Foo Bar Baz/
  end

  test "sigils can return atoms" do
    assert [:foo, :bar, :baz] == ~W/foo bar baz/a
  end

  test "single quotes - list" do
    assert is_list 'foo'

    assert [97, 98, 99, 100, 101, 102] == 'abcdef'
  end

  test "single quotes - apply pattern matching" do
    str = 'abcdef'

    [h | t] = str
    # ?a extracts the code of the character
    assert h == ?a
    assert t == 'bcdef'
  end



end
