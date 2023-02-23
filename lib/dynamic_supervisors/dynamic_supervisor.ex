defmodule ElixirExercises.DynamicSupervisors.DynamicSupervisor do
  use DynamicSupervisor, restart: :temporary

  @name {:via, Registry, {Registry.ElixirExercises, "dsupervisor"}}

  def start_link(init_arg) do
    # DynamicSupervisor.start_link(__MODULE__, init_arg, name: @name)
    DynamicSupervisor.start_link(__MODULE__, init_arg)
  end

  @impl true
  def init(_init_arg) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def child_spec() do
    %{
      id: ElixirExercises.DynamicSupervisors.DynamicSupervisor.Counter,
      start: {ElixirExercises.GenServers.Counter, :start_link, [0]}
    }
  end

  def start_counter_as_child() do
    DynamicSupervisor.start_child(@name, child_spec())
  end

  def start_counter_as_child2() do
    DynamicSupervisor.start_child(
      {:via, PartitionSupervisor, {MyPartitionSupervisor, self()}},
      child_spec()
    )
  end

  def terminate_counter_as_child(pid) do
    DynamicSupervisor.terminate_child(
      @name,
      pid
    )
  end

  def count_dynamic_supervisors() do
    DynamicSupervisor.count_children(@name)
  end

  def get_dynamic_supervisors() do
    DynamicSupervisor.which_children(@name)
  end

  def stop_dynamic_supervisor() do
    DynamicSupervisor.stop(@name)
  end
end
