defmodule Exercises.Abc do
  def can_make_word(word, avail) do
    can_make_word(String.upcase(word) |> to_charlist, avail, [])
  end

  defp can_make_word([], _, _), do: true
  defp can_make_word(_, [], _), do: false

  defp can_make_word([l | tail], [b | rest], tried) do
    (l in b and can_make_word(tail, rest ++ tried, [])) or
      can_make_word([l | tail], rest, [b | tried])
  end

  def abc do
    blocks = ~w(BO XK DQ CP NA GT RE TG QD FS JW HU VI AN OB ER FS LY PC ZM)c

    ~w(A Bark Book Treat Common Squad Confuse)
    |> Enum.map(fn w -> IO.puts("#{w}: #{can_make_word(w, blocks)}") end)
  end
end
