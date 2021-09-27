defmodule NetworkBenchmark.MixProject do
  use Mix.Project

  def project do
    [
      app: :network_benchmark,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {NetworkBenchmark.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bandit, "~> 0.4.1"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
