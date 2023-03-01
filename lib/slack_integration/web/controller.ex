defmodule SlackIntegration.Web.Controller do
  alias SlackIntegration.Slack
  def process_message(%{"Type" => "SpamNotification"} = body) do

    message = "Spam notification from #{body["Email"]}: #{body["Description"]}"

    case Slack.send_message(message) do
      {:ok, _} -> {:ok, "Spam message processed"}
      other -> {:error, other}
    end
  end

  def process_message(_) do
    {:error, "Not a spam message"}
  end
end
