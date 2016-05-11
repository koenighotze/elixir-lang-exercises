defmodule Chapter22.BlobTest do
  use ExUnit.Case

  test "using blob" do
    blob = %Chapter22.Blob{content: 123}

    assert blob.content == 123
  end
end
