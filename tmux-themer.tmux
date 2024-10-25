#!/usr/bin/env bash

source "./utils.sh"

main () {
  debug "hello world!"

  local bash_dir="$(get_bash_dir)"

  seto "@spotify" "$(sh '$bash_dir/providers/spotify.sh')"
}

main
