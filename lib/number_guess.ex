defmodule NumberGuess do

  def guess(actual, low..up) when actual == low + div(up - low, 2) do
    IO.puts "Found it: #{actual}"
  end

  def guess(actual, low..up) when actual > low + div(up - low, 2) do
    current = low + div(up - low, 2)
    IO.puts "...it is larger than #{current} ...looking in #{current}..#{up} "
    guess(actual, current..up)
  end

  def guess(actual, low..up) when actual < low + div(up - low, 2) do
    current = low + div(up - low, 2)

    IO.puts "...it is smaller than #{current} ...looking in #{low}..#{current} "
    guess(actual, low..current)
  end

end
