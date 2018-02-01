defmodule ColognePhoneticExTest do
  use ExUnit.Case
  doctest ColognePhoneticEx
  import ColognePhoneticEx
  require Logger

  #
  # German - Kölner Phonetik
  #
  
  test "'' = ''" do
    assert "" == as_cologne_phonetic("")
  end

  test "nil = ''" do
    assert "" == as_cologne_phonetic(nil)
  end

  test "Dart = '272'" do
    assert "272" == as_cologne_phonetic("Dart")
  end

  test "Guss = '48'" do
    assert "48" == as_cologne_phonetic("Guss")
  end

  test "Kuss = '48'" do
    assert "48" == as_cologne_phonetic("Kuss")
  end

  test "Ding = '264'" do
    assert "264" == as_cologne_phonetic("Ding")
  end

  test "Dink = '264'" do
    assert "264" == as_cologne_phonetic("Dink")
  end

  test "Edwin Bühler = '236157'" do
    assert "236157" == as_cologne_phonetic("Edwin Bühler")
  end

  test "Bühler = '157'" do
    assert "157" == as_cologne_phonetic("Bühler")
  end

  test "Buhler = '157'" do
    assert "157" == as_cologne_phonetic("Buhler")
  end

  test "Buehler = '157'" do
    assert "157" == as_cologne_phonetic("Buehler")
  end

  test "Breschnew = '17863'" do
    assert "17863" == as_cologne_phonetic("Breschnew")
  end

  test "Müller-Lüdenscheidt = '65752682'" do
    assert "65752682" == as_cologne_phonetic("Müller-Lüdenscheidt")
  end

  test "Müller = '657'" do
    assert "657" == as_cologne_phonetic("Müller")
  end

  test "Nuelr = '657'" do
    assert "657" == as_cologne_phonetic("Nuelr")
  end

end
