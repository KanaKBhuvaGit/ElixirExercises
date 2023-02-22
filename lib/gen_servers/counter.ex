defmodule ElixirExercises.GenServers.Counter do
  use GenServer

  # @name {:via, Registry, {Registry.ElixirExercises, "counter"}}

  def start_link(arg) when is_integer(arg) do
    # GenServer.start_link(__MODULE__, arg, name: @name)
    GenServer.start_link(__MODULE__, arg)
  end

  ## Callbacks

  @impl true
  def init(counter) do
    {:ok, counter}
  end

  @impl true
  def handle_call(:get, _from, counter) do
    {:reply, counter, counter}
  end

  def handle_call({:bump, value}, _from, counter) do
    {:reply, counter, counter + value}
  end
end
