defmodule Chapter10.ListAndRecursion8Test do
  use ExUnit.Case, async: true
  import Chapter10.ListAndRecursion8, [ :functions ]


  test "apply tax to empty order" do
    res = apply_tax( [] , [] )

    assert res == []
  end

  test "apply empty tax to single order" do
    tax_rates = [ ]

    orders = [
      [ id: 123, ship_to: :NC, net_amount: 100.00 ]
    ]

    res = apply_tax( tax_rates, orders )

    assert res == orders
  end

  test "apply matching tax to simple order" do
    tax_rates = [ NC: 0.1 ]

    orders = [
      [ id: 123, ship_to: :NC, net_amount: 100.00 ],
      [ id: 123, ship_to: :OK, net_amount: 100.00 ]
    ]

    res = apply_tax( tax_rates, orders )

    assert res == [
      [ id: 123, ship_to: :NC, net_amount: 100.00, total_amount: 110.00 ],
      [ id: 123, ship_to: :OK, net_amount: 100.00, total_amount: 100.00 ]
    ]
  end


  test "case from exercise" do
    tax_rates = [ NC: 0.075, TX: 0.08 ]

    orders = [
      [ id: 123, ship_to: :NC, net_amount: 100.00 ],
      [ id: 124, ship_to: :OK, net_amount: 35.00 ],
      [ id: 125, ship_to: :TX, net_amount: 24.00 ],
      [ id: 126, ship_to: :TX, net_amount: 44.80 ],
      [ id: 127, ship_to: :NC, net_amount: 25.00 ],
      [ id: 128, ship_to: :MA, net_amount: 10.00 ],
      [ id: 129, ship_to: :CA, net_amount: 102.00 ],
      [ id: 120, ship_to: :NC, net_amount: 50.00 ]
    ]

    expected = [
      [ id: 123, ship_to: :NC, net_amount: 100.00, total_amount: 100.00 * 1.075 ],
      [ id: 124, ship_to: :OK, net_amount: 35.00, total_amount: 35.00 ],
      [ id: 125, ship_to: :TX, net_amount: 24.00, total_amount: 24.00 * 1.08 ],
      [ id: 126, ship_to: :TX, net_amount: 44.80, total_amount: 44.80 * 1.08 ],
      [ id: 127, ship_to: :NC, net_amount: 25.00, total_amount: 25.00  * 1.075 ],
      [ id: 128, ship_to: :MA, net_amount: 10.00, total_amount: 10.00 ],
      [ id: 129, ship_to: :CA, net_amount: 102.00, total_amount: 102.00 ],
      [ id: 120, ship_to: :NC, net_amount: 50.00, total_amount: 50.00 * 1.075 ]
    ]

    assert expected == apply_tax( tax_rates, orders )
  end
end
