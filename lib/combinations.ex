defmodule Combinations do
  # def combination(0, _) do
  #   IO.inspect("combination(0, _)")
  #   [[]]
  # end

  # def combination(_, []) do
  #   IO.inspect("combination(_, [])")
  #   []
  # end

  # def combination(m, [h | t]) do
  #   IO.inspect("Start: combination(m, [h | t])")
  #   IO.inspect(m)
  #   IO.inspect(h)
  #   IO.inspect(t)
  #   IO.inspect("End: combination(m, [h | t])")

  #   for l <- combination(m - 1, t) do
  #     IO.inspect("Start: combination(m, [h | t]) -- for")
  #     IO.inspect(h)
  #     IO.inspect(l)
  #     IO.inspect([h | l])
  #     IO.inspect("Start: combination(m, [h | t]) -- for end")
  #     [h | l]
  #   end ++ combination(m, t)
  # end

  def of(_, 0), do: [[]]
  def of([], _), do: []

  def of([h | t], m) do
    for(l <- of(t, m - 1), do: [h | l]) ++ of(t, m)
  end
end
