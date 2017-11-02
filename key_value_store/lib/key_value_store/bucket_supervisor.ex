defmodule KEY_VALUE_STORE.BucketSupervisor do 
  use Supervisor 

  #A simple module attribute that stores the supervisor name
  @name KEY_VALUE_STORE.BucketSupervisor

  def start_link(_opts) do
    Supervisor.start_link(__MODULE__, :ok, name: @name)
  end

  def start_bucket do
    Supervisor.start_child(@name, [])
  end

  def init(:ok) do
    Supervisor.init([KEY_VALUE_STORE.Bucket], strategy: :simple_one_for_one)
  end

end