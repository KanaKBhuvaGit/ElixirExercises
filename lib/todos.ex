defmodule Todos do
  def hello_world do
    "Hello World"
  end

  def todos do
    ["eat apple", "read book", "Elixir series", "Exercise"]
  end

  def contains?(tasks, task) do
    Enum.member?(tasks, task)
  end

def random_task(tasks) do
  [task] = Enum.take_random(tasks, 1)
  task
end
end
