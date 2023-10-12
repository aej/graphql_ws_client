defmodule GraphqlWsClientTest do
  use ExUnit.Case
  doctest GraphqlWsClient

  test "greets the world" do
    assert GraphqlWsClient.hello() == :world
  end
end
