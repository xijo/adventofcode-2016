defmodule Triangle do
  def is_valid([a, b, c]) do
    (a + b > c) && (a + c > b) && (b + c > a)
  end
end

transpose = fn(m)-> List.zip(m) |> Enum.map(&Tuple.to_list(&1)) end

IO.inspect File.read!("advent-03-input.txt")
  |> String.split                         # Split whole file by whitespace
  |> Enum.map(&String.to_integer/1)       # Convert all to integer
  |> Enum.chunk(3)                        # Get original lines
  |> Enum.chunk(3)                        # Group lines by 3
  |> Enum.map(&(transpose.(&1)))          # Transpose rows and cols
  |> List.flatten                         # Flatten for..
  |> Enum.chunk(3)                        #              ..regrouping
  |> Enum.filter(&Triangle.is_valid/1)    # Throw invalid lines out
  |> Enum.count                           # Count the rest
