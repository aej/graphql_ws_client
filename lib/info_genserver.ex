defmodule InfoGenserver do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def init(_) do
    {:ok, nil}
  end

  def handle_info(msg, state) do
    IO.inspect(msg, label: :MSG)
    {:noreply, state}
  end
end