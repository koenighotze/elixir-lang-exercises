defmodule ElixirLangExercises.Mixfile do
  use Mix.Project

  def project do
    [apps_path: "apps",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     test_coverage: [tool: ExCoveralls]]

  end

  defp deps do
    [{:excoveralls, "~> 0.5", only: :test},
     {:credo, "~> 0.4", only: [:dev, :test]}]
  end
end
