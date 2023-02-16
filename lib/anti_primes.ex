defmodule AntiPrimes do
  # The first 20 anti-primes are [1,2,4,6,12,24,36,48,60,120,180,240,360,720,840,1260,1680,2520,5040,7560]
  def divcount(n) when is_integer(n), do: divcount(n, 1, 0)

  def divcount(n, d, count) when d * d > n, do: count

  def divcount(n, d, count) do
    divs =
      case rem(n, d) do
        0 ->
          case n - d * d do
            0 -> 1
            _ -> 2
          end

        _ ->
          0
      end

    divcount(n, d + 1, count + divs)
  end

  def antiprimes(n), do: antiprimes(n, 1, 0, [])

  def antiprimes(0, _, _, l), do: Enum.reverse(l)

  def antiprimes(n, m, max, l) do
    count = divcount(m)

    case count > max do
      true -> antiprimes(n - 1, m + 1, count, [m | l])
      false -> antiprimes(n, m + 1, max, l)
    end
  end

  def main() do
    :io.format("The first 20 anti-primes are ~w~n", [antiprimes(20)])
  end
end
