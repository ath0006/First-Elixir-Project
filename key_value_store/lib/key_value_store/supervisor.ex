defmodule KEY_VALUE_STORE.Supervisor do
    use Supervisor

    def start_link(opts) do
      Supervisor.start_link(__MODULE__, :ok, opts)
    end

    def init(:ok) do
      children = [
          {KEY_VALUE_STORE.Registry, name: KEY_VALUE_STORE.Registry}
      ]

      Supervisor.init(children, strategy: :one_for_one)

    end
end