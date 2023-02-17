defmodule Exercises.Median do
  def median([]), do: nil

  def median(list) do
    len = length(list)
    sorted = Enum.sort(list)
    mid = div(len, 2)

    if rem(len, 2) == 0,
      do: (Enum.at(sorted, mid - 1) + Enum.at(sorted, mid)) / 2,
      else: Enum.at(sorted, mid)
  end

  def test do
    median = fn list -> IO.puts("#{inspect(list)} => #{inspect(median(list))}") end
    median.([])

    Enum.each(1..6, fn i ->
      for(_ <- 1..i, do: :rand.uniform(6)) |> median.()
    end)
  end
end
