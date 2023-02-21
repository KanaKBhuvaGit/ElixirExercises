defmodule Agents.AgentSessions do
  use Agent, restart: :transient
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

  # Agents are a simple abstraction around state.

  # Often in Elixir there is a need to share or store state that must be accessed from different processes or by the same process at different points in time.

  # The Agent module provides a basic server implementation that allows state to be retrieved and updated via a simple API.
  # def child_spec(arg) do
  #   %{
  #     id: Agents.SessionAgent,
  #     start: {Agents.SessionAgent, :start_link, [arg]}
  #   }
  # end

  def start_user_session(sessions, opts) do
    Agent.start(fn -> sessions end, opts)
  end

  def start_linked_user_session(sessions, opts) do
    Agent.start_link(fn -> sessions end, opts)
  end

  def add_data_in_session(sessions, user_id, data) do
    Agent.cast(sessions, &Map.put(&1, user_id, data))
  end

  def get_user_session(sessions, user_id) do
    Agent.get(sessions, &Map.get(&1, user_id, %{user_id => %{error: "Session doesn't exist"}}))
  end

  def update_user_session(sessions, user_id, data) do
    Agent.update(
      sessions,
      fn all_session ->
        case Map.has_key?(all_session, user_id) do
          true -> Map.update!(all_session, user_id, fn _ -> data end)
          false -> all_session
        end
      end
    )
  end

  def get_and_update_user_session(sessions, user_id, data) do
    Agent.get_and_update(
      sessions,
      fn all_session ->
        case Map.has_key?(all_session, user_id) do
          true -> {all_session, Map.update!(all_session, user_id, fn _ -> data end)}
          false -> {all_session, all_session}
        end
      end
    )
  end

  def get_all_sessions(sessions) do
    Agent.get(sessions, & &1)
  end

  def delete_user_session(sessions, key) do
    Agent.update(sessions, &Map.delete(&1, key))
  end

  def delete_multiple_session(sessions, keys) do
    Agent.update(sessions, &Map.drop(&1, keys))
  end

  def delete_all_session(sessions) do
    Agent.update(sessions, &Map.drop(&1, Map.keys(&1)))
  end

  def terminate_all_sessions(sessions) do
    Agent.stop(sessions, {:shutdown, "Session agent stopped intensionally"})
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

  def get_user_session_module(sessions, value) do
    Agent.get(sessions, UserSession, :get_module_task, [value])
  end

  def cast_user_session_module(sessions, value) do
    Agent.cast(sessions, UserSession, :cast_module_task, [value])
  end

  def get_and_update_user_session_module(sessions, value) do
    Agent.get_and_update(sessions, UserSession, :get_and_update_module_task, [value])
  end

  def update_user_session_module(sessions, value) do
    Agent.update(sessions, UserSession, :update_module_task, [value])
  end
end

# {:ok, sessions} = Agents.AgentSessions.start_user_session(%{}, name: :sessions)
# Agents.AgentSessions.add_data_in_session(sessions, 1, %{:name => "Kanak"})
# Agents.AgentSessions.add_data_in_session(sessions, 2, %{:name => "Ketan"})
# user_sessions = Agents.AgentSessions.get_user_session(sessions, 1)
# Agents.AgentSessions.add_data_in_session(sessions, 1, %{:age => 23})
# all_sessions = Agents.AgentSessions.get_all_sessions(sessions)
# Agents.AgentSessions.add_data_in_session(sessions, 2, %{:name => "Ketan", :age => 30})
# Agents.AgentSessions.update_user_session(sessions, 4, %{:name => "Kanak", :age => 30})
# all_sessions = Agents.AgentSessions.get_all_sessions(sessions)
# updated_sessions = Agents.AgentSessions.get_and_update_user_session(sessions, 4, %{:name => "Karan", :age => 35})
# updated_sessions = Agents.AgentSessions.get_and_update_user_session(sessions, 2, %{:name => "Karan", :age => 35})
# all_sessions = Agents.AgentSessions.get_all_sessions(sessions)
