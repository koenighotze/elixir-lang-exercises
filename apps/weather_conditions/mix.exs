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
     source_url: "https://github.com/koenighotze/elixir-lang-weather-conditions",
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
      {:httpoison, "~> 0.8"},
      {:ex_doc, "~> 0.11.4"},
      {:earmark, ">= 0.0.0"},
      {:erlsom, "~> 1.2"}
    ]
  end

  def escript_options do
    [main_module: WeatherConditions.CLI]
  end
end
