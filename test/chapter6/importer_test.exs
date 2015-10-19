defmodule ImporterTest do
  use ExUnit.Case

  import TopLevel.Importer, [:functions]

  test "the methods can be imported" do
    useTheImport
  end

  test "aliasing works" do
    alias TopLevel.Inner3, as: Blafasel

    Blafasel.baz
  end

  test "accessing attrs" do
    v =  @TopLevel.Attrs.val
    assert 3 == v
  end
end
