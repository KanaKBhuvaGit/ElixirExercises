defmodule ElixirExercises.Agents.UserSession do
  def test_module_task(arg) do
    arg
  end

  def cast_module_task(state, arg) do
    state + arg
  end

  def get_module_task(state, arg) do
    state * arg
  end

  def get_and_update_module_task(state, arg) do
    {state, state + arg + arg}
  end

  def update_module_task(state, arg) do
    state - arg
  end
end
