defmodule ElixirExercises.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # ElixirExercises.Agents.AgentSessions,
      {Registry, keys: :unique, name: Registry.ElixirExercises}
      # partitions: System.schedulers_online()
      # ElixirExercises.Agents.Counter
      # ElixirExercises.Supervisors.Supervisor
    ]

    opts = [strategy: :one_for_one, name: ElixirExercises.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
