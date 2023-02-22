defmodule ElixirExercises.GenServers.Server do
  use GenServer
  alias ElixirExercises.GenServers.Store

  def start do
    GenServer.start(__MODULE__, nil)
  end

  def init(_) do
    {:ok, Store.new()}
  end

  def put(pid, key, value) do
    GenServer.cast(pid, {:put, key, value})
  end

  def get(pid, key) do
    GenServer.call(pid, {:get, key})
  end

  def del(pid, key) do
    GenServer.cast(pid, {:del, key})
  end

  def handle_call({:get, key}, _, state) do
    {:reply, Store.get(state, key), state}
  end

  def handle_cast({:put, key, value}, state) do
    {:noreply, Store.put(state, key, value)}
  end

  def handle_cast({:del, key}, state) do
    {:noreply, Store.del(state, key)}
  end
end
