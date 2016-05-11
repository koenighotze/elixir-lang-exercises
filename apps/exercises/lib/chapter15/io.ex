defmodule Chapter15.IO do

  def connect_and_print(string \\ "foo") do
    true = Node.connect(:"two@172.17.0.3")

    Node.list
    |> Enum.each(&( IO.puts("Connected to node #{inspect &1}") ))

    :global.sync # needed for getting the name of the group leader right away

    out = :global.whereis_name(:out_on_two)
    IO.puts "Group leader is at #{inspect out}"

    IO.puts(:global.whereis_name(:out_on_two), string)
  end

  def register_io do
    :yes = :global.register_name(:out_on_two, :erlang.group_leader)

    IO.puts("Registerd group leader at #{inspect :global.whereis_name(:out_on_two)}")
  end
end
