defmodule Exercises.CaesarCipher do
  require Logger

  defp set_map(map, range, key) do
    org = Enum.map(range, &List.to_string([&1]))
    {a, b} = Enum.split(org, key)
    Enum.zip(org, b ++ a) |> Enum.into(map)
  end

  def encode(text, key) do
    map = Map.new() |> set_map(?a..?z, key) |> set_map(?A..?Z, key)
    String.graphemes(text) |> Enum.map_join(fn c -> Map.get(map, c, c) end)
  end

  def task do
    text = "The five boxing wizards jump quickly"
    key = 3
    IO.puts("Original:  #{text}")
    IO.puts("Encrypted: #{enc = encode(text, key)}")
    IO.puts("Decrypted: #{encode(enc, -key)}")
  end
end
