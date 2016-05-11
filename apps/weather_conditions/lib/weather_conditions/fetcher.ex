defmodule WeatherConditions.Fetcher do
  require Logger

  @url_pattern "http://w1.weather.gov/xml/current_obs/<AIRPORT>.xml"
  @default_file Application.get_env(:weather_conditions, :data_url)
  @timeout_millis Application.get_env(:weather_conditions, :http_timeout)
  @user_agent [ { "User-agent", "Elixir foo@bar.com" }]
  @http_ok 200


  def fetch_weather_data do
    Logger.info("Fetching data from #{@default_file}")
    {:ok, @default_file |> File.stream! |> Enum.join }
  end

  def fetch_weather_data(stationid) do
    url = @url_pattern |> String.replace("<AIRPORT>", stationid)
    Logger.info("Fetching data from #{url}")
    url
    |> HTTPoison.get(@user_agent, [timeout: @timeout_millis])
    |> handle_response
  end

  defp handle_response({:ok, %HTTPoison.Response{ status_code: @http_ok, body: body }}) do
    Logger.info("Received response with status #{@http_ok}.")
    {:ok, body }
  end

  defp handle_response({:ok , %HTTPoison.Response{ status_code: status, body: _ }}) do
    Logger.warn( fn -> "Received nok status #{status} ...cannot handle response"  end )
    {:error, status }
  end

  defp handle_response({:error, error}) do
    Logger.error(fn -> "Received error " <> inspect(error) end)
    {:error, error.reason}
  end
end
