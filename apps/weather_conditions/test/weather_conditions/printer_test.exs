defmodule WeatherConditions.PrinterRealTest do
  use ExUnit.Case, async: true

  import WeatherConditions.Printer

  test "generate header" do
    header = Testdata.observation_event |> generate_header

    assert "Observation for: Dillon, Dillon Airport, MT" == header
  end

  test "generate_station_info" do
    expected = "Report for KDLN (Lat 45.2575, Long -112.55444)"
    res = Testdata.observation_event |> generate_station_info

    assert res == expected
  end

  test "generate_weather_info" do
    expected = "Weather: Overcast, Temperature: 0.0 degrees celsius, Wind: South at 6.9 MPH (6 KT)"
    res = Testdata.observation_event |> generate_weather_info

    assert res == expected
  end

  test "generate_observation_meta_data" do
    expected = "Last Updated on Feb 25 2016, 12:53 am MST"
    res = Testdata.observation_event |> generate_observation_meta_data

    assert res == expected
  end

  test "generate report" do
    res = Testdata.observation_event |> generate_weather_data_table

    assert 3 == length(res)

  end

end
