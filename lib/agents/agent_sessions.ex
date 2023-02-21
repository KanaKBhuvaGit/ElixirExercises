defmodule ElixirExercises.Agents.AgentSessions do
  use Agent
  # use Agent, restart: :transient
  # :id, :start, :restart, : shutdown, :type, :modules
  # Default values
  # :id -> Agents.SessionAgent {any}
  # :start -> {Agents.SessionAgent, :start_link, [args]}
  # :restart -> :permanent {:permanent, :temporary, :transient}
  # :shutdown -> {:worker => 5_000} or {:supervisor => :infinity}
  # :type -> :worker {:worker, :supervisor}
  # :modules -> a list of modules used by hot code upgrade mechanisms to determine which processes are using certain modules.
  # It is typically set to the callback module of behaviours like GenServer, Supervisor, and such.
  # It is set automatically based on the :start value and it is rarely changed in practice.
  alias ElixirExercises.Agents.UserSession
  # @name :sessions
  @name {:via, Registry, {ElixirExercises.Registry, "sessions"}}
  # Agents are a simple abstraction around state.

  # Often in Elixir there is a need to share or store state that must be accessed from different processes or by the same process at different points in time.

  # The Agent module provides a basic server implementation that allows state to be retrieved and updated via a simple API.
  def child_spec(_arg) do
    %{
      id: ElixirExercises.Agents.AgentSessions,
      start: {ElixirExercises.Agents.AgentSessions, :start_linked_user_session, []}
    }
  end

  # Default when child_spec/1 not defined
  # def start_link() do
  #   opts = Keyword.put([], :name, @name)
  #   sessions = %{}
  #   Agent.start_link(fn -> sessions end, opts)
  # end

  def start_user_session() do
    opts = Keyword.put([], :name, @name)
    sessions = %{}
    Agent.start(fn -> sessions end, opts)
  end

  def start_linked_user_session() do
    # {sessions, opts} = Keyword.pop(opts, :initial_value, %{})
    opts = Keyword.put([], :name, @name)
    sessions = %{}
    Agent.start_link(fn -> sessions end, opts)
  end

  def add_data_in_session(user_id, data) do
    Agent.cast(@name, &Map.put(&1, user_id, data))
  end

  def get_user_session(user_id) do
    Agent.get(@name, &Map.get(&1, user_id, %{user_id => %{error: "Session doesn't exist"}}))
  end

  def update_user_session(user_id, data) do
    Agent.update(
      @name,
      fn all_session ->
        case Map.has_key?(all_session, user_id) do
          true -> Map.update!(all_session, user_id, fn _ -> data end)
          false -> all_session
        end
      end
    )
  end

  def get_and_update_user_session(user_id, data) do
    Agent.get_and_update(
      @name,
      fn all_session ->
        case Map.has_key?(all_session, user_id) do
          true -> {all_session, Map.update!(all_session, user_id, fn _ -> data end)}
          false -> {all_session, all_session}
        end
      end
    )
  end

  def get_all_sessions() do
    Agent.get(@name, & &1)
  end

  def delete_user_session(key) do
    Agent.update(@name, &Map.delete(&1, key))
  end

  def delete_multiple_session(keys) do
    Agent.update(@name, &Map.drop(&1, keys))
  end

  def delete_all_session() do
    Agent.update(@name, &Map.drop(&1, Map.keys(&1)))
  end

  def terminate_all_sessions() do
    Agent.stop(@name, {:shutdown, "Session agent stopped intensionally"})
    # Agent.stop(sessions, :shutdown)
    # Agent.stop(sessions, :normal)
    # Agent.stop(sessions)
  end

  ##################################################### Module base call ##################################################

  def start_user_session_module(value) do
    Agent.start(UserSession, :test_module_task, [value])
  end

  def start_linked_user_session_module(value) do
    Agent.start_link(UserSession, :test_module_task, [value])
  end

  def get_user_session_module(value) do
    Agent.get(@name, UserSession, :get_module_task, [value])
  end

  def cast_user_session_module(value) do
    Agent.cast(@name, UserSession, :cast_module_task, [value])
  end

  def get_and_update_user_session_module(value) do
    Agent.get_and_update(@name, UserSession, :get_and_update_module_task, [value])
  end

  def update_user_session_module(value) do
    Agent.update(@name, UserSession, :update_module_task, [value])
  end
end

# {:ok, sessions} = ElixirExercises.Agents.AgentSessions.start_user_session(%{}, name: :sessions)
# ElixirExercises.Agents.AgentSessions.add_data_in_session(sessions, 1, %{:name => "Kanak"})
# ElixirExercises.Agents.AgentSessions.add_data_in_session(sessions, 2, %{:name => "Ketan"})
# user_sessions = ElixirExercises.Agents.AgentSessions.get_user_session(sessions, 1)
# ElixirExercises.Agents.AgentSessions.add_data_in_session(sessions, 1, %{:age => 23})
# all_sessions = ElixirExercises.Agents.AgentSessions.get_all_sessions(sessions)
# ElixirExercises.Agents.AgentSessions.add_data_in_session(sessions, 2, %{:name => "Ketan", :age => 30})
# ElixirExercises.Agents.AgentSessions.update_user_session(sessions, 4, %{:name => "Kanak", :age => 30})
# all_sessions = ElixirExercises.Agents.AgentSessions.get_all_sessions(sessions)
# updated_sessions = ElixirExercises.Agents.AgentSessions.get_and_update_user_session(sessions, 4, %{:name => "Karan", :age => 35})
# updated_sessions = ElixirExercises.Agents.AgentSessions.get_and_update_user_session(sessions, 2, %{:name => "Karan", :age => 35})
# all_sessions = ElixirExercises.Agents.AgentSessions.get_all_sessions(sessions)
