defmodule Chapter19.Anagram do

  @name {:global, __MODULE__}

  import Logger

  def bootstrap do
    start_link
    1..4
    |> Enum.map(&"resources/words/list#{&1}")
    |> Chapter19.WordlistLoader.load_from_files
  end

  def start_link do
    Agent.start_link(fn -> %{} end, name: @name)
  end

  def add_words(words) do
    debug("Adding #{inspect words}")
    Agent.update(@name, &_add_words(&1, words))
  end

  def anagrams_of(word) do
    # &1 refers to the state of the agent
    Agent.get(@name, &Map.get(&1, _signature(word)))
  end

  ###
  defp _add_words(original, words) do
    debug "Merging #{inspect original} and #{inspect words}"

    Enum.reduce(words, original, fn word, map ->
      debug "Reducing over #{word}, map is #{inspect map}"
      Map.update(map, _signature(word), [word], fn value -> [word | value] end)
    end )
  end

  defp _signature(word) do
    word |> to_char_list |> Enum.sort |> to_string
  end
end
