# See http://adventofcode.com/2016/day/4
defmodule Day04.Room do
  defstruct [:name, :sector_id, :checksum]

  # Double alphabet makes it easier to rotate
  @alphabet 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz'

  # Build a Room from a given line, which has the following format:
  #   name-sep-by-dash-sectorid[checksum]
  def build(line) do
    regex = ~r/(?<name>.*)-(?<sector_id>\d+)\[(?<checksum>\w+)\]/
    attrs = Regex.named_captures(regex, line)
    %Day04.Room{
      name:      attrs["name"],
      sector_id: String.to_integer(attrs["sector_id"]),
      checksum:  attrs["checksum"]
    }
  end

  def is_valid(room) do
    room.checksum == build_checksum(room.name)
  end

  def build_checksum(str) do
    String.replace(str, "-", "")
      |> String.split(~r//, trim: true)
      |> Enum.reduce(%{}, fn(letter, acc) -> Map.update(acc, letter, 1, &(&1 + 1)) end)
      |> Map.to_list
      |> Enum.sort(fn({a1, a2}, {b1, b2}) ->
          if a2 == b2, do: a1 < b1, else: a2 > b2
        end)
      |> Enum.take(5)
      |> Enum.map(&(elem(&1, 0)))
      |> Enum.join
  end

  def decrypt(room) do
    room.name
      |> to_charlist
      |> Enum.map(fn(c) -> Day04.Room.rotate(c, room.sector_id) end)
      |> to_string
  end

  # Rotate a given integer value, which represents a char by +shift+ counts
  # through the alphabet.
  # Return empty string for any non alphabet members.
  def rotate(c, shift) do
    index = Enum.find_index(@alphabet, fn(a) -> a == c end)
    if index == nil do
      32
    else
      new_index = index + rem(shift, 26)
      Enum.at(@alphabet, new_index)
    end
  end
end

# --- Part I ---
# IO.inspect File.stream!("input/day_04.txt")
#   |> Enum.map(fn(line) -> Day04.Room.build(line) end)
#   |> Enum.filter(fn(room) -> Day04.Room.is_valid(room) end)
#   |> Enum.map(fn(room) -> room.sector_id end)
#   |> Enum.sum

# --- Part II ---
# File.stream!("input/day_04.txt")
#   |> Enum.map(fn(line) -> Day04.Room.build(line) end)
#   |> Enum.filter(fn(room) -> Day04.Room.decrypt(room) == "northpole object storage" end)
#   |> Enum.each(fn(room) -> IO.inspect room.sector_id end)
