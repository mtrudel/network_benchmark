defmodule NetworkBenchmark.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Bandit, plug: NetworkBenchmark.Echo, scheme: :http, options: [port: 4001]},
      {Plug.Cowboy, plug: NetworkBenchmark.Echo, scheme: :http, options: [port: 4002]}
    ]

    opts = [strategy: :one_for_one, name: NetworkBenchmark.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
