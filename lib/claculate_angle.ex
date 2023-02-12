defmodule ElixirExercises.ClaculateAngle do
  alias ElixirExercises.ClockDegree

  def calculate_angle_hourToMinute(hours, minutes) do
    hoursHandDegree = ClockDegree.getHourHandDegree(hours, minutes)
    minuteHandDegree = ClockDegree.getMinuteHandDegree(minutes)
    angle = abs(hoursHandDegree - minuteHandDegree)
    {:ok, angle}
  end

  def calculate_angle_minuteToHour(hours, minutes) do
    hoursHandDegree = ClockDegree.getHourHandDegree(hours, minutes)
    minuteHandDegree = ClockDegree.getMinuteHandDegree(minutes)
    angle = 360 - abs(minuteHandDegree - hoursHandDegree)
    {:ok, angle}
  end
end
