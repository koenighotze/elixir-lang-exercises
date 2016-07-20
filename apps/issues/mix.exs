defmodule Issues.Mixfile do
  use Mix.Project

  def project do
    [app: :issues,
     version: "0.0.1",
     elixir: "~> 1.1",
     escript: escript_options,
     name: "Elixir gitub Issues demo",
     source_url: "https://github.com/koenighotze/elixir-lang-issues-fetcher",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
    {:httpoison, "~> 0.9.0"},
    #{:jsx, "~> 2.8.0"},
    {:jsx, "~> 2.6.2"},
    {:ex_doc, "~> 0.12.0"},
    {:earmark, ">= 0.2.1"}
    ]
  end

  defp escript_options do
    [
      # should point to a module containing a main function
      main_module: Issues.CLI
    ]
  end
end
