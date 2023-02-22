defmodule SupervisorTest do
  use ExUnit.Case
  # doctest ElixirExercises.Supervisors.Supervisor
  alias ElixirExercises.Supervisors.Supervisor

  # setup do
  #   _name = {:via, Registry, {Registry.ElixirExercises, "supervisor"}}
  # end

  test "happy flow" do
    assert %{active: 1, specs: 1, supervisors: 0, workers: 1} ==
             Supervisor.count_supervisor_children()

    {:ok, _pid} = ElixirExercises.Supervisors.Supervisor.start_supervisor_child()

    assert %{active: 2, specs: 2, supervisors: 0, workers: 2} ==
             Supervisor.count_supervisor_children()

    assert {:error, :running} ==
             ElixirExercises.Supervisors.Supervisor.restart_supervisor_child(
               ElixirExercises.GenServers.CounterKanak
             )

    assert {:error, :running} ==
             ElixirExercises.Supervisors.Supervisor.delete_supervisor_child(
               ElixirExercises.GenServers.CounterKanak
             )

    :ok =
      ElixirExercises.Supervisors.Supervisor.terminate_supervisor_child(
        ElixirExercises.GenServers.CounterKanak
      )

    assert %{active: 1, specs: 2, supervisors: 0, workers: 2} ==
             Supervisor.count_supervisor_children()

    {:ok, _pid} =
      ElixirExercises.Supervisors.Supervisor.restart_supervisor_child(
        ElixirExercises.GenServers.CounterKanak
      )

    assert %{active: 2, specs: 2, supervisors: 0, workers: 2} ==
             Supervisor.count_supervisor_children()

    :ok =
      ElixirExercises.Supervisors.Supervisor.terminate_supervisor_child(
        ElixirExercises.GenServers.CounterKanak
      )

    :ok =
      ElixirExercises.Supervisors.Supervisor.delete_supervisor_child(
        ElixirExercises.GenServers.CounterKanak
      )

    assert %{active: 1, specs: 1, supervisors: 0, workers: 1} ==
             Supervisor.count_supervisor_children()

    {:error, :not_found} =
      ElixirExercises.Supervisors.Supervisor.restart_supervisor_child(
        ElixirExercises.GenServers.CounterKanak
      )

    {:error, :not_found} =
      ElixirExercises.Supervisors.Supervisor.delete_supervisor_child(
        ElixirExercises.GenServers.CounterKanak
      )
  end
end
