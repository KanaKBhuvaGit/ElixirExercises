defmodule CalculateAngleTest do
  use ExUnit.Case
  # doctest ElixirExercises.CalculateAngle
  alias ElixirExercises.ClaculateAngle

  test "Calculate angle at 02:30" do
    angleat12_m2h = ClaculateAngle.calculate_angle_minuteToHour(02, 30)
    assert angleat12_m2h == {:ok, 255.0}

    angleat12_h2m = ClaculateAngle.calculate_angle_hourToMinute(02, 30)
    assert angleat12_h2m == {:ok, 105.0}
  end

  test "Calculate angle at 12:00" do
    angleat12_m2h = ClaculateAngle.calculate_angle_minuteToHour(12, 00)
    assert angleat12_m2h == {:ok, 360.0}

    angleat12_h2m = ClaculateAngle.calculate_angle_hourToMinute(12, 00)
    assert angleat12_h2m == {:ok, 0.0}
  end
end
