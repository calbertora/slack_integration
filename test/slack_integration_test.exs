defmodule SlackIntegrationTest do
  use ExUnit.Case
  doctest SlackIntegration

  test "greets the world" do
    assert SlackIntegration.hello() == :world
  end
end
