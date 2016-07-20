defmodule Chapter18.OtpApplications3.StashServerTest do
  use ExUnit.Case, async: true

  import Chapter18.OtpApplications3.StashServer

  test "store and fetch" do
    store_stack([1, 2, 3, 4, 5])

    assert [1, 2, 3, 4, 5] == fetch_stack
  end


end
