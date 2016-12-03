defmodule Numpad do
  # Represent a numpad like this:
  #   1 2 3
  #   4 5 6
  #   7 8 9
  @table %{
            1 => %{ L: 1, U: 1, R: 2, D: 4 },
            2 => %{ L: 1, U: 2, R: 3, D: 5 },
            3 => %{ L: 2, U: 3, R: 3, D: 6 },
            4 => %{ L: 4, U: 1, R: 5, D: 7 },
            5 => %{ L: 4, U: 2, R: 6, D: 8 },
            6 => %{ L: 5, U: 3, R: 6, D: 9 },
            7 => %{ L: 7, U: 4, R: 8, D: 7 },
            8 => %{ L: 7, U: 5, R: 9, D: 8 },
            9 => %{ L: 8, U: 6, R: 9, D: 9 }
          }

  def move([instruction], position) do
    @table[position][String.to_atom(instruction)]
  end

  def move([instruction | tail], position) do
    new_position = @table[position][String.to_atom(instruction)]
    move(tail, new_position)
  end
end

Enum.each File.stream!("advent-02-input.txt"), fn line ->
  IO.write String.trim(line) |> String.split("", trim: true) |> Numpad.move(3)
end
