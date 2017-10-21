defmodule KEY_VALUE_STORE.BucketTest do
  use ExUnit.Case, async: true

  test "stores values by key" do
    {:ok, bucket} = start_supervised KEY_VALUE_STORE.Bucket
    assert KEY_VALUE_STORE.Bucket.get(bucket, "milk") == nil

    KEY_VALUE_STORE.Bucket.put(bucket, "milk", 3)
    assert KEY_VALUE_STORE.Bucket.get(bucket, "milk") == 3
  end
end
