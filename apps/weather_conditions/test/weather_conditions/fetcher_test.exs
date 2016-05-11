defmodule WeatherConditions.FetcherTest do
  use ExUnit.Case
  import WeatherConditions.Fetcher, [:functions]

  doctest WeatherConditions.Fetcher

  test "The data is read from a local file" do
    {:ok, data} = fetch_weather_data
    assert String.length(data) != 0
  end
end
