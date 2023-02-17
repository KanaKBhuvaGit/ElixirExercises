defmodule Exercises.BalancedBrackets do
  def is_balanced(brackets), do: is_balanced_loop(String.codepoints(brackets), 0)

  defp is_balanced_loop(_, n) when n < 0, do: false
  defp is_balanced_loop([], 0), do: true
  defp is_balanced_loop([], _n), do: false
  defp is_balanced_loop(["[" | t], n), do: is_balanced_loop(t, n + 1)
  defp is_balanced_loop(["]" | t], n), do: is_balanced_loop(t, n - 1)

  def generate(0), do: "[]"

  def generate(n) do
    list = for _ <- 1..(2 * n), do: Enum.random(["[", "]"])
    List.to_string(list)
  end

  def task do
    list =
      Enum.map(0..5, fn n ->
        brackets = generate(n)
        result = is_balanced(brackets)

        case result do
          true -> {:ok, brackets, "Balanced"}
          false -> {:ok, brackets, "Not Balanced"}
        end
      end)

    list
  end
end
