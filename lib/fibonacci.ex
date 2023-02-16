defmodule Fibonacci do
  # n	Series Values
  # 2	fibonacci	1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 ...
  # 3	tribonacci	1 1 2 4 7 13 24 44 81 149 274 504 927 1705 3136 ...
  # 4	tetranacci	1 1 2 4 8 15 29 56 108 208 401 773 1490 2872 5536 ...
  # 5	pentanacci	1 1 2 4 8 16 31 61 120 236 464 912 1793 3525 6930 ...
  # 6	hexanacci	1 1 2 4 8 16 32 63 125 248 492 976 1936 3840 7617 ...
  # 7	heptanacci	1 1 2 4 8 16 32 64 127 253 504 1004 2000 3984 7936 ...
  # 8	octonacci	1 1 2 4 8 16 32 64 128 255 509 1016 2028 4048 8080 ...
  # 9	nonanacci	1 1 2 4 8 16 32 64 128 256 511 1021 2040 4076 8144 ...
  # 10	decanacci	1 1 2 4 8 16 32 64 128 256 512 1023 2045 4088 8172 ...

  # Fibonacci n-step number sequences
  def anynacci(start_sequence, count) do
    n = length(start_sequence)
    anynacci(Enum.reverse(start_sequence), count - n, n)
  end

  defp anynacci(seq, 0, _), do: Enum.reverse(seq)

  defp anynacci(seq, count, n) do
    next = Enum.sum(Enum.take(seq, n))
    anynacci([next | seq], count - 1, n)
  end

  # Fibonacci sequence
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do: fib(0, 1, n - 2)

  defp fib(_prevprev, prev, -1), do: prev

  defp fib(prevprev, prev, n) do
    next = prevprev + prev
    fib(prev, next, n - 1)
  end

  def fib_stream() do
    Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
  end
end
