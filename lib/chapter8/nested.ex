  defmodule Chapter8. Customer do
    defstruct name: "", company: ""
  end

  defmodule Chapter8.BugReport do
    defstruct owner: %Chapter8.Customer{}, details: "", severity: 1
  end
