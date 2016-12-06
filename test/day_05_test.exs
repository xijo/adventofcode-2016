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
end
