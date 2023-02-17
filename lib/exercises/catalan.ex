defmodule Exercises.Catalan do
  def cat(n), do: div(factorial(2 * n), factorial(n + 1) * factorial(n))

  defp factorial(n), do: fac1(n, 1)

  defp fac1(0, acc), do: acc
  defp fac1(n, acc), do: fac1(n - 1, n * acc)

  def cat_r1(0), do: 1
  def cat_r1(n), do: Enum.sum(for i <- 0..(n - 1), do: cat_r1(i) * cat_r1(n - 1 - i))

  def cat_r2(0), do: 1
  def cat_r2(n), do: div(cat_r2(n - 1) * 2 * (2 * n - 1), n + 1)

  def task do
    range = 0..14
    :io.format("Directly:~n~p~n", [for(n <- range, do: cat(n))])
    :io.format("1st recusive method:~n~p~n", [for(n <- range, do: cat_r1(n))])
    :io.format("2nd recusive method:~n~p~n", [for(n <- range, do: cat_r2(n))])
  end

  def numbers(num) do
    {result, _} =
      Enum.reduce(1..num, {[], {0, 1}}, fn i, {list, t0} ->
        t1 = numbers(i, t0)
        t2 = numbers(i + 1, Tuple.insert_at(t1, i + 1, elem(t1, i)))
        {[elem(t2, i + 1) - elem(t2, i) | list], t2}
      end)

    Enum.reverse(result)
  end

  defp numbers(0, t), do: t
  defp numbers(n, t), do: numbers(n - 1, put_elem(t, n, elem(t, n - 1) + elem(t, n)))

  def task2 do
    IO.inspect(numbers(15))
  end
end
