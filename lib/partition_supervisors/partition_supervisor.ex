defmodule ElixirExercises.PartitionSupervisors.PartitionSupervisor do
  @name MyPartitionSupervisor

  def count_partitions() do
    PartitionSupervisor.partitions(@name)
  end

  def get_partition_supervisors() do
    PartitionSupervisor.which_children(@name)
  end

  def count_partition_supervisors(name) do
    PartitionSupervisor.count_children(name)
  end

  def stop_partition_supervisors(name) do
    PartitionSupervisor.stop(name)
  end
end
