defmodule KEY_VALUE_STORE.Supervisor do
    use Supervisor

    def start_links(opts) do
      Supervisor.start_link(__MODULE__, :ok, opts)
    end

    def init(:ok) do
      children = [
          KEY_VALUE_STORE.Registry
      ]

      Supervisor.init(children, strategy: :one_for_one)

    end
end