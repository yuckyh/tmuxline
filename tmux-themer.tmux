#!/usr/bin/env bash

source "./utils.sh"
source "./providers/spotify.sh"

main () {
  local bash_dir="$(get_bash_dir)"

  seto "@spotify" "$(get_spotify)"
}

main
