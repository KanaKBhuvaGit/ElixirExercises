defmodule Factor do
  def factor(1), do: [1]

  def factor(n) do
    for(i <- 1..div(n, 2), rem(n, i) == 0, do: i) ++ [n]
  end

  # Recursive (faster version);
  def divisor(n), do: divisor(n, 1, []) |> Enum.sort()

  defp divisor(n, i, factors) when n < i * i, do: factors
  defp divisor(n, i, factors) when n == i * i, do: [i | factors]
  defp divisor(n, i, factors) when rem(n, i) == 0, do: divisor(n, i + 1, [i, div(n, i) | factors])
  defp divisor(n, i, factors), do: divisor(n, i + 1, factors)
end
