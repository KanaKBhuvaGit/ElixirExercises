defmodule Anagrams do
  #   caret carte cater crate trace
  # evil levi live veil vile
  # alger glare lager large regal
  # elan lane lean lena neal
  # angel angle galen glean lange
  # abel able bale bela elba
  def anagram?(base, base), do: false

  def anagram?(base, candidate) do
    sort_letter(base) == sort_letter(candidate)
  end

  defp sort_letter(string) do
    string
    |> String.codepoints()
    |> Enum.sort()
  end

  def find(file) do
    File.read!(file)
    |> String.split()
    |> Enum.group_by(fn word -> String.codepoints(word) |> Enum.sort() end)
    |> Enum.group_by(fn {_, v} -> length(v) end)
    |> Enum.max()
    |> print
  end

  defp print({_, y}) do
    Enum.each(y, fn {_, e} -> Enum.sort(e) |> Enum.join(" ") |> IO.puts() end)
  end

  def find_stream(_file) do
    File.stream!("unixdict.txt")
    |> Stream.map(&String.trim(&1))
    |> Enum.group_by(&(String.codepoints(&1) |> Enum.sort()))
    |> Map.values()
    |> Enum.group_by(&length(&1))
    |> Enum.max()
    |> elem(1)
    |> Enum.each(fn n -> Enum.sort(n) |> Enum.join(" ") |> IO.puts() end)
  end
end
