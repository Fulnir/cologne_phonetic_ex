defmodule ColognePhoneticEx do
  @moduledoc """
  
  Kölner Phonetik

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
  #   if (aString == null || aString.isEmpty) return '';
  # var phoneticString = '';
  # var trimmedPhoneticString = '';
  # var code;
  # var space = ' ';
  # var previousCode  = space;

  # for (var i = 0; i < aString.length; i++) {
  #   var each;
  #   var previous;
  #   var follower;
  #   each = aString[i].toLowerCase();

  #   // evtl i 1 höher da 0 indexed
  #   // (i > 1)
  #   if (i > 0) {
  #     // [i - 1]
  #     previous = aString[i - 1].toLowerCase();
  #   }
  #   // (i < aString.length)
  #   if (i < (aString.length - 1)) {
  #     follower = aString[i + 1].toLowerCase();
  #   }
  #   if (_colognePhoneticTable.containsKey(each)) {
  #     code = _colognePhoneticTable[each];
  #   } else {
  #     if (each == 'h') {
  #       code = space;
  #     }
  #     if (each == 'p') {
  #       if (follower == 'h') {
  #         code = '3';
  #       } else {
  #         code = '1';
  #       }
  #     }
  #     if (each == 'd') {
  #       if ((follower == 'c') || (follower == 's') || (follower == 'z') || (follower == 'ß')) {
  #         code = '8';
  #       } else {
  #         code = '2';
  #       }
  #     }
  #     if (each == 't') {
  #       if ((follower == 'c') || (follower == 's') || (follower == 'z') || (follower == 'ß')) {
  #         code = '8';
  #       } else {
  #         code = '2';
  #       }
  #     }
  #     if (each == 'c') {
  #       if ( i == 1) {
  #         if ((follower == 'a') || (follower == 'h') || (follower == 'k') || (follower == 'l')
  #             || (follower == 'o')  || (follower == 'q')   || (follower == 'r')  || (follower == 'u') || (follower == 'x')) {
  #           code = '4';
  #         } else {
  #           code = '8';
  #         }
  #       } else {
  #         if ((previous == 's') || (previous == 'z') || (previous == 'ß')) {
  #           if ((follower == 'a') || (follower == 'h') || (follower == 'k')
  #               || (follower == 'o')  || (follower == 'q') || (follower == 'u') || (follower == 'x')) {
  #             code = '8';
  #           } else {
  #             code = '4';
  #           }
  #         } else {
  #           code = '4';
  #         }
  #       }
  #     }
  #     if (each == 'x') {
  #       if ((previous == 'c') || (previous == 'k') || (previous == 'q')) {
  #         code = '8';
  #       } else {
  #         code = '48';
  #       }
  #     }

  #   }
  #   if (previousCode != code) {
  #     phoneticString = phoneticString + code;
  #   }
  #   previousCode = code;
  # }
  # for (var i = 0; i < phoneticString.length; i++) {
  #   var each = phoneticString[i];
  #   if (!((each == space) || (each == '0'))) {
  #     // "Umlaute ?"
  #     trimmedPhoneticString = trimmedPhoneticString + each;
  #   }
  # }
  # return trimmedPhoneticString;
    
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
    #head = List.to_string([head_int])
   # Logger.warn "1 #{inspect head}"
    # (i > 1)
    if i > 0 do
      previous = String.at(term, (i - 1))
    end
    # (i < aString.length)
    if (i < (String.length(term) - 1)) do
      follower = String.at(term, (i + 1))
    end
    code = if Map.has_key?(@colognePhoneticTable, head) do
      @colognePhoneticTable[head];
    else
      if head == "h", do: code = " "
      if head == "p" do
        if follower == "h" do
          "3"
        else
          "1"
        end
      end
      if head == "d" do
        if ((follower == "c") || (follower == "s") || (follower == "z") || (follower == "ß")) do
          "8"
        else 
          "2"
        end      
      end
      if head == "t" do
        if ((follower == "c") || (follower == "s") || (follower == "z") || (follower == "ß")) do
          "8"
        else 
          "2"
        end      
      end
      if head == "c" do
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
              "8"
            else
              "4"
            end
          else
            "4"
          end

        end
      end
      if head == "x" do
        if ((previous == "c") || (previous == "k") || (previous == "q")) do
          "8"
        else
          "48"
        end
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
