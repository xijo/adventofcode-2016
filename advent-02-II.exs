defmodule StrangeNumpad do
  # Represent a strange numpad like this:
  #       1
  #     2 3 4
  #   5 6 7 8 9
  #     A B C
  #       D
  @table %{
            1 => %{ L:  1, U:  1, R:  1, D:  3 },
            2 => %{ L:  2, U:  2, R:  3, D:  6 },
            3 => %{ L:  2, U:  1, R:  4, D:  7 },
            4 => %{ L:  3, U:  4, R:  4, D:  8 },
            5 => %{ L:  5, U:  5, R:  6, D:  5 },
            6 => %{ L:  5, U:  2, R:  7, D: :A },
            7 => %{ L:  6, U:  3, R:  8, D: :B },
            8 => %{ L:  7, U:  4, R:  9, D: :C },
            9 => %{ L:  8, U:  9, R:  9, D:  9 },
            A:   %{ L: :A, U:  6, R: :B, D: :A },
            B:   %{ L: :A, U:  7, R: :C, D: :D },
            C:   %{ L: :B, U:  8, R: :C, D: :C },
            D:   %{ L: :D, U: :B, R: :D, D: :D },
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
  IO.write String.trim(line) |> String.split("", trim: true) |> StrangeNumpad.move(3)
end
