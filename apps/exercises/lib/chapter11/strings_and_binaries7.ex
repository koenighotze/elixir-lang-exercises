defmodule Chapter11.StringsAndBinaries7 do
  import Enum, only: [ filter: 2, drop: 2, map: 2 ]
  import String, only: [ to_atom: 1, to_float: 1, to_integer: 1, split: 2  ]
  import Chapter10.ListAndRecursion8, only: [ apply_tax: 2 ]


  @doc """
    Parses a list of data and returns a keyword list

    iex> Chapter11.StringsAndBinaries7.line_to_record(["123", ":NC", "100.00"])
    [id: 123, ship_to: :NC, net_amount: 100.00]
  """
  def line_to_record([id, ship, amount]) do
    [ id: to_integer(id), ship_to: to_atom(String.replace(ship, ":", "")), net_amount: to_float(amount) ]
  end

  @doc """
    Parses a bruttodata and returns the contents as a list of records

    iex> Chapter11.StringsAndBinaries7.parse_brutto_data([ "123,:NC,100.00", "124,:OK,35.00" ])
    [
      [id: 123, ship_to: :NC, net_amount: 100.00],
      [id: 124, ship_to: :OK, net_amount: 35.00]
    ]
  """
  def parse_brutto_data(data) do
    data
    |> filter( &( &1 != "" ))
    |> map( &( split(&1, ",") ) )
    |> map( &( line_to_record(&1) ) )
  end

  @doc """
    Parses a file and returns the contents as a list of records
  """
  def parse_file(filename) do
    File.read!(filename)
    |> split("\n")
    |> drop(1)
    |> parse_brutto_data
  end

  def sales_tax_report(tax_rates, filename) do
    apply_tax(tax_rates, parse_file(filename))
  end

end
