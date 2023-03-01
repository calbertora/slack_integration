defmodule SlackIntegration.Web.Router do
  use Plug.Router

  alias SlackIntegration.Web.Controller

  post "/api/process-message" do
    body = conn.body_params

    case Controller.process_message(body) do
      {:ok, message} -> send_resp(conn, 200, message)
      {:error, message} -> send_resp(conn, 500, message)
    end
  end
end
