defmodule PhoenixFrontend.MixProject do
  use Mix.Project

  def project do
    [
      app: :phoenix_frontend,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "PhoenixFrontend",
      source_url: "https://github.com/nickywoolf/phoenix-frontend",
      package: package(),
      description: description(),
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
    [
      {:ex_doc, "~> 0.21"}
    ]
  end

  defp description() do
    """
    Replaces Phoenix framework assets directory with
    preconfigured frontend frameworks.
    """
  end

  defp docs() do
    [main: "Mix.Tasks.PhxFrontend"]
  end

  defp package() do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/nickywoolf/phoenix-frontend"},
      files: ~w(assets lib test .formatter.exs .gitignore mix.exs README.md)
    ]
  end
end
