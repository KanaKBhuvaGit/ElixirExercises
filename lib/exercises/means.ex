defmodule Exercises.Means do
  def arithmetic(list) do
    Enum.sum(list) / length(list)
  end

  def geometric(list) do
    :math.pow(Enum.reduce(list, &*/2), 1 / length(list))
  end

  def harmonic(list) do
    1 / arithmetic(Enum.map(list, &(1 / &1)))
  end

  def root_mean_square(list) do
    rms = :math.sqrt(Enum.map(list, fn x -> x * x end) |> Enum.sum() |> div(Enum.count(list)))
    rms
  end

  def test do
    list = Enum.to_list(1..10)
    IO.puts("Arithmetic mean: #{am = arithmetic(list)}")
    IO.puts("Geometric mean:  #{gm = geometric(list)}")
    IO.puts("Harmonic mean:   #{hm = harmonic(list)}")
    IO.puts("(#{am} >= #{gm} >= #{hm}) is #{am >= gm and gm >= hm}")
  end
end
