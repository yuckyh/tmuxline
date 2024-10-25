#!/usr/bin/env bash

source "./utils.sh"

main () {
  debug "hello world!"

  register_placeholder "spotify" "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/providers/spotify.sh"
}

main
