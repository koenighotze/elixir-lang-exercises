defmodule Chapter11.StringsAndBinaries7Test do
  use ExUnit.Case

  import Chapter11.StringsAndBinaries7, [:functions]

  doctest Chapter11.StringsAndBinaries7

  test "line_to_record" do
    assert [ id: 123, ship_to: :NC, net_amount: 100.00 ] == line_to_record(["123", ":NC", "100.00"])
  end

  test "read tax file" do
    assert sales_tax_report([ NC: 0.075, TX: 0.08 ], "resources/Chapter11.StringsAndBinaries7.csv")
    ==
    [[id: 123, ship_to: :NC, net_amount: 100.0, total_amount: 107.5],
     [id: 124, ship_to: :OK, net_amount: 35.0, total_amount: 35.0],
     [id: 125, ship_to: :TX, net_amount: 24.0, total_amount: 25.92],
     [id: 126, ship_to: :TX, net_amount: 44.8, total_amount: 48.384],
     [id: 127, ship_to: :NC, net_amount: 25.0, total_amount: 26.875],
     [id: 128, ship_to: :MA, net_amount: 10.0, total_amount: 10.0],
     [id: 129, ship_to: :CA, net_amount: 102.0, total_amount: 102.0],
     [id: 120, ship_to: :NC, net_amount: 50.0, total_amount: 53.75]]
  end
end
