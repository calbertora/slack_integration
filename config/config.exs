import Config

import_config "web.exs"

config :slack_integration,
  webhook: System.get_env("SLACK_WEBHOOK")
