defmodule WeatherConditions.ParserTest do
  use ExUnit.Case, async: true

  import WeatherConditions.Parser, [ :function ]

  test "parsing an empty string returns an empty map" do
    assert %{} == parse_data("")
  end

  test "parse xml returns a map" do
    xml = ~s"""
    <?xml version="1.0" ?>
    <foo>
      <bar baz="1"/>
    </foo>
    """

    parsed = parse_data(xml)

    baz = { 'baz', '1' }
    bar = { 'bar', [ baz ], []  }
    foo = { 'foo', [], [ bar ] }

    expected = foo
    assert expected == parsed
  end

  test "extract elem" do
    extracted = Testdata.current_observation |>  extract_observation |> extract_elem('location')

    assert {'location', [], ['Dillon, Dillon Airport, MT']} == extracted
  end

  test "extract observation" do
    list = Testdata.current_observation |> extract_observation

    assert Enum.member?(list, {'longitude', [], ['-112.55444']})
    assert Enum.member?(list, {'icon_url_base', [], ['http://forecast.weather.gov/images/wtf/small/']})
  end

  test "extract value" do
    extracted = Testdata.current_observation |>  extract_observation |> extract_value('location')

    assert [ "Dillon, Dillon Airport, MT" ] == extracted
  end

end
