defmodule Day07Test do
  use ExUnit.Case
  import Day07

  # abba[mnop]qrst supports TLS (abba outside square brackets).
  test "supports_tls returns true if abba outside square brackets" do
    assert supports_tls("abba[mnop]qrst")
  end

  # abcd[bddb]xyyx does not support TLS (bddb is within square brackets, even
  # though xyyx is outside square brackets).
  test "supports_tls returns false when abba inside brackets" do
    assert supports_tls("abcd[bddb]xyyx") == false
  end

  # aaaa[qwer]tyui does not support TLS (aaaa is invalid; the interior
  # characters must be different).
  test "supports_tls returns false if interior characters is not different" do
    assert supports_tls("aaaa[qwer]tyui") == false
  end

  # ioxxoj[asdfgh]zxcvbn supports TLS (oxxo is outside square brackets, even
  # though it's within a larger string).
  test "supports_tls returns true if part of larger string" do
    assert supports_tls("ioxxoj[asdfgh]zxcvbn")
  end

  test "supports_ssl" do
    # aba[bab]xyz supports SSL (aba outside square brackets with corresponding bab within square brackets).
    assert supports_ssl("aba[bab]xyz") == true
    # xyx[xyx]xyx does not support SSL (xyx, but no corresponding yxy).
    assert supports_ssl("xyx[xyx]xyx") == false
    # aaa[kek]eke supports SSL (eke in supernet with corresponding kek in hypernet; the aaa sequence is not related, because the interior character must be different).
    assert supports_ssl("aaa[kek]eke") == true
    # zazbz[bzb]cdb supports SSL (zaz has no corresponding aza, but zbz has a corresponding bzb, even though zaz and zbz overlap).
    assert supports_ssl("zazbz[bzb]cdb") == true
  end

  test "invert" do
    assert invert("aba") == "bab"
  end

  test "is_inside_brackets" do
    assert is_inside_brackets("foo[bar]baz", "bar") == true
    assert is_inside_brackets("foo[bar]baz", "a") == true
    assert is_inside_brackets("foo[bar]baz", "foo") == false
    assert is_inside_brackets("foo[bar]baz", "o") == false
  end

  test "is_outside_brackets" do
    assert is_outside_brackets("foo[bar]baz", "foo") == true
    assert is_outside_brackets("foo[bar]baz", "baz") == true
    assert is_outside_brackets("foo[bar]baz", "o") == true
    assert is_outside_brackets("foo[bar]baz", "bar") == false
    assert is_outside_brackets("foo[bar]baz", "r") == false
  end
end
