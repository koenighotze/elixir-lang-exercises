defmodule Elixir12.WithTest do

  def with_tryout(in_file) do
    with {:ok, content} <- File.read(in_file),
         fname          <- "#{:os.system_time}.tmp",
         :ok            <- File.write(fname, content),
         do: IO.puts("Result is in #{fname}")
  end

  def classic(in_file) do
    case File.read(in_file) do
      {:ok, content} ->
        fname = "#{:os.system_time}.tmp"
        case File.write(fname, content) do
          :ok -> IO.puts("Result is in #{fname}")
          {:error, reason} -> reason
        end
      {:error, reason} ->
        reason
    end
  end

end
