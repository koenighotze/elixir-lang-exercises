defmodule CliTest do
  use ExUnit.Case
  import Issues.CLI, only: [ parse_argv: 1 ]

  test "parsing -h" do
    assert :help == parse_argv( ["-h"] )
    assert :help == parse_argv( ["--help"] )
  end

  test "three params" do
    assert {"user", "project", 10} == parse_argv([ "user", "project", "10" ])
  end

  test "using default" do
    assert {"user", "project", 4} == parse_argv([ "user", "project" ])
  end
end
