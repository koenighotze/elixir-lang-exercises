defmodule Chapter10.ListAndRecursion8 do
  def apply_tax([], orders) do
    orders
  end

  def apply_tax(_tax_rates, []) do
    []
  end

  def apply_tax(tax_rates, orders) do
    for order <- orders,
        tax = 1.0 + Keyword.get(tax_rates, order[:ship_to], 0),
        total = order[:net_amount] * tax,
        rounded = Float.round(total, 3), do:
        order ++ [ total_amount: rounded ]
  end
end
