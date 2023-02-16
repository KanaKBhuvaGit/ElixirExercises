defmodule Exercises.ExerciseFibonacci do
  def test do
    IO.inspect(Enum.map(0..10, fn i -> Fibonacci.fib(i) end))

    IO.inspect(Fibonacci.fib_stream() |> Enum.take(10))

    IO.inspect(Fibonacci.anynacci([1, 1], 15))

    naccis = [
      lucus: [2, 1],
      fibonacci: [1, 1],
      tribonacci: [1, 1, 2],
      tetranacci: [1, 1, 2, 4],
      pentanacci: [1, 1, 2, 4, 8],
      hexanacci: [1, 1, 2, 4, 8, 16],
      heptanacci: [1, 1, 2, 4, 8, 16, 32],
      octonacci: [1, 1, 2, 4, 8, 16, 32, 64],
      nonanacci: [1, 1, 2, 4, 8, 16, 32, 64, 128],
      decanacci: [1, 1, 2, 4, 8, 16, 32, 64, 128, 256]
    ]

    Enum.each(naccis, fn {name, list} ->
      :io.format("~11s: ", [name])
      IO.inspect(Fibonacci.anynacci(list, 15))
    end)
  end
end
