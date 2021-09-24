defmodule Collatz do
  def compute(1), do: [1]

  def compute(input) do
    next =
      case Integer.mod(input, 2) do
        1 -> input * 3 + 1
        0 -> div(input, 2)
      end

    [input | compute(next)]
  end
end

user_input =
  case System.argv() do
    [arg] -> arg
    [] -> IO.gets("Please enter the input value: ") |> String.trim
  end

case Integer.parse(user_input) do
  {num, _} when num < 0 -> IO.puts "Please enter a positive number"
  {num, _} -> IO.inspect Collatz.compute(num), label: "Collatz", limit: :infinity
  :error -> IO.puts "Invalid input '#{user_input}'"
end
