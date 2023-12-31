defmodule GraphqlWsClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :graphql_ws_client,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      #{:absinthe_graphql_ws, "~> 0.3"},
      {:absinthe_graphql_ws, path: "./deps/absinthe_graphql_ws"},
      {:gun, "~> 1.3"},
      {:jason, "~> 1.2"},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
