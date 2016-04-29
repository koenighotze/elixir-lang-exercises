defmodule Chapter20.MyIf do

  def myif(condition, clauses) do
    do_clause = Keyword.get(clauses, :do, nil)
    else_clause = Keyword.get(clauses, :else, nil)

    case condition do
      false -> else_clause
      nil -> else_clause
      _ -> do_clause
    end
  end

end
