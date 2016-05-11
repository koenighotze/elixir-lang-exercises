defmodule Chapter19.WordlistLoader do
  import Chapter19.Anagram

  def load_from_files(file_names) do
    IO.puts("Should load from #{inspect file_names}")

    file_names
    |> Stream.map(fn fname -> Task.async(fn -> load(fname) end) end)
    |> Enum.map(fn task -> Task.await(task) end)
  end

  defp load(file) do
    IO.puts "Loading from #{file}"

    File.stream!(file, [], :line)
    |> Enum.map(&String.strip/1)
    |> add_words
  end

end
