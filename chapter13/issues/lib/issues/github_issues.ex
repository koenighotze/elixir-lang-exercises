defmodule Issues.GithubIssues do
  @moduledoc false
  @timeout_millis 3000

  @user_agent [ { "User-agent", "Elixir foo@bar.com" }]

  @http_ok 200

  def fetch(user, project) do
    build_github_url(user, project)
    |> HTTPoison.get(@user_agent, [timeout: @timeout_millis])
    |> handle_response
  end

  def build_github_url(user, project) do
     a = "https://api.github.com/repos/#{user}/#{project}/issues"
     IO.puts("#{a}")
     a
  end

  def handle_response({:ok, %HTTPoison.Response{ status_code: @http_ok, body: body }}), do: {:ok, :jsx.decode(body) }
  def handle_response({:ok, %HTTPoison.Response{ status_code: status, body: body }}) do
    body
      |> :jsx.decode
      |> report_error

    #  {:error, report_error(:jsx.decode(body)) }
  end
  def handle_response({:error, error}), do: {:error, error.reason}

  def report_error({:error, data}) do
    message = data
    |> List.keyfind("message", 0)

    IO.puts("Error fetching data: #{message}")
    System.halt(2)
  end
end
