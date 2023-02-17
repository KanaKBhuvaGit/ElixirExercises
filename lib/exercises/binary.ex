defmodule Exercises.Binary do
  def task do
    IO.puts(Integer.to_string(5, 2))

    5 |> Integer.to_string(2) |> IO.puts()

    [5, 50, 9000] |> Enum.each(fn n -> IO.puts(Integer.to_string(n, 2)) end)

    Enum.map([5, 50, 9000], fn n -> IO.puts(Integer.to_string(n, 2)) end)

    for n <- [5, 50, 9000] do
      IO.puts(Integer.to_string(n, 2))
    end
  end
end
