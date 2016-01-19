defmodule Chapter11.StringsAndBinaries do
  def contains_printable_chars_only([]), do: true

  def contains_printable_chars_only([h | t]) when h in ?\s..?~, do: contains_printable_chars_only(t)

  def contains_printable_chars_only(_), do: false

  def to_lower([]), do: []

  def to_lower([h | t]) when h <= 90, do: [h + 32] ++ to_lower(t)

  def to_lower([h | t]), do: [h] ++ to_lower(t)

  def anagram?([], []), do: true

  def anagram?(first, second), do: _anagram?(to_lower(first), to_lower(second))

  defp _anagram?(first, second) do
    Enum.sort(first) == Enum.sort(second)
  end


  def clean_exp(exp), do: Enum.filter(exp, fn(x) -> x in ~C{0123456789+-/*}  end)
  def caclulate(exp), do: caclulate(exp, 0)
  def caclulate([], value), do: value
  def caclulate([h | t], value) when h in ?0..?9, do: caclulate(t, value + h - ?0)
end
