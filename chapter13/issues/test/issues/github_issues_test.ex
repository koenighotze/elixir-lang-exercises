defmodule Issues.GithubIssuesTest do
  use ExUnit.Case

  import Issues.GithubIssues, [:functions]


  test "build github url" do
    assert "https://api.github.com/repos/user/project/issues" == build_github_url("user", "project")
  end

  test "handle error response" do
    resp = %{ status_code: 503, body: "anything"}

    assert {:error, "anything" } == handle_response(resp)
  end

  test "handle success response" do
    resp = %{ status_code: 200, body: "anything"}

    assert {:ok, "anything" } == handle_response(resp)
  end
end
