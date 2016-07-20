defmodule Chapter11.StringsAndBinaries6Test do
  use ExUnit.Case, async: true

  import Chapter11.StringsAndBinaries6, [:functions]

  test "empty" do
    assert capitalize_sentence("") == ""
  end

  test "start of string" do
    assert capitalize_sentence("a. ") == "A. "
  end

  test "captitalize sentence" do
    assert capitalize_sentence("oh. a DOG. woof. ") == "Oh. A dog. Woof. "
  end

  test "captitalize unicodisch sentence" do
    assert capitalize_sentence("Гьввд. съг фСх. ШдВВ. ") == "Гьввд. Съг фсх. Шдвв. "
  end
end
