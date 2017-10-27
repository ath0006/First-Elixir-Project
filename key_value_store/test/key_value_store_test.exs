defmodule KeyValueStoreTest do
  use ExUnit.Case
  doctest KeyValueStore

  test "greets the world" do
    assert KeyValueStore.hello() == :world
  end

  #Failing test

  test "fails" do
    assert KeyValueStore.hello() == :andrew
  end
end
