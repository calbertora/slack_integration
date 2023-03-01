import Config

config :slack_integration,
  webhook: System.get_env("SLACK_WEBHOOK")
