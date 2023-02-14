defmodule Permutations do
  def of(list), do: of(list, length(list))

  def of([], _), do: [[]]
  def of(_, 0), do: [[]]

  def of(list, i) do
    for x <- list, y <- of(list, i - 1), do: [x | y]
  end
end
