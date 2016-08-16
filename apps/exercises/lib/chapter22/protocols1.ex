defprotocol Chapter22.Protocols1 do
  @fallback_to_any true
  def encrypt(stringlike, shift)
  def rot13(stringlike)
end

defimpl Chapter22.Protocols1, for: [List] do
  def encrypt(list, shift) do
    list
    |> Enum.map(fn e -> e + shift end)
  end

  def rot13(list), do: encrypt(list, 13)
end

defimpl Chapter22.Protocols1, for: [BitString] do
  def encrypt(s, shift) do
    s |> to_char_list |> Enum.map(fn c ->
      case c + shift do
        val when val > 122 -> rem(val, 122) + 96
        val -> val
      end
    end) |> to_string
  end

  def rot13(s), do: encrypt(s, 13)
end

defimpl Chapter22.Protocols1, for: [Any] do
  def encrypt(s, _shift) do
    s
  end

  def rot13(s), do: encrypt(s, 13)
end
