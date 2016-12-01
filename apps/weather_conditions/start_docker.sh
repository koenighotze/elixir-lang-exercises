#!/bin/sh
docker run -ti --name=elixir-weather-conditions -v  $(pwd):/home/elixir/src/ koenighotze/elixir /bin/bash
