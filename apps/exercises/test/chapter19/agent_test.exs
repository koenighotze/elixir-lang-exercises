defmodule Chapter19.AgentBasicsTest do
  use ExUnit.Case

  test "basic agent stuff" do
    {:ok, agent} = Agent.start(fn -> 0 end, name: CounterOnkel)

    assert 0 == Agent.get(agent, &(&1))
    assert 1 == Agent.get(agent, &(&1 + 1))
    assert 0 == Agent.get(agent, &(&1))

    Agent.update(agent, &(20 + &1) )

    assert 20 == Agent.get(agent, &(&1))

    assert 20 == Agent.get(agent, &(&1))
    assert 20 == Agent.get(CounterOnkel, &(&1))
    assert 20 == Agent.get(:"Elixir.CounterOnkel", &(&1))
  end
end
