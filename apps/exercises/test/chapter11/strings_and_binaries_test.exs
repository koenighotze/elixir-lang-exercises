defmodule Chapter11.StringsAndBinaries1Test do
  use ExUnit.Case, async: true

  import Chapter11.StringsAndBinaries, [:functions]

  test "ex1 - true" do
    assert contains_printable_chars_only('')
    assert contains_printable_chars_only('a')
    assert contains_printable_chars_only('   ')
    assert contains_printable_chars_only('asd!@#sa~ds a')
  end

  test "ex1 - false" do
    assert !contains_printable_chars_only('asd\t')
  end

  test "to lower empty" do
    assert to_lower('') == ''
  end

  test "to lower single" do
    assert to_lower('A') == 'a'
    assert to_lower('a') == 'a'
  end

  test "to lower case" do
    assert to_lower('ASsdZa') == 'assdza'
  end

  test "ex2 - anagram - true" do
    assert anagram?('Tokyo', 'Kyoto')

    assert anagram?('Phase', 'Saphe')

    assert !anagram?('Bratwurst', 'Tofu')

  end
end
