defmodule Triangle do
  def is_valid([a, b, c]) do
    (a + b > c) && (a + c > b) && (b + c > a)
  end
end

is_valid_line = fn line ->
  String.trim(line)
    |> String.split(~r/\s/, trim: true)
    |> Enum.map(&(String.to_integer(&1)))
    |> Triangle.is_valid
end

IO.inspect File.stream!("advent-03-input.txt")
  |> Enum.filter(is_valid_line)
  |> Enum.count
