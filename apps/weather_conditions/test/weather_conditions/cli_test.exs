defmodule WeatherConditions.CLITest do
  use ExUnit.Case, async: true

  import ExUnit.CaptureIO

  test "calling main without args fetches the localdata" do
    output = capture_io fn ->
      WeatherConditions.CLI.main([])
    end

    assert String.contains?(output, "Dillon, Dillon Airport, MT")
  end

end
