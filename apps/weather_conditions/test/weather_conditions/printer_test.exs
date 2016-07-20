defmodule WeatherConditions.PrinterRealTest do
  use ExUnit.Case, async: true

  import WeatherConditions.Printer

  defp data do
 [{'credit', [], ['NOAA\'s National Weather Service']},
  {'credit_URL', [], ['http://weather.gov/']},
  {'image', [],
   [{'url', [], ['http://weather.gov/images/xml_logo.gif']},
    {'title', [], ['NOAA\'s National Weather Service']},
    {'link', [], ['http://weather.gov']}]},
  {'suggested_pickup', [], ['15 minutes after the hour']},
  {'suggested_pickup_period', [], ['60']},
  {'location', [], ['Dillon, Dillon Airport, MT']},
  {'station_id', [], ['KDLN']},
  {'latitude', [], ['45.2575']},
  {'longitude', [], ['-112.55444']},
  {'observation_time', [], ['Last Updated on Feb 25 2016, 12:53 am MST']},
  {'observation_time_rfc822', [], ['Thu, 25 Feb 2016 00:53:00 -0700']},
  {'weather', [], ['Overcast']},
  {'temperature_string', [], ['32.0 F (0.0 C)']},
  {'temp_f', [], ['32.0']},
  {'temp_c', [], ['0.0']},
  {'relative_humidity', [], ['52']},
  {'wind_string', [], ['South at 6.9 MPH (6 KT)']},
  {'wind_dir', [], ['South']},
  {'wind_degrees', [], ['180']}, {'wind_mph', [], ['6.9']},
  {'wind_kt', [], ['6']}, {'pressure_string', [], ['1025.0 mb']},
  {'pressure_mb', [], ['1025.0']}, {'pressure_in', [], ['30.23']},
  {'dewpoint_string', [], ['16.0 F (-8.9 C)']}, {'dewpoint_f', [], ['16.0']},
  {'dewpoint_c', [], ['-8.9']}, {'windchill_string', [], ['26 F (-3 C)']},
  {'windchill_f', [], ['26']}, {'windchill_c', [], ['-3']},
  {'visibility_mi', [], ['10.00']},
  {'icon_url_base', [], ['http://forecast.weather.gov/images/wtf/small/']},
  {'two_day_history_url', [],
   ['http://www.weather.gov/data/obhistory/KDLN.html']},
  {'icon_url_name', [], ['novc.png']},
  {'ob_url', [], ['http://www.weather.gov/data/METAR/KDLN.1.txt']},
  {'disclaimer_url', [], ['http://weather.gov/disclaimer.html']},
  {'copyright_url', [], ['http://weather.gov/disclaimer.html']},
  {'privacy_policy_url', [], ['http://weather.gov/notice.html']}]
  end


  test "generate header" do
    header = data |> generate_header

    assert "Observation for: Dillon, Dillon Airport, MT" == header
  end

  test "generate_station_info" do
    expected = "Report for KDLN (Lat 45.2575, Long -112.55444)"
    res = data |> generate_station_info

    assert res == expected
  end

  test "generate_weather_info" do
    expected = "Weather: Overcast, Temperature: 0.0 degrees celsius, Wind: South at 6.9 MPH (6 KT)"
    res = data |> generate_weather_info

    assert res == expected
  end

  test "generate_observation_meta_data" do
    expected = "Last Updated on Feb 25 2016, 12:53 am MST"
    res = data |> generate_observation_meta_data

    assert res == expected
  end

  test "generate report" do
    res = data |> generate_weather_data_table

    assert 3 == length(res)
    
  end

end