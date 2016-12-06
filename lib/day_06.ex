# See http://adventofcode.com/2016/day/6
defmodule Day06 do
  def transpose(m) do
    List.zip(m) |> Enum.map(&Tuple.to_list(&1))
  end

  def count_chars(list) do
    Enum.reduce(list, %{}, fn(letter, acc) -> Map.update(acc, letter, 1, &(&1 + 1)) end)
  end

  def max_used_char(list) do
    list |> sort_by_count |> List.first |> elem(0)
  end

  def min_used_char(list) do
    list |> sort_by_count |> List.last |> elem(0)
  end

  def transposed_lines do
    File.stream!("input/day_06.txt")
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.graphemes/1)
      |> transpose
  end

  def solve(list) do
    IO.puts list |> Enum.map(&max_used_char/1) |> Enum.join
  end

  def solve2(list) do
    IO.puts list |> Enum.map(&min_used_char/1) |> Enum.join
  end

  defp sort_by_count(list) do
    list
      |> count_chars
      |> Map.to_list
      |> Enum.sort(fn({_, a}, {_, b}) -> a > b end)
  end
end

# --- Part I ---
# Day06.solve(Day06.transposed_lines)

# --- Part II ---
# Day06.solve2(Day06.transposed_lines)
