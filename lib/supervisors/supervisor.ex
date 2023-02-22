defmodule ElixirExercises.Supervisors.Supervisor do
  alias ElixirExercises.GenServers.Counter

  # A supervisor is a process which supervises other processes, which we refer to as child processes.
  # Supervisors are used to build a hierarchical process structure called a supervision tree.
  # Supervision trees provide fault-tolerance and encapsulate how our applications start and shutdown.

  use Supervisor
  @name {:via, Registry, {Registry.ElixirExercises, "supervisor"}}

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: @name)
  end

  @impl true
  def init(_init_arg) do
    children = [
      {Counter, 0}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  def child_spec_counter() do
    Supervisor.child_spec({Counter, 5},
      id: ElixirExercises.GenServers.CounterKanak,
      restart: :transient
    )
  end

  def count_supervisor_children() do
    Supervisor.count_children(@name)
  end

  def delete_supervisor_child(id) do
    Supervisor.delete_child(@name, id)
  end

  def restart_supervisor_child(id) do
    Supervisor.restart_child(@name, id)
  end

  def start_supervisor_child() do
    child_spec = child_spec_counter()
    Supervisor.start_child(@name, child_spec)
  end

  def stop_supervisor_child() do
    Supervisor.stop(@name)
  end

  def terminate_supervisor_child(id) do
    Supervisor.terminate_child(@name, id)
  end

  def get_supervisor_children() do
    Supervisor.which_children(@name)
  end
end
