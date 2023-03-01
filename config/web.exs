# configurations for the web server

import Config

config :slack_integration, :web, scheme: :http, port: 8080, plug: SlackIntegration.Web.Router
