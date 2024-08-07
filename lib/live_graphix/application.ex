defmodule LiveGraphix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LiveGraphixWeb.Telemetry,
      LiveGraphix.Repo,
      {DNSCluster, query: Application.get_env(:live_graphix, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LiveGraphix.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: LiveGraphix.Finch},
      # Start a worker by calling: LiveGraphix.Worker.start_link(arg)
      # {LiveGraphix.Worker, arg},
      # Start to serve requests, typically the last entry
      LiveGraphixWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveGraphix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveGraphixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
