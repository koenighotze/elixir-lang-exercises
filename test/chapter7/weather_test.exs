defmodule WeatherTest do
  use ExUnit.Case

  import Weather, [:functions]

  test "for_a_location" do
    assert [["2015-10-12 17:23:11,323", 5, 12, 0.87]] == for_location(5)
  end

  test "for_location_mult_results" do
    exp = [["2015-10-12 1:58:11,323", 4, 5, 0.9802],
     ["2015-10-21 5:21:34,323", 4, 5, 0.238]]

    assert exp == for_location(4)
  end

end
