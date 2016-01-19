defmodule Chapter11.CalculatorTest do
  use ExUnit.Case

  import Chapter11.Calculator, [:functions]

  test "calculate - simple" do
    assert calculate('7') == 7
    assert calculate('213') == 213
  end

  test "cleanup" do
    assert clean_exp('123%^#$*/') == '123*/'
  end

  test "calculate - parse" do
    assert calculate('3+') == 3
  end

  test "calculate - simple add" do
    assert calculate('3+7') == 10
  end

  test "calculate - simple minus" do
    assert calculate('3-7') == -4
  end

  test "calculate - simple multi" do
    assert calculate('3 * 7') == 21
  end

  test "calculate - simple div" do
    assert calculate('21 / 3') == 7
  end

  test "calculate" do
    assert calculate('123 + 27') == 150
  end
end
