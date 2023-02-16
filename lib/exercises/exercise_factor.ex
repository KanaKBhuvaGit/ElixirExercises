defmodule Exercises.ExerciseFactor do
  def test() do
    Enum.each([45, 53, 60, 64], fn n ->
      IO.puts("#{n}: #{inspect(Factor.factor(n))}")
    end)

    IO.puts("\nRange: #{inspect(range = 1..10000)}")
    funs = [factor: &Factor.factor/1, divisor: &Factor.divisor/1]

    Enum.each(funs, fn {name, fun} ->
      {time, value} = :timer.tc(fn -> Enum.count(range, &(length(fun.(&1)) == 2)) end)
      IO.puts("#{name}\t prime count : #{value},\t#{time / 1_000_000} sec")
    end)

    Enum.filter(1..100, &(length(Factor.divisor(&1)) == 2))
  end
end
