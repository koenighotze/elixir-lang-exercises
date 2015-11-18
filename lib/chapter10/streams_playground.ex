defmodule Chapter10.Streams do
  def read_file do
    "/etc/hosts"
    |> File.read!
    |> String.split
    |> Enum.max_by(&String.length/1)
    |> IO.puts
  end

end
