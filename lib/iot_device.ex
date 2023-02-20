defmodule IotDevice do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    {:ok, %{data: %{}, subscription: []}}
  end

  def handle_call({:get_data, device_id}, _from, state) do
    {:reply, Map.get(state.data, device_id), state}
  end

  def handle_call({:update_data, device_id, new_data}, _from, state) do
    new_state = %{state | data: Map.put(state.data, device_id, new_data)}
    {:reply, :ok, new_state}
  end

  def handle_call({:subscribe, device_id}, _from, state) do
    new_state = %{state | subscription: [device_id | state.subscription]}
    {:reply, :ok, new_state}
  end

  def handle_call({:unsubscribe, device_id}, _from, state) do
    new_state = %{state | subscription: List.delete(state.subscription, device_id)}
    {:reply, :ok, new_state}
  end

  def handle_info({:publish_data, device_id, data}, state) do
    subscribers = state.subscription

    Enum.each(subscribers, fn subscriber ->
      if subscriber != device_id do
        GenServer.call(__MODULE__, {:get_data, subscriber})
        |> Map.put(device_id, data)
        |> GenServer.call(__MODULE__, {:update_data, subscriber})
      end
    end)

    {:noreply, state}
  end
end

# IotDevice.start_link([])

# GenServer.call(IotDevice, {:update_data, "device1", %{temperature: 25.0, humidity: 50.0}})

# GenServer.call(IotDevice, {:subscribe, "device2"})

# GenServer.cast(IotDevice, {:publish_data, "device1", %{temperature: 26.0, humidity: 55.0}})
