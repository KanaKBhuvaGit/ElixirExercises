defmodule Exercises.ExerciseAnagram do
  def is_anagram1() do
    Anagrams.anagram?("angel", "angel")
  end

  def is_anagram2() do
    Anagrams.anagram?("angel", "galen")
  end

  def have_anagrams() do
    Enum.filter(~w(hello world zombies pants angle galen glean lange), fn word ->
      Anagrams.anagram?("angel", word)
    end)
  end

  def have_anagrams1() do
    Enum.filter(~w(hello world zombies pants angle galen glean lange angel), fn word ->
      Anagrams.anagram?("angel", word)
    end)
  end

  def have_deranged_anagram() do
    Enum.filter(~w(hello world zombies pants angle galen glean lange angel galne), fn word ->
      Anagrams.deranged_anagram?("angel", word)
    end)
  end
end
