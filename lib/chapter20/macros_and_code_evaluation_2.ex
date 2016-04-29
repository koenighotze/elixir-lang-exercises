defmodule Chapter20.MacrosAndCodeEvaluation2 do
  defmacro times_n(n) do
    quote do
      def unquote(:"times_#{n}")(num) do
        unquote(n) * num
      end
    end
  end
end
