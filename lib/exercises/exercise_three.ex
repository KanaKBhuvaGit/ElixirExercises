defmodule Exercises.ExerciseThree do
  @list [{2, 1}, {0, 2}, {0, 1}, {5, 5}]
  def analyze_range(k) do
    list = Enum.map(@list, fn x -> distance(x) < k end)
    list
  end

  def distance({x, y}) do
    :math.sqrt(x * x + y * y)
  end

  def symmetric_difference(list1, list2) do
    mapset1 = list1 |> MapSet.new()
    mapset2 = list2 |> MapSet.new()

    resultmapset =
      MapSet.difference(MapSet.union(mapset1, mapset2), MapSet.intersection(mapset1, mapset2))

    resultmapset |> Enum.to_list()
  end

  # Create a routine that both encodes and decodes two strings. An interview can use the following strings for input and output:
  #   Input: abbcccddddeeeeeffffff
  # Output:a1b2c3d4e4f6

  def compress(str) when is_binary(str) do
    do_compress(str, {<<>>, nil, 0})
  end

  defp do_compress(<<>>, {acc, _previous, 0}), do: acc

  defp do_compress(<<>>, {acc, previous, count}),
    do: acc <> <<previous::utf8>> <> to_string(count + 1)

  defp do_compress(<<c::utf8, rest::binary>>, {acc, previous, count})
       when c == previous,
       do: do_compress(rest, {acc, previous, count + 1})

  defp do_compress(<<c::utf8, rest::binary>>, {acc, _previous, 0}),
    do: do_compress(rest, {acc <> <<c::utf8>>, c, 0})

  defp do_compress(<<c::utf8, rest::binary>>, {acc, _previous, count}),
    do: do_compress(rest, {acc <> to_string(count + 1), c, 0})

  def encode(input) do
    encoded_string =
      input
      |> String.graphemes()
      |> Enum.chunk_by(& &1)
      |> Enum.map_join(fn
        [char] -> [char, "1"]
        [char | _] = chars -> [char, length(chars) |> to_string()]
      end)

    decode(encoded_string)
  end

  def decode(input) do
    decoded_string =
      input
      |> String.codepoints()

    decoded_string
  end
end
