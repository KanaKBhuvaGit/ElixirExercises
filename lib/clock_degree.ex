defmodule ElixirExercises.ClockDegree do
  require Logger

  @moduledoc """
  Calculate degree of clock's hands
  """

  @doc """
    Calculate hour hand degree
  """

  def getHourHandDegree(hours, _minutes) when not is_integer(hours),
    do: "Only interger value allowed in hours"

  def getHourHandDegree(hours, _minutes) when hours < 0,
    do: "hours must be greater than or equals to 0"

  def getHourHandDegree(hours, _minutes) when hours > 24,
    do: "hours must be less than or equals to 24"

  def getHourHandDegree(_hours, minutes) when not is_integer(minutes),
    do: "Only interger value allowed in minutes"

  def getHourHandDegree(_hours, minutes) when minutes < 0,
    do: "minutes must be greater than or equals to 0"

  def getHourHandDegree(_hours, minutes) when minutes > 60,
    do: "minutes must be less than 60 or equals to 60"

  def getHourHandDegree(hours, _minutes) when hours == 0, do: 0

  def getHourHandDegree(hours, _minutes) when hours == 12, do: 0

  def getHourHandDegree(hours, minutes) when hours > 12,
    do: getHourHandDegree(hours - 12, minutes)

  def getHourHandDegree(hours, minutes) when minutes == 60, do: getHourHandDegree(hours, 0)

  def getHourHandDegree(hours, minutes) do
    # Logger.info("Hours: #{hours} and Minutes: #{minutes}")
    (hours * 60 + minutes) * 0.5
  end

  @doc """
    Calculate minute hand degree
  """
  def getMinuteHandDegree(minutes) when not is_integer(minutes),
    do: "Only interger value allowed in minutes"

  def getMinuteHandDegree(minutes) when minutes < 0,
    do: "minutes must be greater than or equals to 0"

  def getMinuteHandDegree(minutes) when minutes > 60,
    do: "minutes must be less than or equals to 60"

  def getMinuteHandDegree(minutes) when minutes == 0, do: 0

  def getMinuteHandDegree(minutes) when minutes == 60, do: 0

  def getMinuteHandDegree(minutes) do
    # Logger.info("Minutes: #{minutes}")
    minutes * 6
  end

  @doc """
    For future use: Calculate second hand degree
  """
  def getSecondHandDegree(seconds) when not is_integer(seconds),
    do: "Only interger value allowed in seconds"

  def getSecondHandDegree(seconds) when seconds < 0,
    do: "seconds must be greater than or equals to 0"

  def getSecondHandDegree(seconds) when seconds > 60,
    do: "seconds must be less than or equals to 60"

  def getSecondHandDegree(seconds) when seconds == 0, do: 0

  def getSecondHandDegree(seconds) when seconds == 60, do: 0

  def getSecondHandDegree(seconds) do
    # Logger.info("Seconds: #{seconds}")
    seconds * 6
  end
end
