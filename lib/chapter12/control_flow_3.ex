defmodule Chapter12.ControlFlow3 do
  def ok!(arg) do
    case arg do
      {:ok, data} -> data
      _ -> raise "Cannot handle argument"
    end
  end
end
