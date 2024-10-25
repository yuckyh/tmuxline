#!/usr/bin/env sh

source "./utils.sh"

main () {
  debug "hello world!"

  register_placeholder "spotify" "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/modules/spotify.sh"
}

main
