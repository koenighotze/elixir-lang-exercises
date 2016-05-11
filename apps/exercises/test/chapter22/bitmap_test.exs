defmodule Chapter22.BitmapTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "map behaviour" do
    nine = %Chapter22.Bitmap{value: 9}

    assert 1 == nine[0]
    assert 0 == nine[1]
    assert 0 == nine[2]
    assert 1 == nine[3]
  end

  test "enum count" do
    nine = %Chapter22.Bitmap{value: 9}

    assert 4 == Enum.count(nine)
  end

  test "enum member" do
    nine = %Chapter22.Bitmap{value: 9}

    assert Enum.member?(nine, 3)
  end

  test "enum reduce" do
    nine = %Chapter22.Bitmap{value: 9}

    assert 2 == Enum.reduce(nine, 0, fn x, acc -> x + acc end )
  end

  test "using bitmap" do
    fifty = %Chapter22.Bitmap{value: 50}

    assert "0110010" == "#{fifty}"
  end

  test "inspect small number" do
    nine = %Chapter22.Bitmap{value: 9}

    out = capture_io fn ->
      IO.inspect nine
    end

    assert out == "Bitmap of 9 is 1001\n"
  end

end
