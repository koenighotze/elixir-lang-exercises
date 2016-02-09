defmodule Issues.CLI do
  @default_count 4

  @moduledoc """
  Handle commandline
  """
  def run(argv) do
    argv
    |> parse_argv
    |> process
  end


  def process(:help) do
    IO.puts("Usage:...")
    System.halt(0)
  end

  def process({user, project, count}) do
    IO.puts("Should load #{count} issues from #{project} for user #{user}")
  end

  @doc """
  `argv` can be -h or --help ...
  """
  def parse_argv(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean ], aliases: [ h: :help])

    case parse do
      { [help: true], _, _ } -> :help
      {_, [user, project, count], _ } -> {user, project, String.to_integer(count)}
      {_, [user, project], _ } -> {user, project, @default_count}
      _ -> :help
    end
  end


end
