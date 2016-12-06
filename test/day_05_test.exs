defmodule Day05Test do
  use ExUnit.Case
  import Day05

  test "md5" do
    assert md5("abc") == "900150983cd24fb0d6963f7d28e17f72"
  end

  test "replace_at within string" do
    assert replace_at("foobar", 5, "z") == "foobaz"
  end

  test "replace_at with index outside" do
    assert replace_at("foobar", 10, "z") == "foobar"
  end

  test "merge_solution replaces correct position" do
    assert merge_solution("000001b", "***") == "*b*"
  end

  # test "access_char" do
  #   assert access_char(3231929, "abc") == ["1", "5"]
  #   assert access_char(3231928, "abc") == []
  # end

  # test "solve_char" do
  #   assert solve_char("0", "a") == "a_______"
  #   assert solve_char("1", "a") == "_a______"
  #   assert solve_char("7", "a") == "_______a"
  #   assert solve_char("8", "a") == "________"
  #   assert solve_char("f", "a") == "________"
  #   assert solve_char("0", "b", "a_______") == "a_______"
  #   assert solve_char(nil, nil, "a_______") == "a_______"
  # end
end
