defmodule GraphqlWsClient do
  use GenServer

  alias Absinthe.GraphqlWS.Client

  @endpoint "http://localhost:4000/graphql-ws"

  def start() do
    Client.start(@endpoint)
  end

  def init(args) do
    {:ok, args}
  end

  def stop(client) do
    Client.close(client)
  end

  def ping(client) do
    Client.push(client, %{opcode: "ping", payload: %{}})
  end

  @gql """
  mutation Login($input: LoginInput!) {
    login(input: $input) {
      accessToken
      refreshToken
    }
  }
  """
  def login(client) do
    {:ok, body} = Client.query(client, @gql, input: %{"emailOrUsername" => "lebron@example.com", "password" => "password"})

    body
  end

  @gql """
  query GetSomething($id: UUID!) {
    thing(id: $id) {
      id
      name
    }
  }
  """
  def get_thing(client, thing_id) do
    case Client.query(client, @gql, id: thing_id) do
      {:ok, %{"data" => %{"thing" => nil}}} ->
        nil

      {:ok, %{"data" => %{"thing" => result}}} ->
        {:ok, result}

      {:ok, errors} when is_list(errors) ->
        nil
    end
  end

  @gql """
  subscription Message {
    message
  }
  """
  # handler is a pid for a process that implements `handle_info/4` as below
  def message(client) do
    {:ok, pid} = InfoGenserver.start_link(nil)
    Client.subscribe(client, @gql, %{}, pid)
  end

end