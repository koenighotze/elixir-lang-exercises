defmodule Chapter19.AnagramTest do
  use ExUnit.Case

  import Chapter19.Anagram


  test "each original word is contained in the anagram list" do
    start_link

    words = ~w{foo bar baz}

    words
    |> add_words

    anagrams =
    words
    |> Enum.map(fn word -> {word, anagrams_of(word)} end)

    all_found =
    words
    |> Enum.map(
      fn word ->
        {^word, perms} = List.keyfind(anagrams, word, 0)

        Enum.member?(perms, word)
      end
    )

    assert Enum.all?(all_found)
  end

  test "add anagram" do
    start_link

    words = ~w{bar rab bra}

    words
    |> add_words

    result = anagrams_of("bar")

    data =
    result
    |> Enum.reject(&( Enum.member?(words, &1) ))

    assert Enum.empty?(data)
  end

end
