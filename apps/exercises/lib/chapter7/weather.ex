defmodule Weather do
  def weather_data do
    [
      # time id temp rain
      ["2015-10-26 19:23:12,323", 2, 15, 0.2312],
      ["2015-10-27 19:14:33,323", 3, 7, 0.2],
      ["2015-10-12 1:58:11,323", 4, 5, 0.9802],
      ["2015-10-21 5:21:34,323", 4, 5, 0.238],
      ["2015-10-12 17:23:11,323", 5, 12, 0.87],
      ["2015-10-11 19:23:16,323", 6, 7, 0.76],
      ["2015-10-11 18:23:34,323", 6, 23, 0.3523],
    ]
  end

  defp for_location(_p, []), do: []

  defp for_location(p, [ head = [_, p, _, _] | rest ] ) do
    [
      head
      | for_location(p, rest)
    ]
  end

  defp for_location(p, [ [_, _, _,_] | rest ] ), do: for_location(p, rest)

  def for_location(loc) do
    for_location(loc, weather_data)
  end
end
