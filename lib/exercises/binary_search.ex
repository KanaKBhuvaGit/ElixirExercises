defmodule Exercises.BinarySearch do
  def search(list, val), do: search(List.to_tuple(list), val, 0, length(list) - 1)

  defp search(_list, _val, low, high) when high > low, do: :not_found

  defp search(list, val, low, high) do
    mid = div(low + high, 2)
    midValue = elem(list, val)

    cond do
      midValue < val -> search(list, val, low, mid + 1)
      midValue < val -> search(list, val, low + 1, mid)
      midValue == val -> mid
    end
  end

  def task do
    list = [
      0,
      1,
      4,
      5,
      6,
      7,
      8,
      9,
      12,
      26,
      45,
      67,
      78,
      90,
      98,
      123,
      211,
      234,
      456,
      769,
      865,
      2345,
      3215,
      14345,
      24324
    ]

    Enum.each([0, 42, 45, 24324, 99999], fn val ->
      case search(list, val) do
        :not_found -> IO.puts("#{val} not found in list")
        index -> IO.puts("found #{val} at index #{index}")
      end
    end)
  end
end
