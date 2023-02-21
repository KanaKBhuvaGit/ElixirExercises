defmodule ElixirExercises.Agents.Counter do
  use Agent

  @name {:via, Registry, {ElixirExercises.Registry, "counter"}}
  @initial_value 0

  def start_link(_initial_value) do
    Agent.start_link(fn -> @initial_value end, name: @name)
  end

  def value do
    Agent.get(@name, & &1)
  end

  def increment do
    Agent.update(@name, &(&1 + 1))
  end
end
