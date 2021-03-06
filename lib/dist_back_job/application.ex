defmodule DistBackJob.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Cluster.Supervisor, [topologies(), [name: DistBackJob.ClusterSupervisor]]}
      # Starts a worker by calling: DistBackJob.Worker.start_link(arg)
      # {DistBackJob.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DistBackJob.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp topologies do
    [
      dist_back_job: [
        strategy: Cluster.Strategy.Gossip
      ]
    ]
  end
end
