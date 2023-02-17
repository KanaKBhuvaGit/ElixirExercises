defmodule Exercises.ArithmeticInteger do
  # Function to remove line breaks and convert string to int
  defp get_int(msg) do
    IO.gets(msg) |> String.trim() |> String.to_integer()
  end

  def task do
    # Get user input
    a = get_int("Enter your first integer: ")
    b = get_int("Enter your second integer: ")

    IO.puts("Elixir Integer Arithmetic:\n")
    IO.puts("Sum:            #{a + b}")
    IO.puts("Difference:     #{a - b}")
    IO.puts("Product:        #{a * b}")
    # Float
    IO.puts("True Division:  #{a / b}")
    # Truncated Towards 0
    IO.puts("Division:       #{div(a, b)}")
    # floored integer division
    IO.puts("Floor Division: #{Integer.floor_div(a, b)}")
    # Sign from first digit
    IO.puts("Remainder:      #{rem(a, b)}")
    # modulo remainder (uses floored division)
    IO.puts("Modulo:         #{Integer.mod(a, b)}")
    # Float, using Erlang's :math
    IO.puts("Exponent:       #{:math.pow(a, b)}")
  end
end
