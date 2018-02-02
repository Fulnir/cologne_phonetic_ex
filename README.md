# ColognePhoneticEx

[![CircleCI](https://circleci.com/bb/Fulnir/cologne_phonetic_ex/tree/master.svg?style=shield&circle-token=7f28084aaa0352458962665157b90ed38e35d858)](https://circleci.com/bb/Fulnir/cologne_phonetic_ex/tree/master) [![Ebert](https://ebertapp.io/github/Fulnir/cologne_phonetic_ex.svg)](https://ebertapp.io/github/Fulnir/cologne_phonetic_ex) [![codecov](https://codecov.io/bb/fulnir/cologne_phonetic_ex/branch/master/graph/badge.svg)](https://codecov.io/bb/fulnir/cologne_phonetic_ex)

## Kölner Phonetik

Calculates and returns the "Cologne Phonetic" (Kölner Phonetik) code for the given string.
It's the phonetic code for the  German language.

**Cologne phonetics** (also Kölner Phonetik, Cologne process) is a phonetic algorithm which assigns to words a sequence of digits, the phonetic code. The aim of this procedure is that identical sounding words have the same code assigned to them. The algorithm can be used to perform a similarity search between words. For example, it is possible in a name list to find entries like "Meier" under different spellings such as "Maier", "Mayer", or "Mayr". The Cologne phonetics is related to the well known Soundex phonetic algorithm but is optimized to match the German language.

## German

Quelle: [de.wikipedia.org/wiki/Kölner_Phonetik](http://de.wikipedia.org/wiki/Kölner_Phonetik)

Die **Kölner Phonetik** (auch *Kölner Verfahren*) ist ein [[Phonetische Suche|phonetischer]] [[Algorithmus]], der Wörtern nach ihrem Sprachklang eine Ziffernfolge zuordnet, den phonetischen Code. Ziel dieses Verfahrens ist es, gleich klingenden Wörtern denselben [[Code]] zuzuordnen, um bei Suchfunktionen eine Ähnlichkeitssuche zu implementieren. Damit ist es beispielsweise möglich, in einer Namensliste Einträge wie „Meier“ auch unter anderen Schreibweisen, wie „Maier“, „Mayer“ oder „Mayr“ zu finden. Die Kölner Phonetik ist, im Vergleich zum bekannteren Russell-[[Soundex]]-Verfahren, besser auf die [[deutsche Sprache]] abgestimmt. Sie wurde 1969 von [[Hans Joachim Postel]] veröffentlicht.

### Grundregeln
Die Kölner Phonetik bildet jeden Buchstaben eines Wortes auf eine Ziffer zwischen „0“ und „8“ ab, wobei für die Auswahl der jeweiligen Ziffer maximal ein benachbarter Buchstabe als Kontext benutzt wird. Einige Regeln gelten speziell für den Wortanfang ([[Anlaut]]). Auf diese Weise wird ähnlichen Lauten derselbe Code zugeordnet. Die beiden Buchstaben „W“ und „V“ beispielsweise werden mit der Ziffer „3“ codiert. Der phonetische Code für „Wikipedia“ lautet <code>3412</code>. Im Gegensatz zum Soundex-Code ist die Länge des phonetischen Codes nach der Kölner Phonetik nicht beschränkt.


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `cologne_phonetic_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:cologne_phonetic_ex, "~> 1.0.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/cologne_phonetic_ex](https://hexdocs.pm/cologne_phonetic_ex).



Copyright © 2018 Edwin Buehler. All rights reserved.