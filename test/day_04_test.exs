defmodule Day04Test do
  use ExUnit.Case
  import Day04.Room

  test "is_valid returns true for a valid room" do
    room = build("aaaaa-bbb-z-y-x-123[abxyz]")
    assert is_valid(room) == true
  end

  test "is_valid returns false for decoy room" do
    room = build("totally-real-room-200[decoy]")
    assert is_valid(room) == false
  end

  test "build Room from line" do
    assert build("foo-b-b-42[bar]") == %Day04.Room{name: "foo-b-b", sector_id: 42, checksum: "bar"}
  end

  test "build_checksum" do
    assert build_checksum("aaaaa-bbb-z-y-x") == "abxyz"
    assert build_checksum("a-b-c-d-e-f-g-h") == "abcde"
    assert build_checksum("not-a-real-room") == "oarel"
  end

  test "decrypt" do
    room = build("qzmt-zixmtkozy-ivhz-343[foobar]")
    assert decrypt(room) == "very encrypted name"
  end

  test "rotate" do
    assert rotate(?a,  2) == ?c
    assert rotate(?a, 26) == ?a
    assert rotate(?b, 51) == ?a
    assert rotate(?-, 42) == 32
  end
end
