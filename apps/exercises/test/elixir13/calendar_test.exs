defmodule Elixir13.CalendarTest do
  use ExUnit.Case, async: true

  describe "When using the Date and Time sigils" do
    test "the date sigil creates a date struct" do
      date = ~D[2016-09-08]

      assert  [2016, 9, 8] == [date.year, date.month, date.day]
    end

    test "the time sigil creates a time struct" do
      time = ~T[08:09:10]

      assert [8, 9, 10] == [time.hour, time.minute, time.second]
    end
  end
end
