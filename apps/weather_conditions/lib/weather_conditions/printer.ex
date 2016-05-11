defmodule WeatherConditions.Printer do
  require Logger

  import WeatherConditions.Parser, only: [ extract_elem: 2, extract_value: 2 ]

  def generate_header(observation) do
    {'location', _, [location]} = observation |> extract_elem('location')

    "Observation for: #{location}"
  end

  defp extract_values(observation, list_of_elems) do
    list_of_elems
    |> Enum.map( &( observation |> extract_value(&1) ) )
  end

  def generate_station_info(observation) do
    [latitude, longitude, station_id]
      = observation |> extract_values(['latitude', 'longitude', 'station_id'])

    "Report for #{station_id} (Lat #{latitude}, Long #{longitude})"
  end

  def generate_weather_info(observation) do
    [weather, temp, wind]
      = observation |> extract_values(['weather', 'temp_c', 'wind_string'])
     "Weather: #{weather}, Temperature: #{temp} degrees celsius, Wind: #{wind}"

  end

  def generate_observation_meta_data(observation) do
      [ res ] = observation |> extract_values(['observation_time'])
      "#{res}"
  end

  def generate_weather_data_table(observation) do
    [&generate_header/1, &generate_station_info/1, &generate_weather_info/1]
    |> Enum.map(fn fun -> fun.(observation) end)
  end

  def print_weather_data_table(data_table) do
    IO.puts("TABLE")
  end
end
