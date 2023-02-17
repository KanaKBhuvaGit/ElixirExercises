defmodule Exercises.Mode do
  def mode(list) do
    gb = Enum.group_by(list, & &1)
    max = Enum.map(gb, fn {_, val} -> length(val) end) |> Enum.max()
    for {key, val} <- gb, length(val) == max, do: key
  end

  def test do
    lists = [
      [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8, 9, 9, 9],
      [1, 2, "qwe", "asd", 1, 2, "qwe", "asd", 2, "qwe"]
    ]

    Enum.each(lists, fn list ->
      IO.puts("mode: #{inspect(list)}")
      IO.puts("   => #{inspect(mode(list))}")
    end)
  end
end
