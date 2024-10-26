#!/usr/bin/env bash

source "./utils.sh"

main () {
  local bash_dir="$(get_bash_dir)"
  local spotify_provider="$bash_dir/providers/spotify.sh"

  register_module_placeholder "spotify" $spotify_provider
}

main
