defmodule KeyValueStore.Mixfile do
  use Mix.Project

  def project do
    [
      app: :key_value_store,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {KEY_VALUE_STORE, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 0.3", only: [:dev, :test]}
    ]
  end
end
