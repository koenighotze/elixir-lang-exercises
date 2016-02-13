defmodule Issues.GithubIssuesTest do
  use ExUnit.Case

  import Issues.GithubIssues, [:functions]


  test "build github url" do
    assert "https://api.github.com/repos/user/project/issues" == build_github_url("user", "project")
  end

  test "handle error response" do
    #    assert {:error, "anything" } == handle_response({:ok, %HTTPoison.Response{ status_code: 503, body: "anything" }})
    # cannot test yet..
  end

  test "handle success response" do
    resp = %{ status_code: 200, body: "anything"}

    assert  {:ok, [{"anything", 2}]} == handle_response({:ok, %HTTPoison.Response{ status_code: 200, body: "{\"anything\": 2}" }})
  end

  test "report_error" do
    assert "Not Found" == extract_error([{"message", "Not Found"}, {"documentation_url", "https://developer.github.com/v3"}])
  end

end
