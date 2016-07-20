defmodule Chapter19.AnagramTest do
  use ExUnit.Case, async: true

  import Chapter19.Anagram

  import Enum, only: [ map: 2, member?: 2, all?: 1, empty?: 1, reject: 2]


  test "each original word is contained in the anagram list" do
    start_link

    words = ~w{foo bar baz}

    words
    |> add_words

    anagrams =
    words
    |> map(fn word -> {word, anagrams_of(word)} end)

    all_found =
    words
    |> map(
      fn word ->
        {^word, perms} = List.keyfind(anagrams, word, 0)

        member?(perms, word)
      end
    )

    assert all?(all_found)
  end

  test "add anagram" do
    start_link

    words = ~w{bar rab bra}

    words
    |> add_words

    result = anagrams_of("bar")

    data =
    result
    |> reject(&( member?(words, &1) ))

    assert empty?(data)
  end


  test "end to end" do
    bootstrap

    anagrams = anagrams_of("recta")

    assert 1 < length(anagrams)
  end
end
