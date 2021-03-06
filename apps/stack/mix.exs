defmodule Sequence.Mixfile do
  use Mix.Project

  def project do
    [app: :stack,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     build_path: "../../_build",
     config_path: "../../config/config.exs"]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger],

     mod: {Stack, []},

     env: [
       initial_stack: [1, 2, 3, 4, 5, 6, 7]
     ],

     registered: [ :HotzenplotzStack ]
   ]
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
    [{:credo, "~> 0.4", only: [:dev, :test]}]
  end
end
