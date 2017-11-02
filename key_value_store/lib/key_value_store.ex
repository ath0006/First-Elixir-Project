defmodule KEY_VALUE_STORE do
  use Application
  @moduledoc """
  Documentation for KeyValueStore.
  """

  def start(_type, _args) do
    KEY_VALUE_STORE.Supervisor.start_link(name: KEY_VALUE_STORE.Supervisor)
  end
end
