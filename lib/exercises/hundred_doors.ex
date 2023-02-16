defmodule Exercises.HundredDoors do
  def doors(n \\ 100) do
    List.duplicate(false, n)
  end

  def toggle(doors, n) do
    List.update_at(doors, n, &(!&1))
  end

  def toggle_every(doors, n) do
    Enum.reduce(Enum.take_every((n - 1)..99, n), doors, fn n, acc -> toggle(acc, n) end)
  end

  def unoptimized do
    final_state = Enum.reduce(1..100, doors(), fn n, acc -> toggle_every(acc, n) end)

    open_doors =
      Enum.with_index(final_state)
      |> Enum.filter(fn {x, _} -> x end)
      |> Enum.map(fn {_, index} -> index + 1 end)

    open_doors
  end

  def optimized do
    final_state = Enum.reduce(1..100, doors(), fn n, acc -> toggle_every(acc, n * n - 1) end)

    open_doors =
      Enum.with_index(final_state)
      |> Enum.filter(fn {x, _} -> x end)
      |> Enum.map(fn {_, index} -> index + 1 end)

    open_doors
  end
end
