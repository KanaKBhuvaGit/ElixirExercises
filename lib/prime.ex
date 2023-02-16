defmodule Prime do
  # Recursive (faster version);
  # def prime(n), do: prime(n, 1, []) |> Enum.sort()

  # defp prime(n, i, factors) when n < i * i, do: factors
  # defp prime(n, i, factors) when n == i * i, do: [i | factors]

  # defp divisor(n, i, factors) when rem(n, i) == 0, do: divisor(n, i + 1, [i, div(n, i) | factors])
  # defp prime(n, i, factors), do: prime(n, i + 1, factors)
end
