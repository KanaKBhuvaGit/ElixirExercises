defmodule Exercises.AmicablePairs do
  def a_pair?(num1, num2) do
    Enum.sum(Exercises.AdpClassification.divisors(num1)) == num2 and
      Enum.sum(Exercises.AdpClassification.divisors(num2)) == num1
  end

  def a_pairs_20000() do
    map =
      Map.new(1..20000, fn n -> {n, Exercises.AdpClassification.divisors(n) |> Enum.sum()} end)

    Enum.filter(map, fn {n, sum} -> map[sum] == n and n < sum end)
    |> Enum.sort()
    |> Enum.each(fn {i, j} -> IO.puts("#{i} and #{j}") end)
  end
end
