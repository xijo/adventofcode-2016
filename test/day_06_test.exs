defmodule Day06Test do
  use ExUnit.Case
  import Day06

  test "transpose works correctly" do
    assert transpose([[1, 1], [2, 2]]) == [[1, 2], [1, 2]]
  end

  test "max_used_char" do
    assert max_used_char(["a", "b", "c", "b"]) == "b"
  end

  test "min_used_char" do
    assert min_used_char(["a", "a", "b", "c", "b"]) == "c"
  end
end
