defmodule ElixirExercises.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # ElixirExercises.Agents.AgentSessions,
      {Registry, keys: :unique, name: Registry.ElixirExercises},
      # partitions: System.schedulers_online()
      # ElixirExercises.Agents.Counter
      # ElixirExercises.Supervisors.Supervisor
      # {DynamicSupervisor, name: ElixirExercises.DynamicSupervisor}
      # ElixirExercises.DynamicSupervisors.DynamicSupervisor
      {PartitionSupervisor,
       child_spec: ElixirExercises.DynamicSupervisors.DynamicSupervisor,
       name: MyPartitionSupervisor,
       partitions: 3}
    ]

    opts = [strategy: :one_for_one, name: ElixirExercises.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
