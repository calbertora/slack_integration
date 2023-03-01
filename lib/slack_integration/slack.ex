defmodule SlackIntegration.Slack do

  @webhook Application.fetch_env!(:slack_integration, :webhook)

  def send_message(message) do
    HTTPoison.post(
      @webhook,
      '{"text": "#{message}"}',
      [{"Content-Type", "application/json"}]
    )
  end
end
