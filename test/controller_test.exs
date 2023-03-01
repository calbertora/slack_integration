defmodule SlackIntegrationControllerTest do
  use ExUnit.Case
  import Mock

  alias SlackIntegration.Web.Controller

  describe "Controller responses" do

    test "controller does not process the body" do
      body = %{"Type" => "NotProcess"}

      assert Controller.process_message(body) == {:error, "Not a spam message"}
    end

    test "controller sends message" do
      with_mocks [
        {SlackIntegration.Slack, [], send_message: fn _ -> {:ok, "test"} end}
      ] do
        body = %{"Type" => "SpamNotification"}

      assert Controller.process_message(body) == {:ok, "Spam message processed"}
      end
    end

    test "controller sends message with slack error" do
      with_mocks [
        {SlackIntegration.Slack, [], send_message: fn _ -> {:error, "test"} end}
      ] do
        body = %{"Type" => "SpamNotification"}

      assert Controller.process_message(body) == {:error, "test"}
      end
    end
  end

end
