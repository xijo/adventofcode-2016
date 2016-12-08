# See http://adventofcode.com/2016/day/7
defmodule Day07 do

  def supports_tls(line) do
    abbas = Regex.scan(~r{(\w)(?!\1)(\w)\2\1}, line, capture: :first)
      |> Enum.map(&List.first/1)

    Enum.all?(abbas, &(is_outside_brackets(line, &1))) && Enum.count(abbas) > 0
  end

  def supports_ssl(line) do
    Regex.scan(~r{(\w)(?!\1)(\w)\1}, line, capture: :first)
      |> Enum.map(&List.first/1)
      |> Enum.any?(fn(aba) ->
        is_inside_brackets(line, aba) && is_outside_brackets(line, invert(aba))
      end)
  end

  def invert(str) do
    [a, b, _] = String.graphemes(str)
    "#{b}#{a}#{b}"
  end

  def is_outside_brackets(line, sub) do
    String.match?(line, ~r{(\]|\A)\w*#{sub}\w*(\[|\z)})
  end

  def is_inside_brackets(line, sub) do
    String.match?(line, ~r{\[\w*#{sub}\w*\]})
  end
end

# --- Part I ---
# IO.inspect File.stream!("input/day_07.txt")
#   |> Enum.map(&String.trim/1)
#   |> Stream.filter(&Day07.supports_tls/1)
#   |> Enum.count

# # --- Part II ---
# IO.inspect File.stream!("input/day_07.txt")
#   |> Enum.map(&String.trim/1)
#   |> Stream.filter(&Day07.supports_ssl/1)
#   |> Enum.count
