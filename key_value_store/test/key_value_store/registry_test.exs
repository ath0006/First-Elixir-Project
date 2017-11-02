defmodule KEY_VALUE_STORE.RegistryTest do
    use ExUnit.Case, async: true

    setup do
      {:ok, registry} = start_supervised KEY_VALUE_STORE.Registry
      %{registry: registry}
    end

    test "spawns buckets", %{registry: registry} do
      assert KEY_VALUE_STORE.Registry.lookup(registry, "shopping") == :error

      KEY_VALUE_STORE.Registry.create(registry, "shopping")
      assert {:ok, bucket} = KEY_VALUE_STORE.Registry.lookup(registry, "shopping")

      KEY_VALUE_STORE.Bucket.put(bucket, "milk", 1)
      assert KEY_VALUE_STORE.Bucket.get(bucket, "milk") == 1
    end

    test "removes buckets on exit", %{registry: registry} do
      KEY_VALUE_STORE.Registry.create(registry, "shopping")
      {:ok, bucket} = KEY_VALUE_STORE.Registry.lookup(registry, "shopping")
      Agent.stop(bucket)
      assert KEY_VALUE_STORE.Registry.lookup(registry, "shopping") == :error
    end

    test "removes bucket on crash", %{registry: registry} do
      KEY_VALUE_STORE.Registry.create(registry, "shopping")
      {:ok, bucket} = KEY_VALUE_STORE.Registry.lookup(registry, "shopping")

      #Stop the bucket with non-normal reason
      Agent.stop(bucket, :shutdown)
      assert KEY_VALUE_STORE.Registry.lookup(registry, "shopping") == :error
    end
end