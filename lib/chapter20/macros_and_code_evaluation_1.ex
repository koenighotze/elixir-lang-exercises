defmodule Chapter20.MacrosAndCodeEvaluation1 do
  defmacro myunless(condition, clauses) do
    do_block = Keyword.get(clauses, :do, nil)
    else_block = Keyword.get(clauses, :else, nil)

    quote do
      case unquote(condition) do
        true -> unquote(else_block)
        v when v in [nil, false] -> unquote(do_block)
      end
    end
  end

end
