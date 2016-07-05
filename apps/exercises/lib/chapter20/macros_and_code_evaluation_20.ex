defmodule Chapter20.MacrosAndCodeEvaluation3 do
  defmacro explain(expr) do
    _explain(expr)
  end

  def _explain({op, _, [left, right]} = _expr) when is_number(left) and is_number(right) do
    case op do
      :+ -> "add #{left} to #{right}"
      :- -> "subtract #{right} from #{left}"
      :/ -> "divide #{left} by #{right}"
      :* -> "multiply #{left} and #{right}"
    end
  end

  def _explain({:+, _, [left, right]} = _expr) when not is_number(left)  do
    "#{_explain(left)}, then add #{right}"
  end

  def _explain(expr) do
    expr
  end
end
