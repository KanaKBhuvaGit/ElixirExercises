defmodule ElixirExercises.GenServers.SessionManager do
  use GenServer

  # Public API

  def start_link() do
    GenServer.start_link(__MODULE__, %{})
  end

  def get(session_id) do
    GenServer.call(__MODULE__, {:get, session_id})
  end

  def put(session_id, session_data) do
    GenServer.call(__MODULE__, {:put, session_id, session_data})
  end

  # GenServer callbacks

  def init(state) do
    {:ok, state}
  end

  def handle_call({:get, session_id}, _from, state) do
    session = Map.get(state, session_id, %{})
    {:reply, session, state}
  end

  def handle_call({:put, session_id, session_data}, _from, state) do
    updated_state = Map.put(state, session_id, session_data)
    {:reply, :ok, updated_state}
  end
end

# {:ok, pid} = SessionManager.start_link()
# SessionManager.put("session_id", %{user_id: 123})
# session_data = SessionManager.get("session_id")
