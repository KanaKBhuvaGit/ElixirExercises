defmodule Exercises.ExerciseTwo do
  # alias Combination

  def calculate do
    list =
      Combinations.of([8, 5, 3, 9, 6, 4, 10], 3)
      |> Enum.map(fn x -> List.to_tuple(Enum.sort(x)) end)
      |> Enum.filter(fn x -> pythagoras?(x) end)
      |> Enum.map(fn x -> as(x) end)

    {:ok, list}
  end

  def as({a, b, c}) do
    "#{a * 10 + 2} + #{b * 10 + 2} == #{c * 10 + 2}"
  end

  def pythagoras?({a, b, c}) do
    cond do
      a * a + b * b == c * c ->
        true

      true ->
        false
    end
  end

  # def calculate_per do
  #   list =
  #     Permutations.of([8, 5, 3, 9, 6, 4, 10])
  #     |> Enum.map(fn x -> List.to_tuple(x) end)

  #   {:ok, list}
  # end

  # def sum2?({a, b, c}) do
  #   cond do
  #     a * 10 + 2 + (b * 10 + 2) !== c * 10 + 2 -> true
  #     true -> false
  #   end
  # end
end
