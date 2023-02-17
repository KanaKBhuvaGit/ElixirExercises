defmodule Exercises.CompassBox do
  defp head do
    Enum.chunk_every(~w(north east south west), 2, 1, :discard)
    |> Enum.flat_map(fn [a, b] ->
      c = if a == "north" or a == "south", do: "#{a}#{b}", else: "#{b}#{a}"

      [
        a,
        "#{a} by #{b}",
        "#{a}-#{c}",
        "#{c} by #{a}",
        c,
        "#{c} by #{b}",
        "#{b}-#{c}",
        "#{b} by #{a}"
      ]
    end)
    |> Enum.with_index()
    |> Enum.map(fn {s, i} -> {i + 1, String.capitalize(s)} end)
    |> Map.new()
  end

  def compass do
    header = head()
    angles = Enum.map(0..32, fn i -> i * 11.25 + elem({0, 5.62, -5.62}, rem(i, 3)) end)

    Enum.each(angles, fn degrees ->
      index = rem(round(32 * degrees / 360), 32) + 1
      :io.format("~2w  ~-20s ~6.2f~n", [index, header[index], degrees])
    end)
  end
end

#  1  North                  0.00
#  2  North by east         16.87
#  3  North-northeast       16.88
#  4  Northeast by north    33.75
#  5  Northeast             50.62
#  6  Northeast by east     50.63
#  7  East-northeast        67.50
#  8  East by north         84.37
#  9  East                  84.38
# 10  East by south        101.25
# 11  East-southeast       118.12
# 12  Southeast by east    118.13
# 13  Southeast            135.00
# 14  Southeast by south   151.87
# 15  South-southeast      151.88
# 16  South by east        168.75
# 17  South                185.62
# 18  South by west        185.63
# 19  South-southwest      202.50
# 20  Southwest by south   219.37
# 21  Southwest            219.38
# 22  Southwest by west    236.25
# 23  West-southwest       253.12
# 24  West by south        253.13
# 25  West                 270.00
# 26  West by north        286.87
# 27  West-northwest       286.88
# 28  Northwest by west    303.75
# 29  Northwest            320.62
# 30  Northwest by north   320.63
# 31  North-northwest      337.50
# 32  North by west        354.37
#  1  North                354.38
