defmodule WallyWeb.Server do
  def child_spec(_opts) do
    Plug.Cowboy.child_spec(Application.get_env(:slack_integration, :web))
  end
end
