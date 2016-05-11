defmodule Chapter19.Anagram do

  @name {:global, __MODULE__}

  import Logger

  def prepare_node_1 do
    start_link
    load_word_list(1..2)
  end

  def prepare_node_2 do
    start_link
    load_word_list(3..4)
  end

  defp load_word_list(range) do
    range
    |> Enum.map(&"resources/words/list#{&1}")
    |> Chapter19.WordlistLoader.load_from_files
  end

  def bootstrap do
    start_link
    load_word_list(1..4)
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
