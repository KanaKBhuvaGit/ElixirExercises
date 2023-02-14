defmodule TodosTest do
  use ExUnit.Case
  doctest Todos

  test "greets the world" do
    assert Todos.hello_world() == "Hello World"
  end
end
