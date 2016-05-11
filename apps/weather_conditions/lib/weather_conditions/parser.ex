defmodule WeatherConditions.Parser do
  require Logger

  def parse_data("") do
    %{}
  end

  def parse_data(xml) do
    {:ok, data, _} = :erlsom.simple_form(xml)
    data
  end

  def extract_observation({'current_observation', _, observation}) do
    observation
    # |> Enum.map( &Tuple.to_list/1  )
    # |> Enum.map( fn [h | t] -> [List.to_atom(h) | t]  end  )
  end

  def extract_elem(observation, elem) do
      {found, _ } = List.keytake(observation, elem, 0)
      found
  end

  def extract_value(observation, elem) do
    {  { ^elem, _, data }, _ } = List.keytake(observation, elem, 0)
    data |> Enum.map( &List.to_string/1 )
  end
end
