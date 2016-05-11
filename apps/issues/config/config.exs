use Mix.Config

config :issues, github_url: "https://api.github.com/repos"
config :issues, http_timeout: 2000
# logging below info will not be compiled into code
config :logger, compile_time_purge_level: :info

import_config "#{Mix.env}.exs"
