defmodule Chapter20.FinalMyIf do

  defmacro myif(condition, clauses) do
    do_clause = Keyword.get(clauses, :do, nil)
    else_clause = Keyword.get(clauses, :else, nil)

    quote do
      case unquote(condition) do
        false -> unquote(else_clause)
        nil -> unquote(else_clause)
        _ -> unquote(do_clause)
      end
    end
  end

end
