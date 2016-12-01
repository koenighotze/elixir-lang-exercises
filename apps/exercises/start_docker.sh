#!/bin/sh
docker run -ti --name=elixir-lang -v $(pwd):/home/elixir/src/ koenighotze/elixir /bin/bash
