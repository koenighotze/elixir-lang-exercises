defmodule Chapter14.WorkingWithProcesses9 do

  def run(dir, word) do
    files = File.ls! dir

    files
    |> Enum.map( &( dir <> &1  )  )
    |> Enum.filter( &( !File.dir?(&1) )  )
    |> Enum.map( fn(file) -> spawn(Chapter14.WorkingWithProcesses9, :parse_file, [ self, file, word ]) end )
    |> gather_responses([])
  end

  def gather_responses([], number_of_matches_per_file), do: number_of_matches_per_file

  def gather_responses(procs, number_of_matches_per_file) do
    receive do
      {:result, pid, file, num} ->
        gather_responses(List.delete(procs, pid), [{file, num} | number_of_matches_per_file])
    end
  end

  def parse_file(requester, file, word) do
    case File.read file do
      {:ok, contents} -> send requester, {:result, self, file, grep(contents, word) }
      {:error, reason} ->
        IO.puts("Cannot read #{file}: #{reason}")
        send requester, {:result, self, file, 0 }
    end

    exit(:normal)
  end

  def grep(data, token) do
    length(Regex.scan(~r/#{token}/, data))
  end
end
