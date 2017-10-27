defmodule KEY_VALUE_STORE.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = start_supervised(KEY_VALUE_STORE.Bucket)
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert KEY_VALUE_STORE.Bucket.get(bucket, "milk") == nil

    KEY_VALUE_STORE.Bucket.put(bucket, "milk", 3)
    assert KEY_VALUE_STORE.Bucket.get(bucket, "milk") == 3
  end
  
  test "removes key", %{bucket: bucket} do
    assert KEY_VALUE_STORE.Bucket.get(bucket, "milk") == nil

    KEY_VALUE_STORE.Bucket.put(bucket, "milk", 3)
    assert KEY_VALUE_STORE.Bucket.delete(bucket, "milk") == 3
    assert KEY_VALUE_STORE.Bucket.get(bucket, "milk") == nil
  end
end
