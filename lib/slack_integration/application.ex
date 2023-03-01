defmodule SlackIntegration.Application do
  use Application

  def start(_type, _args) do
    children = [
      SlackIntegration.Web.Server
    ]

    opts = [strategy: :one_for_one, name: Slack.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
