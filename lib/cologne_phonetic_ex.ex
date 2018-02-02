defmodule ColognePhoneticEx do
  @moduledoc """
  
  **Cologne phonetics** (also Kölner Phonetik, Cologne process) is a phonetic
  algorithm which assigns to words a sequence of digits, the phonetic code.
  The aim of this procedure is that identical sounding words have the same code
  assigned to them. The algorithm can be used to perform a similarity search
  between words. For example, it is possible in a name list to find entries
  like "Meier" under different spellings such as "Maier", "Mayer", or "Mayr".
  The Cologne phonetics is related to the well known Soundex
  phoneticalgorithm but is optimized to match the German language.

  [de.wikipedia.org/wiki/Kölner_Phonetik](http://de.wikipedia.org/wiki/Kölner_Phonetik)

  Copyright © 2018 Edwin Buehler. All rights reserved.
  
  """
  require Logger

 @colognePhoneticTable %{
   "a" => "0",
   "ä" => "0",
   "e" => "0",
   "i" => "0",
   "j" => "0",
   "o" => "0",
   "ö" => "0",
   "u" => "0",
   "ü" => "0",
   "y" => "0",
   "b" => "1",
   "f" => "3",
   "v" => "3",
   "w" => "3",
   "g" => "4",
   "k" => "4",
   "q" => "4",
   "l" => "5",
   "m" => "6",
   "n" => "6",
   "r" => "7",
   "s" => "8",
   "z" => "8"
 }

  @doc """
  Calculates and returns the "Cologne Phonetic" (Kölner Phonetik) code for the given string.
  It's the phonetic code for the  German language.

  ## Examples

      iex> ColognePhoneticEx.as_cologne_phonetic("Bühler")
      "157"

  """
  @spec as_cologne_phonetic(String) :: String
  def as_cologne_phonetic(term) do
    case term do
      nil ->
        ""
      "" ->
        ""
      term ->
        i = 0
        term_downcase = String.downcase(term)
        phonetic_string = each_char(i, String.graphemes(term_downcase), term_downcase, " ","")
        trimmed_phonetic_string = String.replace(phonetic_string, " ", "")
        trimmed_phonetic_string = String.replace(trimmed_phonetic_string, "0", "")
        trimmed_phonetic_string
      _ -> ""
    end
  end

  defp each_char(i, [], term, previous_code, current_phonetic_string) do
    current_phonetic_string
  end

  @spec each_char(Integer, [String | String], String, String, String) :: String
  defp each_char(i, [head | tail], term, previous_code, current_phonetic_string) do
    previous = " "
    follower = " "
    code = " "
    phonetic_string = " "
    if i > 0 do
      previous = String.at(term, (i - 1))
    end
    # (i < aString.length)
    if (i < (String.length(term) - 1)) do
      follower = String.at(term, (i + 1))
    end
    code = if Map.has_key?(@colognePhoneticTable, head) do
      @colognePhoneticTable[head]
    else
    case head do
      "h" ->
        " "
      "p" ->
        if follower == "h" do
          "3"
        else
          "1"
        end
      "d" ->
        if ((follower == "c") || (follower == "s") || (follower == "z") || (follower == "ß")) do
          "8"
        else
          "2"
        end
      "t" ->
        if ((follower == "c") || (follower == "s") || (follower == "z") || (follower == "ß")) do
          "8"
        else
          "2"
        end
        "c" ->
          if i == 1 do
            if ((follower == "a") || (follower == "h") || (follower == "k") || (follower == "l")
              || (follower == "o")  || (follower == "q")   || (follower == "r")  || (follower == "u") || (follower == "x")) do
              "4"
            else
              "8"
            end
          else
            if ((previous == "s") || (previous == "z") || (previous == "ß")) do
              if ((follower == "a") || (follower == "h") || (follower == "k")
                || (follower == "o")  || (follower == "q") || (follower == "u") || (follower == "x")) do
                "4"
              else
                "8"
              end
            else
              "8"
            end
          end
        "x" ->
          if ((previous == "c") || (previous == "k") || (previous == "q")) do
            "8"
          else
            "48"
          end
        _ ->
          " "
        end
    end
    phonetic_string = if previous_code != code do
      current_phonetic_string <> to_string(code)
    else
      current_phonetic_string
    end
    each_char(i, tail, term, code, phonetic_string)
  end

end
