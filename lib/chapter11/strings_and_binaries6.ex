defmodule Chapter11.StringsAndBinaries6 do
  import String, only: [  upcase: 1, downcase: 1]
  import Regex, only: [replace: 3]

  # works only for ascii :(
  def capitalize_sentence(sentence) do
    replace(~r/(\. \w)/u,
          replace(~r/^(\w)/u, downcase(sentence), &( upcase(&1) ) ),
          &( upcase(&1) ))

  end
end
