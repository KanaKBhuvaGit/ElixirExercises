defmodule Exercises.CharacterCodes do
  def task do
    abcd = Enum.map_join(?a..?z, &to_string([&1]))
    abcd
  end
end
