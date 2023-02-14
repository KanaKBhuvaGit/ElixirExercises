defmodule Exercises.ExerciseTwo do
  # alias Combination

  def calculate do
    # combination(3, [8, 5, 3, 9, 6, 4])
    # combination(3, [2, 5, 12, 3, 6])
    list =
      Combinations.of([8, 5, 3, 9, 6, 4], 3)
      |> Enum.map(fn x -> List.to_tuple(Enum.sort(x)) end)
      |> Enum.filter(fn x -> pythagoras?(x) end)
      |> Enum.filter(fn x -> sum2?(x) end)

    {:ok, list}
  end

  def calculate_per do
    list =
      Permutations.of([8, 5, 3, 9, 6, 4])
      |> Enum.map(fn x -> List.to_tuple(x) end)

    {:ok, list}
  end

  def sum2?({a, b, c}) do
    cond do
      a * 10 + 2 + (b * 10 + 2) !== c * 10 + 2 -> true
      true -> false
    end
  end

  def pythagoras?({a, b, c}) do
    cond do
      a * a + b * b == c * c ->
        true

      true ->
        false
    end
  end
end
