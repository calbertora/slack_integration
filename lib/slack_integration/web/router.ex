defmodule SlackIntegration.Web.Router do
  use Plug.Router

  alias SlackIntegration.Web.Controller

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug :match
  plug :dispatch

  post "/api/process-message" do
    body = conn.body_params

    case Controller.process_message(body) do
      {:ok, message} -> send_resp(conn, 200, message)
      {:error, message} -> send_resp(conn, 400, message)
    end
  end

  match _ do
    send_resp(conn, 404, "Oops!")
  end
end
