defmodule Chapter23.MoreCoolStuff3Test do
  use ExUnit.Case

  import Chapter23.MoreCoolStuff3

  test "extract header" do
    csv = extract_header("Item, Qty, Price")
    l = ~w(Item Qty Price)
    assert csv == l
  end

  test "construct_line" do
    res = construct_line(~w(Teddy 4 34.95), ~w(Item Qty Price))

    assert res == [Item: "Teddy", Qty: 4, Price: 34.95]
  end

  test "more cool stuff - 3 - single" do
    csv = ~v"""
    Item, Qty, Price
    Teddy bear, 4, 34.95
    """

    assert csv == [
      [Item: "Teddy bear", Qty: 4, Price: 34.95]
    ]
  end

  test "more cool stuff - 3" do
    csv = ~v"""
    Item, Qty, Price
    Teddy bear, 4, 34.95
    Milk, 1, 2.99
    Battery, 6, 8.00
    """

    assert csv == [
      [Item: "Teddy bear", Qty: 4, Price: 34.95],
      [Item: "Milk", Qty: 1, Price: 2.99],
      [Item: "Battery", Qty: 6, Price: 8.00]
    ]
  end

end
