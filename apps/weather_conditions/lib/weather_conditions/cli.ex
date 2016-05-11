defmodule WeatherConditions.CLI do
  import WeatherConditions.Fetcher, [:functions]
  import WeatherConditions.Parser, [:functions]
  import WeatherConditions.Printer, [:functions]

  require Logger

  @doc """
  Fetches the weather data for an airport and prints it to STDOUT.

  E.g. weather_conditions KDLN fetches the data for Dillon Airport, MT
  """
  def main(argv) do
    Logger.info("Starting weather conditions app")

    argv
    |> parse_argv
    |> process
  end

  defp parse_and_print({:ok, weather_data}) do
    weather_data
    |> parse_data
    |> extract_observation
    |> generate_weather_data_table
    |> Enum.map(&IO.puts/1)
  end

  defp parse_and_print({:error, reason}) do
    IO.puts("Cannot process request. #{reason}")
  end

  defp process(:help) do
    IO.puts("Helpfull message")
  end

  defp process({}) do
    fetch_weather_data
    |> parse_and_print
  end

  defp process({stationid}) do
    stationid
    |> fetch_weather_data
    |> parse_and_print
  end

  defp parse_argv(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean ], aliases: [ h: :help])

    case parse do
      { [help: true], _, _ } -> :help
      {_, [ stationid ], _ } -> { stationid }
      {_, [], _ } -> {  }
    end
  end
end
