# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config
config :weather_conditions, http_timeout: 2000
# logging below info will not be compiled into code
config :logger, compile_time_purge_level: :info

import_config "#{Mix.env}.exs"
