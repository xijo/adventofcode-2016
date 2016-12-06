# See http://adventofcode.com/2016/day/5
defmodule Day05 do
  def md5(data) do
    Base.encode16(:erlang.md5(data), case: :lower)
  end

  def hash_stream(input) do
    Stream.iterate(0, &(&1 + 1))
      |> Stream.map(&("#{input}#{&1}"))
      |> Stream.map(&md5/1)
      |> Stream.each(&(IO.write "\r#{&1}"))
      |> Stream.filter(&(String.match?(&1, ~r{\A00000})))
  end

  def solve(input) do
    hash_stream(input)
      |> Enum.take(8)
      |> Enum.map(&(String.at(&1, 5)))
      |> Enum.join
      |> IO.inspect
  end

  def solve2(input) do
    hash_stream(input)
      |> Enum.reduce_while("________", fn (hash, solution) ->
        next = merge_solution(hash, solution)
        IO.write "\r#{String.pad_leading(next, 41)}"

        if String.match?(next, ~r{_}) do
          { :cont, next }
        else
          { :halt, next }
        end
      end)
  end

  def merge_solution(hash, solution) do
    [hexposition, char] = Regex.run ~r{\A00000(.)(.)}, hash, capture: :all_but_first
    position = elem(Integer.parse(hexposition, 16), 0)
    replace_at(solution, position, char)
  end

  def replace_at(string, index, value) do
    String.graphemes(string)
      |> List.replace_at(index, value)
      |> Enum.join
  end
end

# --- Part I ---
# Day05.solve("uqwqemis")

# --- Part II ---
# Day05.solve2("uqwqemis")
