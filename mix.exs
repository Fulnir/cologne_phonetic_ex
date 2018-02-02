defmodule ColognePhoneticEx.MixProject do
  @moduledoc """
  
  """
  use Mix.Project

  def project do
    [
      app: :cologne_phonetic_ex,
      version: "1.0.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      package: package(),
      description: description(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        "coveralls":        :test,
        "coveralls.detail": :test,
        "coveralls.post":   :test,
        "coveralls.html":   :test,
        "coveralls.json":   :test,
        "coveralls.circle":   :test,
      ],
      deps: deps(),
      # Docs
      docs: docs()
    ]
  end


  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:ex_doc, "~> 0.17", only: :dev, runtime: false},        # mix docs erzeugt die Documentation
    {:credo, "~> 0.9.0-rc1", only: [:dev, :test]},  # mix credo übperprüft den Styleguide
    {:ex_dash, "~> 0.1.5", only: :dev},         # For Dash  mix docs.dash
    {:inch_ex, "~> 0.5", only: [:dev, :test]}, # mix inch
    {:excoveralls,  "~> 0.7.5", only: :test},
    {:ex_unit_notifier, "~> 0.1", only: :test},
    {:mix_test_watch, "~> 0.2", only: :dev, runtime: false},  # Automatically run your Elixir project's tests each time you save a file.
    {:bunt, "~> 0.2.0"}
  ]
  end

  defp description do
    """
    Calculates and returns the "Cologne Phonetic" (Kölner Phonetik) code for the given string.
    It's the phonetic code for the  German language.
    """
  end
  defp package do
    # These are the default files included in the package
    [
      name: :cologne_phonetic_ex,
      files: ["lib", "mix.exs", "README*", "LICENSE*", ".iex.exs"],
      maintainers: ["Edwin Bühler"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Fulnir/cologne_phonetic_ex"}
    ]
  end

  defp docs do
    [
      name: "ColognePhoneticEx",
      main: "README",
      formatters: ["html"],
      source_url: "https://github.com/Fulnir/cologne_phonetic_ex",
      extras: [
        "README.md"
      ]
    ]
  end
end
