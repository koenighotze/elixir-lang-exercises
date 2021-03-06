defmodule ElixirLangWeatherConditions.Mixfile do
  use Mix.Project

  def project do
    [app: :weather_conditions,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     escript: escript_options,
     name: "Elixir Weather Data Application",
     source_url: "https://github.com/koenighotze/elixir-lang-exercises",
     deps: deps,
     build_path: "../../_build"]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.9.0"},
      # {:ex_doc, "~> 0.12.0"},
      {:erlsom, "~> 1.2"},
      {:credo, "~> 0.4", only: [:dev, :test]}
    ]
  end

  def escript_options do
    [main_module: WeatherConditions.CLI]
  end
end
