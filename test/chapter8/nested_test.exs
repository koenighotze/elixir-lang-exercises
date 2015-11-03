defmodule NestedTest do
  use ExUnit.Case

  alias Chapter8.Customer
  alias Chapter8.BugReport

  test "accessing nested structures" do
    cust = %Customer{ name: "David", company: "Senacor" }

    assert cust.name == "David"

    bugreport = %BugReport{ owner: cust }

    assert bugreport.owner.name == "David"
  end


  test "updating a nested struct" do
      bugreport = %BugReport{ owner: %Customer{ name: "David", company: "Senacor" } }

      bugreport = %{ bugreport | owner: %Customer{ name: "David", company: "Bugapallooza" } }

      assert bugreport.owner.company == "Bugapallooza"
  end

  test "updating using cool syntax" do
    bugreport = %BugReport{ owner: %Customer{ name: "David", company: "Senacor" } }

    bugreport = put_in(bugreport.owner.company, "Bugapallooza")

    assert bugreport.owner.company == "Bugapallooza"
  end

  test "applying a function" do
    bugreport = %BugReport{ owner: %Customer{ name: "David", company: "Senacor" }, severity: 1 }

    bugreport = update_in(bugreport.severity, &( &1 + 2  ))

    assert bugreport.severity == 3
  end
end
